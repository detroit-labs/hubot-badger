# Description:
#   Get redis data for a given key
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot key <some key>
#
# Author:
#   nwest

module.exports = (robot) ->
  robot.respond /key (.*)/i, (msg) ->
      msg.send JSON.stringify robot.brain.get msg.match[1]
