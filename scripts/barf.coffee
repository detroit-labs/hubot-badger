# Description:
#   Barf
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   barf
#
# Author:
#   macklinu

module.exports = (robot) ->
  robot.respond /barf/i, (msg) ->
    msg.send "https://twitter.com/JasonStolaruk/status/468797103129366528"
