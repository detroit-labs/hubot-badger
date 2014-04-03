# Description:
#   RED BULLL!!!!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   redbull
#   bull
#
# Author:
#   nwest

module.exports = (robot) ->
  robot.respond /(?:red)?(?: )?bull/i, (msg) ->
    msg.send "http://i.imgur.com/HYWSAJz.gif"
