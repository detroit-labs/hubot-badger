# Description:
#   gets a randomclass name from classnamer.com
#
# Dependencies:
#   request
#
# Configuration:
#
# Commands:
#   hubot classname - generates class names suitable for enterprise-friendly object-oriented programming languages
#
# none yet
#
request = require "request"

module.exports = (robot) ->

  robot.respond /classname (.+)|classname/i, (msg) ->
    generator = msg.match[1]
    url = 'http://www.classnamer.com/index.txt'
    if generator? and generator is "spring" or generator is "generic"
      url += '?generator='+generator

    request url, (error, response, body) ->
        msg.send body
