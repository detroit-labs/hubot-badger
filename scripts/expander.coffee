# Description:
#   Listens for a regex to expand. ex: Jira ticket ID -> Jira URL
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot expand "<regex>" <expand-format> # Expand format uses ___ (3 underscores) to be replaced with results of regex.  Ex: hubot expand JIRA-\d+ http://jira.com/browse/___
#
# Author:
#   Mark Schall

module.exports = (robot) ->
  loaded = false
  robot.brain.on 'loaded', (data = {}) ->
    if not loaded
      loaded = true
      keys = getKeys
      for key in Object.keys(keys)
        addListener key
  
  robot.respond /expand "(.+?)" (.+)/i, (msg) ->
    loaded = true
    key = msg.match[1]
    addKey key, msg.match[2]
    msg.send "#{key} added"
  
  addListener = (key) ->
    robot.hear new RegExp("\\b#{key}\\b", "gi"), (msg) ->
      keys = getKeys
      for match in msg.match
        msg.send "#{keys[key].replace(/___/g, match)}"
  
  addKey = (key, url) ->
    keys = getKeys
    oldKey = keys[key]
    keys[key] = url
    setKeys keys
    addListener key if not oldKey
    
  getKeys = ->
    robot.brain.get("expand-keys") || {}
  
  setKeys = (keys) ->
    robot.brain.set "expand-keys", keys