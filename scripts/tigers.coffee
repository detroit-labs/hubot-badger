# Description:
#   Returns this week's Tigers' schedule
#
# Dependencies:
#   moment, request
#
# Configuration:
#   None
#
# Commands:
#   hubot tigers
#
# Author:
#   macklinu

moment = require 'moment'
request = require 'request'

formatMessage = (json) ->
  embolden = (str) -> "*#{str}*"
  isAway = (opponent) -> opponent.startsWith('at')
  formatDate = (date) -> moment(date, 'YYYY-MM-DD').format('ddd MMM DD')
  formatTime = (time) -> if time then moment(time).format('h:mma') else 'TBD'
  json.map (obj) ->
    date = formatDate obj.date
    time = formatTime obj.time
    opponent = obj.opponent
    gameString = "#{date}, #{time} - #{opponent}"
    return if isAway(opponent) then gameString else embolden(gameString)
  .join '\n'

module.exports = (robot) ->
  robot.respond /tigers/i, (msg) ->
    # See https://github.com/macklinu/detroit-tigers-api for details
    options =
      method: 'GET'
      uri: 'http://detroit-tigers-api.herokuapp.com/v1/games/upcoming'
      json: true
    request options, (error, response, json) ->
      { statusCode, statusMessage } = response
      switch
        when error then msg.send "Error: #{error.message}"
        when statusCode is 200 then msg.send formatMessage json
        when statusCode >= 300 then msg.send "#{statusCode} #{statusMessage}"
