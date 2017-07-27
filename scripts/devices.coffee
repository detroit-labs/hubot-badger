# Description:
#   Returns the status of all testing device
#
# Dependencies:
#   request
#
# Configuration:
#   None
#
# Commands:
#   hubot devices
#
# Author:
#   peike

request = require 'request'

formatMessage = (json) ->
  getIcon = (platform) -> if platform is "ANDROID" then ":android:" else ""
  getUser = (checkOutBy) -> if not checkOutBy then "" else " - #{checkOutBy}"
  getBatteryPercentage = (pct) -> if not pct || pct == -1 then "" else " :battery:" + pct * 100 + "%"
  result = ""
  for k,v of json
    icon = getIcon v.platform
    user = getUser v.checked_out_by
    battery = getBatteryPercentage v.last_known_battery
    result += "#{icon} #{v.brand_and_model}, #{v.version} #{v.screen_size}#{battery}#{user}\n"
  return result

module.exports = (robot) ->
  secret = process.env.HUBOT_DEVICES_FIREBASE_DATABASE_SECRET
  robot.respond /devices/i, (msg) ->
    options =
      method: 'GET'
      uri: "https://device-manager-c5b89.firebaseio.com/devices.json?auth=#{secret}"
      json: true
    request options, (error, response, json) ->
      { statusCode, statusMessage } = response
      switch
        when error then msg.send "Error: #{error.message}"
        when statusCode is 200 then msg.send formatMessage json
        when statusCode >= 300 then msg.send "#{statusCode} #{statusMessage}"
