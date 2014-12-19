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
#   hubot redbull
#   hubot bull
#
# Author:
#   nwest

module.exports = (robot) ->
  robot.respond /(?:red)?(?: )?bull/i, (msg) ->
    msg.send "http://i.imgur.com/HYWSAJz.gif"
