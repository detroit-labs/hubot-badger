# Description:
#   Team Roles
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot roles - Show assigned roles
#   hubot roles list - List available roles
#   hubot roles add <roles> - Add role(s)
#   hubot roles rm <roles> - Remove role(s)
#   hubot roles set <roles> - Set all roles at once
#   hubot roles people - List people
#   hubot roles people add <names> - Add people
#   hubot roles people rm <names>- Remove people
#   hubot roles people set <people> - Set all people at once
#   hubot roles shuffle - Randomly assign people to roles
#
# Notes:
#
# Author:
#   nwest

_ = require 'underscore'

rolesKey = (room) ->
  "roles-#{room}"

peopleKey = (room) ->
  "roles-people-#{room}"

currentRolesKey = (room) ->
  "roles-current-#{room}"

prettyObjectString = (object) ->
  _.map(object, (key, value) -> "#{value}: #{key}").join("\n")

prettyArrayString = (array) ->
  array.join(", ")

parseCommaSeparatedString = (string) ->
  string.split(/\s*,\s*/)

removeObjects = (source, itemsToRemove) ->
  _.reject(source, (item) ->
    itemsToRemove.indexOf(item) > -1)

module.exports = (robot) ->
  robot.respond /roles$/i, (msg) ->
    currentRoles = robot.brain.get(currentRolesKey(msg.envelope.room))
    msg.send prettyObjectString(currentRoles)

  robot.respond /roles list/i, (msg) ->
    roles = robot.brain.get(rolesKey(msg.envelope.room))
    if !roles or _.isEmpty(roles)
      msg.send "None"
    else
      msg.send prettyArrayString(roles)

  robot.respond /roles add (.*)/i, (msg) ->
    key = rolesKey(msg.envelope.room)
    addObjectsToKey(parseCommaSeparatedString(msg.match[1]), key)
    msg.send stringWithKey(key)

  robot.respond /roles rm (.*)/i, (msg) ->
    key = rolesKey(msg.envelope.room)
    removeObjectsFromKey(parseCommaSeparatedString(msg.match[1]), key)
    msg.send stringWithKey(key)

  robot.respond /roles set (.*)/i, (msg) ->
    key = rolesKey(msg.envelope.room)
    robot.brain.set(key, parseCommaSeparatedString(msg.match[1]))
    msg.send stringWithKey(key)

  robot.respond /roles shuffle/i, (msg) ->
    roles = robot.brain.get rolesKey(msg.envelope.room)
    people = robot.brain.get peopleKey(msg.envelope.room)

    if roles.length > people.length
      msg.send "Not enough people to cover all roles"
    else
      newRoles = _.object(roles, _.sample(people, roles.length))
      robot.brain.set(currentRolesKey(msg.envelope.room), newRoles)
      msg.send prettyObjectString(newRoles)

  robot.respond /roles people$/i, (msg) ->
    people = robot.brain.get(peopleKey(msg.envelope.room))
    if !people or _.isEmpty(people)
      msg.send "None"
    else
      msg.send prettyArrayString(people)

  robot.respond /roles people add (.*)/i, (msg) ->
    key = peopleKey(msg.envelope.room)
    addObjectsToKey(parseCommaSeparatedString(msg.match[1]), key)
    msg.send stringWithKey(key)
    
  robot.respond /roles people rm (.*)/i, (msg) ->
    key = peopleKey(msg.envelope.room)
    removeObjectsFromKey(parseCommaSeparatedString(msg.match[1]), key)
    msg.send stringWithKey(key)
  
  robot.respond /roles people set (.*)/i, (msg) ->
    key = peopleKey(msg.envelope.room)
    robot.brain.set(key, parseCommaSeparatedString(msg.match[1]))
    msg.send stringWithKey(key)

  stringWithKey = (key) ->
    prettyArrayString(robot.brain.get(key))

  addObjectsToKey = (objects, key) ->
    existingObjects = robot.brain.get(key)
    if !existingObjects
      existingObjects = []
    existingObjects.push object for object in objects
    robot.brain.set(key, existingObjects)

  removeObjectsFromKey = (objects, key) ->
    existing = robot.brain.get(key)
    newObjects = removeObjects(existing, objects)
    robot.brain.set(key, newObjects)
