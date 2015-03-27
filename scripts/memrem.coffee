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
#   hubot rem <keyword> <resource> - saves resource to specified keyword
#
# Author:
#   snibbles

memrem_id = (keyword) ->
  "memrem_#{keyword}"

module.exports = (robot) ->
  robot.respond /mem ([a-zA-Z]*)$/i, (msg) ->
    keyword = msg.match[1]
    url = msg.robot.brain.get(memrem_id(keyword))
    if (url)
      msg.send url
    else
      msg.send "we does not has #{keyword}"

  robot.respond /rem ([a-zA-Z]*) (.*)/i, (msg) ->
    keyword = msg.match[1]
    url = msg.match[2]
    msg.robot.brain.set(memrem_id(keyword), url)
    msg.send "saved #{url} as #{keyword}"