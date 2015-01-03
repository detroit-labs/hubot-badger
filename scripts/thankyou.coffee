# Description:
#   Thank You
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
#   Scumbag Joe

module.exports = (robot) ->
  robot.hear /\(thank you\)|(\bthank you\b)/i, (msg) ->
    if msg.match[1] is "thank you"
      msg.send "https://s3.amazonaws.com/uploads.hipchat.com/31582/209877/5xpLrqT70xRfInI/dwy0i4evvxsvt1rf6ehi.gif"
