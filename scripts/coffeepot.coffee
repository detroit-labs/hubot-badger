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

coffee_thoughts = [
  "(coffee) (successful) — Coffee is Ready!",
  "(coffee) (successful) — (klaw)",
  "(coffee) (successful) — Keep Calm and Drink Coffee",
  "(coffee) (successful) — Life Begins After Coffee",
  "(coffee) (successful) — The world consumes close to 2.25 billion cups of coffee every day.",
  "(coffee) (successful) — Coffee is the world's second most valuable traded commodity, only behind petroleum.",
  "(coffee) (successful) — Coffee is most effective if consumed between 9:30 am and 11:30 am.",
  "(coffee) (successful) — In Korea and Japan, there is a Cat Cafe where you can go to drink coffee and hang out with cats for hours.",
  "(coffee) (successful) — Coffee beans aren't beans. They are fruit pits.",
  "(coffee) (successful) — Coffee doesn't taste like it smells because saliva wipes out half of the flavor."
]

module.exports = (robot) ->
  room = process.env.HUBOT_COFFEEPOT_ANNOUNCE_ROOM

  robot.router.post "/coffeepot/finish", (req, res) ->
    if req.header("X-COFFEEPOT-KEY") == process.env.HUBOT_COFFEEPOT_KEY
      burner_count = robot.brain.get("coffeepot-burner-count")
      if burner_count > 0
        robot.messageRoom res.random coffee_thoughts
        robot.brain.set("coffeepot-finish-timestamp", moment())
      res.end "OK"
    else
      res.end "Nope."


  robot.respond /coffee(pot)?$/i, (msg) ->
    burner_count = robot.brain.get("coffeepot-burner-count")
    status = switch burner_count
      when 0 then " and the coffeepot is off"
      when 1 then " and the coffeepot has one burner on"
      when 2, 3 then " and the coffeepot has #{burner_count} burners on"
      else ""
    timestamp = moment(robot.brain.get("coffeepot-finish-timestamp"))
    msg.send "(coffee)Coffee was last brewed #{timestamp.fromNow()}#{status}."


  robot.router.post "/coffeepot/status", (req, res) ->
    if req.header("X-COFFEEPOT-KEY") == process.env.HUBOT_COFFEEPOT_KEY
      value = parseInt(req.body.burner_count)
      if(value != null)
        robot.brain.set("coffeepot-burner-count", value)
        robot.logger.debug "coffeepot-burner-count:#{value}"
      res.end "OK"
    else
      res.end "Nope."
