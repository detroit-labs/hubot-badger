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
  result = ""
  for k,v of json
    icon = getIcon v.platform
    user = getUser v.checked_out_by
    result += "#{icon} #{v.brand_and_model}, #{v.version}, #{v.screen_size}#{user}\n"
  return result

module.exports = (robot) ->
  robot.respond /devices/i, (msg) ->
    options =
      method: 'GET'
      uri: 'https://device-manager-c5b89.firebaseio.com/devices.json'
      json: true
    request options, (error, response, json) ->
      { statusCode, statusMessage } = response
      switch
        when error then msg.send "Error: #{error.message}"
        when statusCode is 200 then msg.send formatMessage json
        when statusCode >= 300 then msg.send "#{statusCode} #{statusMessage}"
