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
    msg.send "https://s3.amazonaws.com/uploads.hipchat.com/31582/211417/kAMyD3ixawKfaVX/chowdy.png"
