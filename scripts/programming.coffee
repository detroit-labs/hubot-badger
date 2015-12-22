# Description:
#   Programming
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot programming - brings up programming.gif
#
# Author:
#   dpoggi

module.exports = (robot) ->
  robot.respond /programming/i, (msg) ->
    msg.send 'http://i.imgur.com/fx7mMeB.gif'
