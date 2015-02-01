# Description:
#   Annouce the status of the coffee pot on the 6th floor
#
# Dependencies:
#   moment
#
# Configuration:
#   HUBOT_COFFEEPOT_ANNOUNCE_ROOM
#   HUBOT_COFFEEPOT_KEY
#
# Commands:
#
#   .coffeepot - get the stats of the coffee pot
#

moment = require("moment")
util = require("util")

module.exports = (robot) ->

  room = process.env.HUBOT_COFFEEPOT_ANNOUNCE_ROOM

  robot.router.post "/coffeepot/finish", (req, res) ->
    if req.header("X-COFFEEPOT-KEY") == process.env.HUBOT_COFFEEPOT_KEY
      robot.messageRoom room, "(coffee) Coffee is ready! (coffee)"
      robot.brain.set("coffeepot-finish-timestamp", moment())
      res.end "OK"
    else
      res.end "Nope."
      
      
  robot.respond /coffeepot/i, (msg) ->
    burner_count = robot.brain.get("coffeepot-burner-count")
    status = switch burner_count
      when 0 then "is off"
      when 1 then "has one burner on"
      when 2, 3 then "has #{burner_count} burners on"

    timestamp = moment(robot.brain.get("coffeepot-finish-timestamp"))
    msg.send "(coffee)Coffee was last brewed #{timestamp.fromNow()} and the coffeepot #{status}."
 
      
  robot.router.post "/coffeepot/status", (req, res) ->
    if req.header("X-COFFEEPOT-KEY") == process.env.HUBOT_COFFEEPOT_KEY
      value = parseInt(req.body.burner_count)
      if(value != null)
        robot.brain.set("coffeepot-burner-count", value)
      res.end "OK"
    else
      res.end "Nope."
      
      
	  
	
	
