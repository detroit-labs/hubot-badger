# Description:
#   creates a distributed list for chat using hashtags
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot new list #<name>
#   hubot add me to #<name>
#   hubot remove me from #<name>
#
# Author:
#   Mark Schall

skipTheHear = false

module.exports = (robot) ->
  robot.respond /new list #([\w]+)$/i, (msg) ->
    skipTheHear = true
    listName = msg.match[1]
    
    if getList(msg, listName)?
      msg.send "##{listName} has already been created"
    else
      addList(msg, listName)
      msg.send "##{listName} was created"

  robot.respond /add me to #([\w]+)$/i, (msg) ->
    skipTheHear = true
    listName = msg.match[1]
    
    if getList(msg, listName)?
      addToList(msg, listName)
      msg.send "#{userName(msg)} has been added to ##{listName}"
    else
      msg.send "##{listName} has not been created"
      
  robot.respond /remove me from #([\w]+)$/i, (msg) ->
    skipTheHear = true
    listName = msg.match[1]
    
    if getList(msg, listName)?
      removeFromList(msg, listName)
      msg.send "#{userName(msg)} has been removed from ##{listName}"
    else
      msg.send "##{listName} has not been created"

  robot.hear /#([\w]+)/i, (msg) ->
    if skipTheHear
      skipTheHear = false
    else
      listName = msg.match[1]
      names = getUserNamesForList(msg, listName)
      if names.length > 0
        msg.send "^#{names}"
      

listKey = (name) ->
  "distributedList#{name.toLowerCase()}"

getList = (msg, name) ->
  msg.robot.brain.get listKey(name)
  
addList = (msg, name) ->
  msg.robot.brain.set listKey(name), []
  
addToList = (msg, name) ->
  list = getList msg, name
  if list.indexOf userName(msg) == -1
    list.push userName(msg)
    msg.robot.brain.set listKey(name), list
    
userName = (msg) ->
  "@#{msg.envelope.user.mention_name}"

removeFromList = (msg, name) ->
  list = getList msg, name
  indexOfUserName = list.indexOf userName(msg)
  if indexOfUserName  >= 0
    list.splice indexOfUserName, 1
    msg.robot.brain.set listKey(name), list
    
getUserNamesForList = (msg, name) ->
  list = getList msg, name
  list.toString()