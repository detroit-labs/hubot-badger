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
    timestamp = moment(robot.brain.get("coffeepot-finish-timestamp"))
    msg.send "msg: (coffee) Coffee was last brewed #{timestamp.fromNow()}."
      
      
	  
	
	
