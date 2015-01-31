# Description:
#   Annouce the status of the coffee pot on the 6th floor
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#

module.exports = (robot) ->

  room = process.env.HUBOT_COFFEEPOT_ANNOUNCE_ROOM

  robot.router.post "/coffeepot/finish", (req, res) ->
    if req.header("X-COFFEEPOT-KEY") == process.env.HUBOT_COFFEEPOT_KEY
      robot.messageRoom room, "(coffee) Coffee is ready! (coffee)"
      robot.brain.set("coffeepot-finish-timestamp", Date())
      res.end "OK"
    else
      res.end "Nope."
      
      
  robot.respond /coffeepot/i, (msg) ->
    timestamp = robot.brain.get("coffeepot-finish-timestamp")
    msg.send "msg: (coffee) Coffee was last brewed at #{timestamp}"
      
      
	  
	
	
