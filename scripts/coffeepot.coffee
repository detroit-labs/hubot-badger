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

# coffeelint: disable=max_line_length
coffee_thoughts = [
  "Coffee is Ready!",
  "(klaw)",
  "Keep Calm and Drink Coffee",
  "Life Begins After Coffee",
  "The world consumes close to 2.25 billion cups of coffee every day.",
  "Coffee is the world's second most valuable traded commodity, only behind petroleum.",
  "Coffee is most effective if consumed between 9:30 am and 11:30 am.",
  "In Korea and Japan, there is a Cat Cafe where you can go to drink coffee and hang out with cats for hours.",
  "Coffee beans aren't beans. They are fruit pits.",
  "Coffee doesn't taste like it smells because saliva wipes out half of the flavor.",
  "The Starbuck's corporation maintains the world's largest private navy for purposes unknown.",
  "In Africa coffee beans are soaked in water mixed with spices and served as candy to chew.",
  "Brazil is the largest coffee producer in the world today producing over 44 million bags of coffee each year.",
  "The U.S. is the largest coffee consuming country in the world, estimating 400 million cups per day.",
  "There are 65 countries in the world that grow coffee and they are all along the equator.",
  "Coffee in the United States is only grown in Hawaii and Puerto Rico.",
  "Charles II, King of England issued a proclamation banning Coffee Houses, stating they were places where people met to plot against him.",
  "Black coffee with no additives contains no calories.",
  "There are two types of coffee plants, Arabica and Robusta.",
  "An expert in brewing Turkish coffee is known as a \"kahveci\".",
  "Espresso Coffee has just one third of the caffeine content of a cup of regular coffee.",
  "James Mason invented the coffee percolator on December 26, 1865.",
  "Instant coffee was invented in 1901 by a Japanese American chemist known as Satori Kato.",
  "On May 11, 1926, the slogan \"Maxwell House Good to the last drop\" was trademark registered.",
  "Melitta Bentz a housewife from Dresden, Germany, invented the first coffee filter in 1908.",
  "In 1822, the first espresso machine was made in France.",
  "In 1933, Dr. Ernest Illy invented the first automatic espresso machine.",
  "It takes five years for a coffee tree to reach full maturity, coffee trees can live up to 100 years old",
  "The average yield from one tree is the equivalent of one roasted pound of coffee.",
  "The custom of tipping waiters originated in early European Coffee Houses.",
  "In the 17th century when coffee came to Europe Pope Clement VIII banned coffee stating it was the \"Devils Tool\".",
  "Both the American Revolution and the French Revolution were plotted in coffee houses.",
  "Dorothy Jones of Boston was the first American coffee trader, In 1670 she was granted a license to sell coffee.",
  "A regular 6oz cup of coffee contains about 150 milligrams of caffeine, most physicians call this a \"therapeutic dose\".",
  "Robusta coffee beans have twice as much caffeine as Arabica beans, but are of lower quality.",
  "Coffee sacks are usually made of hemp and weigh approximately 132 pounds when they are full of green coffee beans.",
  "There is no such bean as a Flavored bean, coffee is flavored after roasting with artificial flavored oils.",
  "The world's first webcam was a coffeepot https://en.wikipedia.org/wiki/Trojan_Room_coffee_pot",
  "RFC2324 Hyper Text Coffee Pot Control Protocol https://www.ietf.org/rfc/rfc2324.txt",
  "If you immersed your head in a bucket of hot coffee, I wouldn't be a bit surprised.",
  "Black Ivory coffee is the most expensive kind of coffee on Earth, and it’s made from Elephant poop.",
  "Coffee was the first food in the world to be freeze-dried.",
  "Coffee with added cream cools about 20% slower than plain black coffee."
]
# coffeelint: enable=max_line_length

module.exports = (robot) ->
  room = process.env.HUBOT_COFFEEPOT_ANNOUNCE_ROOM

  robot.router.post "/coffeepot/finish", (req, res) ->
    if req.header("X-COFFEEPOT-KEY") == process.env.HUBOT_COFFEEPOT_KEY
      burner_count = robot.brain.get("coffeepot-burner-count")
      if burner_count > 0
        idx = [Math.floor(Math.random() * coffee_thoughts.length)]
        coffee_thought = coffee_thoughts[idx]
        robot.messageRoom room, "(coffee) (successful) — " + coffee_thought
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
