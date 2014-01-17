# Description:
#   A way to interact with the Google Images API.
#
# Commands:
#   hubot image me <query> - The Original. Queries Google Images for <query> and returns a random top result.
#   hubot animate me <query> - The same thing as `image me`, except adds a few parameters to try to return an animated GIF instead.
#   hubot mustache me <url> - Adds a mustache to the specified URL.
#   hubot mustache me <query> - Searches Google Images for the specified query and mustaches it.

module.exports = (robot) ->

  robot.respond /set safe(-| )?search (on|off)/i, (msg) ->
    msg.robot.brain.set lookup_id(msg), msg.match[2].toLowerCase()
    msg.send "safesearch is turned " + msg.match[2];

  robot.respond /get safe(-| )?search/i, (msg) ->
    msg.send "safesearch is turned " + msg.robot.brain.get lookup_id(msg)

  robot.respond /(image|img)( me)? (.*)/i, (msg) ->
    imageMe msg, msg.match[3], 1, (url) ->
      msg.send url

  robot.respond /animate( me)? (.*)/i, (msg) ->
    animateMe msg, msg.match[3], 1, (url) ->
      msg.send url

  robot.respond /(?:mo?u)?sta(?:s|c)he?(?: me)? (.*)/i, (msg) ->
    mustachMe msg, msg.match[1], (url) ->
      msg.send url
    
  robot.respond /(.*) bomb( (\d+))?/i, (msg) ->
    count = msg.match[3] || 5
    imageMe msg, msg.match[1], count, (url) ->
      msg.send url
      
  robot.respond /(.*) abomb( (\d+))?/i, (msg) ->
    count = msg.match[3] || 5
    animateMe msg, msg.match[1], count, (url) ->
      msg.send url
    
  robot.respond /(.*) mbomb( (\d+))?/i, (msg) ->
    count = msg.match[3] || 5
    faceMe msg, msg.match[1], count, (url) ->
      mustachMe msg, url, (mustachUrl) ->
        msg.send mustachUrl
      
mustachMe = (msg, query, cb) ->
  type = Math.floor(Math.random() * 3)
  mustachify = "http://mustachify.me/#{type}?src="
  
  if query.match /^https?:\/\//i
    cb "#{mustachify}#{query}"
  else
    faceMe msg, query, 1, (images) ->
      cb "#{mustachify}#{randomImageUrl(msg, images)}"

imageMe = (msg, query, count, cb) ->
  googleApi msg, imageQuery(msg, query, ''), (images) ->
    for i in [1..count] by 1
      cb randomImageUrl(msg, images)

animateMe = (msg, query, count, cb) ->
  googleApi msg, imageQuery(msg, query, 'animated'), (images) ->
    for i in [1..count] by 1
      cb randomImageUrl(msg, images)

faceMe = (msg, query, count, cb) ->
  googleApi msg, imageQuery(msg, query, 'face'), (images) ->
    for i in [1..count] by 1
      cb randomImageUrl(msg, images)

imageQuery = (msg, query, type) ->
  safe_search_off = msg.robot.brain.get(lookup_id(msg)) == "off"
  cb = animated if typeof animated == 'function'
  cb = faces if typeof faces == 'function'
  q = v: '1.0', rsz: 8, q: query, safe: 'active'
  q.safe = 'off' if safe_search_off is true
  q.imgtype = type
  q
  
googleApi = (msg, q, cb) ->
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        cb images  
    
randomImageUrl = (msg, images) ->
  image = msg.random images
  "#{image.unescapedUrl}#.png"
		
lookup_id = (msg) ->
  'safesearch_' + (msg.envelope.room or msg.envelope.user.id)