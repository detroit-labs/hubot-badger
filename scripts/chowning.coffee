# Description:
#   Matt Chowning
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
#   nwest

module.exports = (robot) ->
  robot.hear /Matt Chowning/i, (msg) ->
    msg.send "Did you mean Matt Tyndall?"
