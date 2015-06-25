# Description:
#   gets a randomclass name from classnamer.com
#
# Dependencies:
#   request
#
# Configuration:
#
# Commands:
#
# none yet
#
request = require "request"

module.exports = (robot) ->

  robot.respond /classname/i, (msg) ->
    request 'http://www.classnamer.com/index.txt' , (error, response, body) ->
      msg.send body
