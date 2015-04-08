# Description:
#   Bundle of joy
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
#   macklinu

module.exports = (robot) ->
  robot.hear /(bundle of joy)/i, (msg) ->
    msg.send "http://i.imgur.com/qb61TFf.jpg"
