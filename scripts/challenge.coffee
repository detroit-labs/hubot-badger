# Description:
#   Have hubot keep track of and display challenge leaderboard
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot <type> challenge
#   hubot <type> challenge set <who>:<count>
#   
# Author:
#   laurenmalatesta


createKey = (type) ->
  "challenge_" + type


challengeStatus = (msg, key) ->
  challenge = msg.robot.brain.get key

  "The #{challenge.type} challenge leader is #{challenge.who} at #{challenge.count}."


module.exports = (robot) ->
  
  robot.respond /(.+) challenge set (.+):(\d+)/i, (msg) ->
    challenge = 
      type:  msg.match[1]
      who:   msg.match[2]
      count: msg.match[3]

    key = createKey challenge.type

    msg.robot.brain.set key, challenge
    
    msg.send challengeStatus msg, key

  
  robot.respond /(.+) challenge$/i, (msg) ->
    key = createKey msg.match[1]

    msg.send challengeStatus msg, key