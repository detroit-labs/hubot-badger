# Description:
#    Jason Petterson is the funniest guy I know
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
#   Jake Payton

 module.exports = (robot) ->
   robot.hear /(damn it|damnit|dammit|damnit) jeff (kelley|kelly)/i, (msg) ->
     msg.send "I don't get it"
