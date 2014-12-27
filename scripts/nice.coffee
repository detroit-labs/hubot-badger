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
  robot.hear /\(nice\)|(\bnice\b)/i, (msg) ->
    if msg.match[1] is "nice"
      msg.send "(nice)"
