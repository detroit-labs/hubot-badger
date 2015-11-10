# Description:
#   Remember
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot mem <keyword> - prints out saved resource
#   hubot get <keyword> - prints out saved resource
#   hubot rem <keyword> <resource> - saves resource to specified keyword
#   hubot set <keyword> <resource> - saves resource to specified keyword
#
# Author:
#   snibbles

memremId = (keyword) -> "memrem_#{keyword}"

onGet = (msg) ->
  keyword = msg.match[2]
  key = memremId keyword
  value = msg.robot.brain.get key
  if value
    msg.send value
  else
    msg.send "we does not has #{keyword}"

onSet = (msg) ->
  keyword = msg.match[2]
  value = msg.match[3]
  key = memremId keyword
  msg.robot.brain.set key, value
  msg.send "saved #{value} as #{keyword}"

module.exports = (robot) ->
  robot.respond /(mem|get) (?!safesearch)([a-zA-Z]*)$/i, onGet
  robot.respond /(rem|set) (?!safesearch)([a-zA-Z]*) (.*)/i, onSet
