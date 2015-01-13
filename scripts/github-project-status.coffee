# Description:
#   GitHub Project Status
#
# Dependencies:
#   underscore, github
#
# Configuration:
#   GITHUB_API_KEY
#   GITHUB_ORG
#
# Commands:
#   hubot project status - Show github status of the project
#   hubot project repos - list repos of the project
#   hubot project repos add <repo(s)> - add repos to the project
#   hubot project repos remove <repo(s)> - remove repos from the project
#
# Notes:
#
# Author:
#   nwest

_ = require 'underscore'
githubAPI = require 'github'
github = new githubAPI(version: "3.0.0")

github.authenticate(
  type: "oauth",
  token: process.env.GITHUB_API_KEY
)

parseCommaSeparatedString = (string) ->
  string.split(/\s*,\s*/)

prettyArrayString = (array) ->
  array.join(", ")

reposKey = (room) ->
  "github-repos-#{room}"

module.exports = (robot) ->
  robot.respond /project status$/i, (msg) ->
    repos = robot.brain.get(reposKey(msg.envelope.room))
    for repo in repos
      github.repos.get user: process.env.GITHUB_ORG, repo: repo, (err, res) ->
        msg.send "#{res.name}  Open PRs: #{res.open_issues_count} https://github.com/#{process.env.GITHUB_ORG}/#{res.name}/pulls"

  robot.respond /project repos$/i, (msg) ->
    key = reposKey(msg.envelope.room)
    msg.send stringWithKey(key)

  robot.respond /project repos add (.*)/i, (msg) ->
    key = reposKey(msg.envelope.room)
    addObjectsToKey(parseCommaSeparatedString(msg.match[1]), key)
    msg.send stringWithKey(key)

  robot.respond /project repos remove (.*)/i, (msg) ->
    key = reposKey(msg.envelope.room)
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
