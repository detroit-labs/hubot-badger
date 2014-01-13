# Description:
#   Lists (labs) custom emoticons
#
# Dependencies:
#   hipchatter
#
# Configuration:
#   HIPCHAT_API_V2_KEY - a HipChat API V2 key
#
# Commands:
#   hubot emoticons - lists (labs) custom emoticons
#
# Author:
#   macklinu

Hipchatter = require 'hipchatter'
hipchatter = new Hipchatter(process.env.HIPCHAT_API_V2_KEY)
 
module.exports = (robot) ->
  robot.respond /emoticons/i, (msg) ->
    hipchatter.emoticons {'type': 'group'}, (err, res) ->
      if not err
        emoticons = res.map (emoticon) -> 
          "#{emoticon.shortcut} (#{emoticon.shortcut})"
        msg.send emoticons.join('\n')
      else msg.send 'Couldn\'t get the emoticons (sadpanda)'