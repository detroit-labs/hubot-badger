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
    msg.send "(rebeccablack)"
