# Description:
#   Pulls a random image from a subreddit
#
# Dependencies:
#   request
#
# Configuration:
#   None
#
# Commands:
#   hubot reddit catgifs top month
#
# Author:
#   nwest
request = require "request"
 
module.exports = (robot) ->
  robot.respond /reddit (\w+) ?(top|hot)? ?(month|year|day|week|today)?/i, (msg) ->
    subreddit = msg.match[1]
    order = msg.match[2]
    time = msg.match[3]
    
    if subreddit.toLowerCase() is "spacedicks"
      msg.send "Nope."
      return
 
    url = "http://reddit.com/r/#{subreddit}.json?"
 
    if order
      url = url.concat("sort=#{order}")
      if time
        url = url.concat("&t=#{time}")
    
    request url, (error, response, body) ->
      if (!error && response.statusCode == 200)
        json = JSON.parse(response.body)
        if json.data?
          posts = json.data.children
          if posts?
            msg.send randomURL(posts)
        else
          msg.send "weird response. check your spelling?"
      else
        msg.send "#{response.statusCode} probably hitting reddit too much, or reddit is down"
 
  i = 0
  randomURL = (posts) ->
 
    if i is posts.length
      i = 0
      return "no images found"
 
    url = posts[Math.floor(Math.random()*posts.length)].data.url
    if url.match(/http\:\/\/(?:|.+).+\.(png|jpeg|jpg|gif)/i)
      i = 0
      return url
    else
      i++
      randomURL(posts)
