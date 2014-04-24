# Description:
#   A way to interact with the Google Images API.
#
# Commands:
#   hubot image me <query> - The Original. Queries Google Images for <query> and returns a random top result.
#   hubot animate me <query> - The same thing as `image me`, except adds a few parameters to try to return an animated GIF instead.
#   hubot mustache me <url> - Adds a mustache to the specified URL.
#   hubot mustache me <query> - Searches Google Images for the specified query and mustaches it.
#   hubot set safesearch [on|off] - set whether safe search is enabled for this room
#   hubot get safesearch - return whether safe search is enabled for this room
#   hubot <query> bomb <count> - return a bomb of images, default 5 images returned
#   hubot <query> abomb <count> - return a bomb of animate images, default 5 images returned
#   hubot <query> mbomb <count> - return a bomb of mustached people, default 5 images returned
#   hubot imgthat - return an image of the last mentioned phrase
#   hubot animatethat - return a animated image of the last mentioned phrase

default_bomb = 3

module.exports = (robot) ->

  robot.respond /set safe(?:-| )?search (on|off)/i, (msg) ->
    msg.robot.brain.set safesearch_lookup_id(msg), msg.match[1].toLowerCase()
    msg.send "safesearch is turned " + msg.match[1];

  robot.respond /get safe(-| )?search/i, (msg) ->
    msg.send "safesearch is turned " + msg.robot.brain.get safesearch_lookup_id(msg)

  robot.respond /(?:image|img)(?: me)? (.*)/i, (msg) ->
    imageMe msg, msg.match[1], 1, (url) ->
      msg.send url

  robot.respond /animate(?: me)? (.*)/i, (msg) ->
    animateMe msg, msg.match[1], 1, (url) ->
      msg.send url

  robot.respond /(?:mo?u)?sta(?:s|c)he?(?: me)? (.*)/i, (msg) ->
    mustachMe msg, msg.match[1], (url) ->
      msg.send url
    
  robot.respond /(.*) bomb( (\d+))?/i, (msg) ->
    count = msg.match[3] || default_bomb
    imageMe msg, msg.match[1], count, (url) ->
      msg.send url
      
  robot.respond /(.*) abomb( (\d+))?/i, (msg) ->
    count = msg.match[3] || default_bomb
    animateMe msg, msg.match[1], count, (url) ->
      msg.send url
    
  robot.respond /(.*) mbomb( (\d+))?/i, (msg) ->
    count = msg.match[3] || default_bomb
    faceMe msg, msg.match[1], count, (url) ->
      mustachMe msg, url, (mustachUrl) ->
        msg.send mustachUrl

  imagethat=/img( )?that/i

  robot.respond imagethat, (msg) ->
    imageMe msg, msg.robot.brain.get(imgthat_lookup_id(msg)), 1, (url) ->
      msg.send url
		
  animatethat=/animate( )?that/i
  
  robot.respond animatethat, (msg) ->
    animateMe msg, msg.robot.brain.get(imgthat_lookup_id(msg)), 1, (url) ->
      msg.send url
      
  robot.hear /.*/, (msg) ->
    message = msg.match[0]
    if ( !imagethat.test(message ) && !animatethat.test(message))
      msg.robot.brain.set imgthat_lookup_id(msg), message 
      
mustachMe = (msg, query, cb) ->
  type = Math.floor(Math.random() * 3)
  mustachify = "http://mustachify.me/#{type}?src="
  
  if query.match /^https?:\/\//i
    cb "#{mustachify}#{query}"
  else
    faceMe msg, query, 1, (image) ->
      null_check_callback(image, cb)

imageMe = (msg, query, count, cb) ->
  googleApi msg, imageQuery(msg, query, ''), count, (image) ->
      null_check_callback(image, cb)

animateMe = (msg, query, count, cb) ->
  googleApi msg, imageQuery(msg, query, 'animated'), count, (image) ->
      null_check_callback(image, cb)

faceMe = (msg, query, count, cb) ->
  googleApi msg, imageQuery(msg, query, 'face'), count, cb
  
null_check_callback = (image, cb) ->
  if image?
    cb image
  else
    cb 'No Images Found'
  
imageQuery = (msg, query, type) ->
  safe_search_off = msg.robot.brain.get(safesearch_lookup_id(msg)) == "off"
  cb = animated if typeof animated == 'function'
  cb = faces if typeof faces == 'function'
  q = v: '1.0', rsz: 8, q: query, safe: 'active'
  q.safe = 'off' if safe_search_off is true
  q.imgtype = type
  q
  
googleApi = (msg, q, count, cb) ->
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      number_returned = 0
      for i in [1..count] by 1
        if images?.length > 0
          cb randomImageUrl(msg, images)
          number_returned++
        else
          if number_returned is 0
            cb null
          break
    
randomImageUrl = (msg, images) ->
  image = msg.random images
  images.splice(images.indexOf(image), 1)
  "#{image.unescapedUrl}#.png"
		
lookup_id = (msg) ->
  (msg.envelope.room or msg.envelope.user.id)
	
safesearch_lookup_id = (msg) ->
	'safesearch_' + lookup_id(msg)
	
imgthat_lookup_id = (msg) ->
	'imgthat_' + lookup_id(msg)