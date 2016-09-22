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
    if msg.match[1] is 'thank you'
      if Math.random() > .98
        msg.send 'http://i.imgur.com/8Zpw6hb.gif'
