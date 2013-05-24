
URL  = require "url"
hubotURL  = URL.parse(process.env.HUBOT_JANKY_URL)
HTTP = require "http"


defaultOptions = () ->
    template = 
        host: "alpha.detroitlabs.com"
        port: 3000
        method: "POST"
        headers:
          "Content-Type": "application/json"
		  
post = (options, params, cb) ->
    bodyParams = JSON.stringify(params)
    req = HTTP.request options, (res) ->
      body = ""
      res.setEncoding("utf8")
      res.on "data", (chunk) ->
        body += chunk
      res.on "end", () ->
        cb null, res.statusCode, body
    req.on "error", (e) ->
      console.log(e)
      cb e, 500, "Client Error"
    req.end(bodyParams)
	
postQueue = (params) ->
	options = defaultOptions()
	options.path = "/queue/add"
	post options, params, (err, statusCode, body) ->
		console.log "Post image response status code: " + statusCode
		
		

postOverride = (params, cb) ->
	options = defaultOptions()
	options.path = "/queue/override"
	post options, params, (err, statusCode, body) ->
		console.log "Post image response status code: " + statusCode

getCIStatus = (cb) -> 
  auth = new Buffer(hubotURL.auth).toString("base64")
  options =
    host: hubotURL.hostname
    port: hubotURL.port || 80
    path: hubotURL.pathname
    headers:
      "Authorization": "Basic #{auth}"
  req = HTTP.request options, (res) ->
    body = ""
    res.setEncoding("utf8")
    res.on "data", (chunk) ->
      body += chunk
    res.on "end", () ->
      cb null, res.statusCode, body
  req.on "error", (e) ->
    console.log(e)
    cb e, 500, "Client Error"
  req.end()

parseCIStatus = (text) ->
	linesArray = text.split /\n/

	finalArray = []

	data = []

	for line in linesArray
		rowArray = line.split /\s+/
		#it's supposed to have 4 elements, fix if larger
		while rowArray.length > 4
			rowArray[1] += " " + rowArray[2]
			rowArray.splice(2,1)
			
		data.push 
			name: rowArray[0] 
			status: rowArray[1]
			prettyName: rowArray[2]
			repo: rowArray[3]
	
	broadsideItem = 
		moduleType: "cinderStatus"
		email: "cinderbot@detroitlabs.com"
		url: ""
		timeToLive: 0
		data: data

module.exports = (robot) ->
	robot.respond /COOLSTATUS$/i, (msg) ->
		getCIStatus (err, statusCode, body) ->
			if statusCode == 200
				bodyObject = parseCIStatus body
				bodyObject.timeToLive = -1
				postQueue bodyObject
			else
				msg.send "The status did not get added to the broadside queue. This is awful. Sorry :-("
				
	robot.respond /COOLSTATUSNOW$/i, (msg) ->
		getCIStatus (err, statusCode, body) ->
			if statusCode == 200
				bodyObject = parseCIStatus body
				bodyObject.timeToLive = 8000
				postOverride bodyObject
			else
				msg.send "Failed to interrupt the images you normally see. Sorry, maybe later? :-("

