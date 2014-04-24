unknown_messages = [ 
  "They're a lazy ass", 
  "I'm not their mother", 
  "(poo)", 
  "They forgot what day it is",
  "They are swimming in garlic sauce" 
]

module.exports = (robot) ->
  
  robot.respond /notwfh/i, (msg) ->
    msg.robot.brain.remove wfh_id(msg)
  
  robot.respond /wfh (.*)/i, (msg) ->
    msg.robot.brain.set wfh_id(msg), msg.match[1]
    
  robot.hear /why is (.*) not here/i, (msg) ->
    reason = msg.robot.brain.get msg.match[1]
    if reason
      msg.send reason
    else
      msg.send msg.random(unknown_messages)
  
wfh_id = (msg) ->
  '@' + msg.envelope.user.mention_name