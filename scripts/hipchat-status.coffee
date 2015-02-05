# Description:
#   Hipchat Status
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
  robot.respond /hipchat status/i, (msg) ->
    robot.http("https://status.hipchat.com/api/v2/status.json").get() (err, res, body) ->
      hipchatStatus = JSON.parse body
      msg.send hipchatStatus.status.description
