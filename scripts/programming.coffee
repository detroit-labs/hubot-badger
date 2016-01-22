# Description:
#   Programming!!! (and refactoring)
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot programming - brings up programming.gif
#   hubot refactoring - brings up refactoring.gif
#
# Author:
#   dpoggi

module.exports = (robot) ->
  robot.respond /programming/i, (msg) ->
    msg.send 'http://i.imgur.com/fx7mMeB.gif'

  robot.response /refactoring/i, (msg) ->
    msg.send 'https://i.imgur.com/muaNCBk.gif'
