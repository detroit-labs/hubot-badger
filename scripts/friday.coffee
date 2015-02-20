# Description:
#   Friday
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
  robot.hear /friday/i, (msg) ->
    if Math.random() > .75
      msg.send "(rebeccablack)"
