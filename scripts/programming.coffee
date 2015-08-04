# Description:
#   Programming
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
#   dpoggi

module.exports = (robot) ->
  robot.hear /\.programming/i, (msg) ->
    msg.send "https://s3.amazonaws.com/uploads.hipchat.com/31582/2534438/304yPKsdFtwQyCw/programming.gif"
