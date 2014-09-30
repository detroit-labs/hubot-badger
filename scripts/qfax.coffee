# Description:
#   QFAX
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   qfax
#   
#
# Author:
#   nwest

module.exports = (robot) ->
  robot.hear /qfax/, (msg) ->
    msg.send "does anyone know what qfax@detroitlabs.com is?"
