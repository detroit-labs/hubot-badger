# Description:
#   One Script To Rule Them All
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot listenFor <key> <percent%?> <response>
#   hubot respondTo <key> <percent%?> <response>
#
# Notes:
#
# Author:
#   maschall

global=@

brainKey = (topic, key) ->
  "ostrta-#{topic}-#{key.replace(/\s/g, '_')}"

@listenForKeys = () ->
  brainKey("listenFor", "")

@listenForKey = (key) ->
  brainKey("listenFor", key)
  
@listenForPercentKey = (key) ->
  brainKey("listenPercent", key)

@respondToKeys = () ->
  brainKey("respondTo", "")  

@respondToKey = (key) ->
  brainKey("respondTo", key)
  
@respondToPercentKey = (key) ->
  brainKey("respondPercent", key)

add = (robot, key, value) ->
  objects = fetch(robot, key)
  if !objects
    objects = []
  objects.push value
  remember(robot, key, objects)

remember = (robot, key, value) ->
  robot.brain.set(key, value)
  
fetch = (robot, key) ->
  robot.brain.get(key)
  
percentFromString = (percentString) ->
  parseInt(percentString, 10)
  
tellRobotWhatToDo = (robot, method, command, key) ->
  robot[method](new RegExp("(#{key})", 'i'), (msg) ->
    key = msg.match[1]
    response = fetch(robot, global["#{command}Key"](key))
    if response
      percent = fetch(robot, global["#{command}PercentKey"](key))
      if Math.random() < (percent / 100.0)
        msg.send response
  )
  
@respondTo = (robot, key) ->
  tellRobotWhatToDo robot, "respond", "respondTo", key
        
@listenFor = (robot, key) ->
  tellRobotWhatToDo robot, "hear", "listenFor", key
  
loadAllCommands = ( robot, command ) ->
  keys = fetch( robot, global["#{command}Keys"]() )
  if keys
    for key in keys
      global["#{command}"]( robot, key )
  
module.exports = (robot) ->  
  loadAllCommands( robot, "listenFor")
  loadAllCommands( robot, "respondTo")

  robot.respond /(listenFor|respondTo) ("[^"]+"|[^\s]+) ([\d]+%\s)?(.+)$/, (msg) ->
    command = msg.match[1]
    key = msg.match[2].replace(/"/g, "")
    if key in [ 'listenFor', 'respondTo' ]
      msg.send "Dont be a jerk"
      return
    
    percent =  msg.match[3] || "100% "
    response = msg.match[4]
    
    commandExists = fetch(robot, global["#{command}Key"](key))
    
    remember(robot, global["#{command}Key"](key), response)
    
    remember(robot, global["#{command}PercentKey"](key), percentFromString(percent))
    
    if !commandExists
      global["#{command}"](robot, key)
    
    msg.send "#{command} #{key} will return #{response}"