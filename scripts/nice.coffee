# Description:
#   Nice
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
#   Claud

module.exports = (robot) ->
  robot.hear /(nice)/i, (msg) ->
    msg.send "(nice)"
