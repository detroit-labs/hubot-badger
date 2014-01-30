# Description:
#   Pulls and displays Detroit traffic information
#
# Dependencies:
#   googlemaps
#
# Configuration:
#   None
#
# Commands:
#   hubot detroit traffic
#
# Author:
#   nwest

maps = require "googlemaps"

module.exports = (robot) ->
  robot.respond /detroit traffic/i, (msg) ->
    places = ["Ann Arbor, MI", "Canton, MI", "Ferndale, MI", "Novi, MI", "Plymoth, MI", "Ypsilanti, MI"]

    maps.distance "1520 Woodward Ave, Detroit, MI", places.join("|"), (err, data) ->
      for info, i in data["rows"][0]["elements"]
        msg.send places[i] + ": " + info["duration"]["text"]
