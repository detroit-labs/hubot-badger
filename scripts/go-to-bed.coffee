# Description:
#    Nighty Night
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   Jeff Kelley

 module.exports = (robot) ->
   robot.hear /(go to bed|goodnight|up late)/i, (msg) ->
     msg.send "http://i.imgur.com/tVrd0UA.jpg"
