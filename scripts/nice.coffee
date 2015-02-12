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
      if Math.random() > .66
        msg.send "(nice)"
