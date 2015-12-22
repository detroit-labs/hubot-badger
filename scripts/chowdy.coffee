# Description:
#   Chowdy
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   macklinu

module.exports = (robot) ->
  robot.hear /chowdy/i, (msg) ->
    msg.send 'http://i.imgur.com/FfsCG1n.png'
