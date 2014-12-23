# Description:
#   Make It So
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   make it so
#
# Author:
#   stkent

DECEMBER = 11

module.exports = (robot) ->
  robot.hear /make it so\b/i, (msg) ->
    currentDate = new Date()

    if currentDate.getMonth() is DECEMBER
      msg.send "http://i.imgur.com/U2tgKjM.jpg"
    else
      msg.send "http://i.imgur.com/rsXNr22.jpg"
