# Description:
#   Team Roles
#
# Dependencies:
#   underscore
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
#   hubot roles android - List the people in android
#   hubot roles android add <names> - Add people to android
#   hubot roles android rm <names> - Remove people from android
#   hubot roles ios - List the people in ios
#   hubot roles ios add <names> - Add people to iOS
#   hubot roles ios rm <names> - Remove people from iOS
#   hubot roles androidRole - List the android roles
#   hubot roles androidRole add <names> - Add roles to android roles
#   hubot roles androidRole rm <names> - Remove roles from android roles
#   hubot roles iosRole - List ios roles
#   hubot roles iosRole add <names> - Add roles to iOS
#   hubot roles iosRole rm <names> - Remove roles from iOS
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

androidKey = (room) ->
  "roles-android-#{room}"

iOSKey = (room) ->
  "roles-ios-#{room}"

currentRolesKey = (room) ->
  "roles-current-#{room}"

androidRoleKey = (room) ->
  "roles-androidRole-#{room}"

iosRoleKey = (room) ->
  "roles-iosRole-#{room}"

prettyObjectString = (object) ->
  _.map(object, (key, value) -> "#{value}: #{key}").join("\n")

quietObjectString = (object) ->
  values = _.map(_.values(object), stripTag)
  cleanedObject = _.object(_.keys(object), values)
  prettyObjectString(cleanedObject)

prettyArrayString = (array) ->
  newArray = _.map(array, stripTag)
  newArray.join(", ")

stripTag = (string) ->
  if string.charAt(0) == '@'
    string = string.slice(1)
  string

parseCommaSeparatedString = (string) ->
  string.split(/\s*,\s*/)

removeObjects = (source, itemsToRemove) ->
  _.reject(source, (item) ->
    itemsToRemove.indexOf(item) > -1)

module.exports = (robot) ->
  robot.respond /roles$/i, (msg) ->
    currentRoles = robot.brain.get(currentRolesKey(msg.envelope.room))
    msg.send quietObjectString(currentRoles)

  robot.respond /roles list/i, (msg) ->
    msg.send stringWithKey(rolesKey(msg.envelope.room))

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
    android = robot.brain.get androidKey(msg.envelope.room)
    androidRole = robot.brain.get androidRoleKey(msg.envelope.room)
    ios = robot.brain.get iOSKey(msg.envelope.room)
    iosRole = robot.brain.get iosRoleKey(msg.envelope.room)

    if roles.length > people.length
      msg.send "Not enough people to cover all roles"
    else
      newRoles = _.object(roles, _.sample(people, roles.length))

      if androidRole
        androidAssignment = _.object(androidRole, _.sample(android, androidRole.length))
        _.extend(newRoles, androidAssignment)

      if iosRole
        iosAssignment = _.object(iosRole, _.sample(ios, iosRole.length))
        _.extend(newRoles, iosAssignment)

      robot.brain.set(currentRolesKey(msg.envelope.room), newRoles)
      msg.send prettyObjectString(newRoles)

  robot.respond /roles people$/i, (msg) ->
    msg.send stringWithKey(peopleKey(msg.envelope.room))

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

  robot.respond /roles android$/i, (msg) ->
    msg.send stringWithKey(androidKey(msg.envelope.room))

  robot.respond /roles android add (.*)/i, (msg) ->
    key = androidKey(msg.envelope.room)
    addObjectsToKey(parseCommaSeparatedString(msg.match[1]), key)
    msg.send stringWithKey(key)

  robot.respond /roles android rm (.*)/i, (msg) ->
    key = androidKey(msg.envelope.room)
    removeObjectsFromKey(parseCommaSeparatedString(msg.match[1]), key)
    msg.send stringWithKey(key)

  robot.respond /roles ios$/i, (msg) ->
    msg.send stringWithKey(iOSKey(msg.envelope.room))

  robot.respond /roles ios add (.*)/i, (msg) ->
    key = iOSKey(msg.envelope.room)
    addObjectsToKey(parseCommaSeparatedString(msg.match[1]), key)
    msg.send stringWithKey(key)

  robot.respond /roles ios rm (.*)/i, (msg) ->
    key = iOSKey(msg.envelope.room)
    removeObjectsFromKey(parseCommaSeparatedString(msg.match[1]), key)
    msg.send stringWithKey(key)

  robot.respond /roles iosRole$/i, (msg) ->
    msg.send stringWithKey(iosRoleKey(msg.envelope.room))

  robot.respond /roles iosRole add (.*)/i, (msg) ->
    console.log("this works")
    key = iosRoleKey(msg.envelope.room)
    addObjectsToKey(parseCommaSeparatedString(msg.match[1]), key)
    msg.send stringWithKey(key)

  robot.respond /roles iosRole rm (.*)/i, (msg) ->
    key = iosRoleKey(msg.envelope.room)
    removeObjectsFromKey(parseCommaSeparatedString(msg.match[1]), key)
    msg.send stringWithKey(key)

  robot.respond /roles androidRole$/i, (msg) ->
    msg.send stringWithKey(androidRoleKey(msg.envelope.room))

  robot.respond /roles androidRole add(.*)/i, (msg) ->
    key = androidRoleKey(msg.envelope.room)
    addObjectsToKey(parseCommaSeparatedString(msg.match[1]), key)
    msg.send stringWithKey(key)

  robot.respond /roles androidRole rm (.*)/i, (msg) ->
    key = androidRoleKey(msg.envelope.room)
    removeObjectsFromKey(parseCommaSeparatedString(msg.match[1]), key)
    msg.send stringWithKey(key)

  stringWithKey = (key) ->
    objects = robot.brain.get(key)
    if !objects or _.isEmpty(objects)
      "None"
    else
      prettyArrayString(objects)

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
