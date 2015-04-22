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

_ = require 'underscore'

commandMap =
  listenFor: "hear"
  respondTo: "respond"

brainKey = (command, key = "", topic = "") ->
  "ostrta-#{command}#{topic}-#{key.replace(/\s/g, '_')}"

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
  
tellRobotWhatToDo = (robot, command, key) ->
  robot[commandMap[command]](new RegExp("(#{key}(\\s|$))", 'i'), (msg) ->
    response = fetch(robot, brainKey(command, key))
    if response
      percent = fetch(robot, brainKey(command, key, "Percent"))
      if Math.random() <= (percent / 100.0)
        msg.send response
  )
  
loadAllCommands = ( robot, command ) ->
  keys = fetch( robot, brainKey(command, key, "Keys") )
  if keys
    for key in keys
      tellRobotWhatToDo( robot, command, key )
  
module.exports = (robot) ->
  loaded = false # loaded is called for first load and set, so only do it once
  robot.brain.on 'loaded', (data = {}) ->
    if not loaded
      loaded = true
      commands = _.keys(commandMap)
      for command in commands
        loadAllCommands( robot, command )

  commands = _.keys(commandMap)
  commandsRegex = commands.join('|')
  quotedKeyRegex = "\"[^\"]+\""
  singleWordKeyRegex = "[^\\s]+"
  optionalPercentRegex = "[\\d]+%\\s"
  responseRegex = ".+"
  robot.respond new RegExp("(#{commandsRegex}) (#{quotedKeyRegex}|#{singleWordKeyRegex}) (#{optionalPercentRegex})?(#{responseRegex})$"), (msg) ->
    command = msg.match[1]
    key = msg.match[2].replace(/"/g, "")
    if key in commands
      msg.send "Dont be a jerk"
      return
    
    percent =  msg.match[3] || "100% "
    response = msg.match[4]
    
    commandKey = brainKey(command, key)
    commandExists = fetch(robot, commandKey)
    
    add(robot, brainKey(command, key, "Keys"), key)
    remember(robot, commandKey, response)
    remember(robot, brainKey(command, key, "Percent"), percentFromString(percent))
    
    if !commandExists
      tellRobotWhatToDo( robot, command, key )
    
    msg.send "#{command} #{key} will return #{response}"