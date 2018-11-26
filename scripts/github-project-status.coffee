# Description:
#   GitHub Project Status
#
# Dependencies:
#   underscore, github, promise
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
#   hubot project reset - nuke the data for this room
#
# Notes:
#
# Author:
#   nwest

_ = require 'underscore'
githubAPI = require '@octokit/rest'
github = new githubAPI(version: "3.0.0")
Promise = require 'promise'

if process.env.GITHUB_API_KEY
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

fetchGithubData = (repo) ->
  new Promise (fulfill, reject) ->
    user = process.env.GITHUB_ORG
    github.repos.get user: user, repo: repo, (repoError, repoResponse) ->
      if !repoError
        github.pullRequests.getAll user:user, repo: repo, status: "open", (prError, prResponse) ->
          if !prError
            pullRequests = prResponse.length
            issues = repoResponse.open_issues_count - pullRequests
            fulfill("#{repo} Open Pull Requests: #{pullRequests} Open Issues: #{issues} - https://github.com/#{user}/#{repo}")
          else
            reject(prError)
      else
        reject(repoError)

fetchRepos = (repos) ->
  Promise.all(repos.map(fetchGithubData))

module.exports = (robot) ->
  robot.respond /project status$/i, (msg) ->
    repos = robot.brain.get(reposKey(msg.envelope.room))
    fetchRepos(repos).done (results) ->
      msg.send results.join "\n"
      (err) ->
        msg.send err

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

  robot.respond /project reset/i, (msg) ->
    key = reposKey(msg.envelope.room)
    robot.brain.set key, null
    msg.send "Done."

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
