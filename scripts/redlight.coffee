# Description:
#   Turns the red siren light on or off
#
# Dependencies:
#   mqtt
#
# Configuration:
#
# Commands:
#
# hubot redlight - toggles the state of the redlight
#

topic = "toggle/red_alert"
mqtt = require("mqtt")
client = mqtt.connect('mqtt://broadsidetv.com')
lightActive = false

module.exports = (robot) ->
  robot.respond /redlight (.+)/i, (msg) ->
      duration = msg.match[1]
      client.publish topic, duration
      msg.send "running red light for "+duration+"ms"
