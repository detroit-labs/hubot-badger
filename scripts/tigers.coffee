# Description:
#   Returns this week's Tigers' schedule
#
# Dependencies:
#   underscore, datejs
#
# Configuration:
#   None
#
# Commands:
#   hubot tigers
#
# Author:
#   nwest

require 'datejs'
_ = require 'underscore'

games = [{ date: Date.parse('4/6/15'), desc: "Twins 1:08p" },
{ date: Date.parse('4/8/15'), desc: "Twins 1:08p" },
{ date: Date.parse('4/9/15'), desc: "Twins 1:08p" },
{ date: Date.parse('4/10/15'), desc: "at Indians 4:10p" },
{ date: Date.parse('4/11/15'), desc: "at Indians 4:10p" },
{ date: Date.parse('4/12/15'), desc: "at Indians 1:10p" },
{ date: Date.parse('4/13/15'), desc: "at Pirates 1:35p" },
{ date: Date.parse('4/14/15'), desc: "at Pirates 7:05p" },
{ date: Date.parse('4/15/15'), desc: "at Pirates 7:05p" },
{ date: Date.parse('4/17/15'), desc: "White Sox 1:08p" },
{ date: Date.parse('4/18/15'), desc: "White Sox 1:08p" },
{ date: Date.parse('4/19/15'), desc: "White Sox 1:08p" },
{ date: Date.parse('4/20/15'), desc: "Yankees 7:08p" },
{ date: Date.parse('4/21/15'), desc: "Yankees 7:08p" },
{ date: Date.parse('4/22/15'), desc: "Yankees 7:08p" },
{ date: Date.parse('4/23/15'), desc: "Yankees 1:08p" },
{ date: Date.parse('4/24/15'), desc: "Indians 7:08p" },
{ date: Date.parse('4/25/15'), desc: "Indians 1:08p" },
{ date: Date.parse('4/26/15'), desc: "Indians 1:08p" },
{ date: Date.parse('4/27/15'), desc: "at Twins 8:10p" },
{ date: Date.parse('4/28/15'), desc: "at Twins 8:10p" },
{ date: Date.parse('4/29/15'), desc: "at Twins 1:10p" },
{ date: Date.parse('4/30/15'), desc: "at Royals 8:10p" },
{ date: Date.parse('5/1/15'), desc: "at Royals 8:10p" },
{ date: Date.parse('5/2/15'), desc: "at Royals 7:10p" },
{ date: Date.parse('5/3/15'), desc: "at Royals 2:10p" },
{ date: Date.parse('5/5/15'), desc: "at White Sox 8:10p" },
{ date: Date.parse('5/6/15'), desc: "at White Sox 8:10p" },
{ date: Date.parse('5/7/15'), desc: "at White Sox 2:10p" },
{ date: Date.parse('5/8/15'), desc: "Royals 7:08p" },
{ date: Date.parse('5/9/15'), desc: "Royals 1:08p" },
{ date: Date.parse('5/10/15'), desc: "Royals 1:08p" },
{ date: Date.parse('5/12/15'), desc: "Twins 7:08p" },
{ date: Date.parse('5/13/15'), desc: "Twins 7:08p" },
{ date: Date.parse('5/14/15'), desc: "Twins 1:08p" },
{ date: Date.parse('5/15/15'), desc: "at Cardinals 8:15p" },
{ date: Date.parse('5/16/15'), desc: "at Cardinals 2:15p" },
{ date: Date.parse('5/17/15'), desc: "at Cardinals 8:05p" },
{ date: Date.parse('5/18/15'), desc: "Brewers 7:08p" },
{ date: Date.parse('5/19/15'), desc: "Brewers 7:08p" },
{ date: Date.parse('5/20/15'), desc: "Brewers 7:08p" },
{ date: Date.parse('5/21/15'), desc: "Astros 1:08p" },
{ date: Date.parse('5/22/15'), desc: "Astros 7:08p" },
{ date: Date.parse('5/23/15'), desc: "Astros 4:08p" },
{ date: Date.parse('5/24/15'), desc: "Astros 1:08p" },
{ date: Date.parse('5/25/15'), desc: "at Athletics 4:05p" },
{ date: Date.parse('5/26/15'), desc: "at Athletics 10:05p " },
{ date: Date.parse('5/27/15'), desc: "at Athletics 3:35p" },
{ date: Date.parse('5/28/15'), desc: "at Angels 10:05p" },
{ date: Date.parse('5/29/15'), desc: "at Angels 10:05p" },
{ date: Date.parse('5/30/15'), desc: "at Angels 10:05p" },
{ date: Date.parse('5/31/15'), desc: "at Angels 8:05p" },
{ date: Date.parse('6/2/15'), desc: "Athletics 7:08p" },
{ date: Date.parse('6/3/15'), desc: "Athletics 7:08p" },
{ date: Date.parse('6/4/15'), desc: "Athletics 1:08p" },
{ date: Date.parse('6/5/15'), desc: "at White Sox 8:10p" },
{ date: Date.parse('6/6/15'), desc: "at White Sox 7:15p" },
{ date: Date.parse('6/7/15'), desc: "at White Sox 2:10p" },
{ date: Date.parse('6/9/15'), desc: "Cubs 7:08p" },
{ date: Date.parse('6/10/15'), desc: "Cubs 7:08p" },
{ date: Date.parse('6/12/15'), desc: "Indians 7:08p" },
{ date: Date.parse('6/13/15'), desc: "Indians 7:08p" },
{ date: Date.parse('6/14/15'), desc: "Indians 1:08p" },
{ date: Date.parse('6/15/15'), desc: "Reds 7:08p" },
{ date: Date.parse('6/16/15'), desc: "Reds 7:08p" },
{ date: Date.parse('6/17/15'), desc: "at Reds 7:10p" },
{ date: Date.parse('6/18/15'), desc: "at Reds 7:10p" },
{ date: Date.parse('6/19/15'), desc: "at Yankees 7:05p" },
{ date: Date.parse('6/20/15'), desc: "at Yankees 7:15p" },
{ date: Date.parse('6/21/15'), desc: "at Yankees TBD" },
{ date: Date.parse('6/22/15'), desc: "at Indians 7:10p" },
{ date: Date.parse('6/23/15'), desc: "at Indians 7:10p" },
{ date: Date.parse('6/24/15'), desc: "at Indians 12:10p" },
{ date: Date.parse('6/25/15'), desc: "White Sox 1:08p" },
{ date: Date.parse('6/26/15'), desc: "White Sox 7:08p" },
{ date: Date.parse('6/27/15'), desc: "White Sox 4:08p" },
{ date: Date.parse('6/28/15'), desc: "White Sox 1:08p" },
{ date: Date.parse('6/30/15'), desc: "Pirates 7:08p" },
{ date: Date.parse('7/1/15'), desc: "Pirates 7:08p" },
{ date: Date.parse('7/2/15'), desc: "Pirates 1:08p" },
{ date: Date.parse('7/3/15'), desc: "Blue Jays 7:08p" },
{ date: Date.parse('7/4/15'), desc: "Blue Jays 1:08p" },
{ date: Date.parse('7/5/15'), desc: "Blue Jays 1:08p" },
{ date: Date.parse('7/6/15'), desc: "at Mariners 10:10p" },
{ date: Date.parse('7/7/15'), desc: "at Mariners 10:10p" },
{ date: Date.parse('7/8/15'), desc: "at Mariners 3:40p" },
{ date: Date.parse('7/9/15'), desc: "at Twins 8:10p" },
{ date: Date.parse('7/10/15'), desc: "at Twins 8:10p" },
{ date: Date.parse('7/11/15'), desc: "at Twins 4:05p" },
{ date: Date.parse('7/12/15'), desc: "at Twins 2:10p" },
{ date: Date.parse('7/17/15'), desc: "Orioles 7:08p" },
{ date: Date.parse('7/18/15'), desc: "Orioles 7:08p" },
{ date: Date.parse('7/19/15'), desc: "Orioles 1:08p" },
{ date: Date.parse('7/20/15'), desc: "Mariners 7:08p" },
{ date: Date.parse('7/21/15'), desc: "Mariners 7:08p" },
{ date: Date.parse('7/22/15'), desc: "Mariners 7:08p" },
{ date: Date.parse('7/23/15'), desc: "Mariners 1:08p" },
{ date: Date.parse('7/24/15'), desc: "at Red Sox 7:10p" },
{ date: Date.parse('7/25/15'), desc: "at Red Sox 4:05p" },
{ date: Date.parse('7/26/15'), desc: "at Red Sox 1:35p" },
{ date: Date.parse('7/27/15'), desc: "at Rays 7:10p" },
{ date: Date.parse('7/28/15'), desc: "at Rays 7:10p" },
{ date: Date.parse('7/29/15'), desc: "at Rays 12:10p" },
{ date: Date.parse('7/30/15'), desc: "at Orioles 7:05p" },
{ date: Date.parse('7/31/15'), desc: "at Orioles 7:05p" },
{ date: Date.parse('8/1/15'), desc: "at Orioles 7:05p" },
{ date: Date.parse('8/2/15'), desc: "at Orioles 1:35p" },
{ date: Date.parse('8/4/15'), desc: "Royals 7:08p" },
{ date: Date.parse('8/5/15'), desc: "Royals 7:08p" },
{ date: Date.parse('8/6/15'), desc: "Royals 1:08p" },
{ date: Date.parse('8/7/15'), desc: "Red Sox 7:08p" },
{ date: Date.parse('8/8/15'), desc: "Red Sox 7:08p" },
{ date: Date.parse('8/9/15'), desc: "Red Sox 1:08p" },
{ date: Date.parse('8/10/15'), desc: "at Royals TBD" },
{ date: Date.parse('8/11/15'), desc: "at Royals TBD" },
{ date: Date.parse('8/12/15'), desc: "at Royals TBD" },
{ date: Date.parse('8/14/15'), desc: "at Astros TBD" },
{ date: Date.parse('8/15/15'), desc: "at Astros TBD" },
{ date: Date.parse('8/16/15'), desc: "at Astros TBD" },
{ date: Date.parse('8/18/15'), desc: "at Cubs 8:05p" },
{ date: Date.parse('8/19/15'), desc: "at Cubs 8:05p" },
{ date: Date.parse('8/20/15'), desc: "Rangers 7:08p" },
{ date: Date.parse('8/21/15'), desc: "Rangers 7:08p" },
{ date: Date.parse('8/22/15'), desc: "Rangers 7:08p" },
{ date: Date.parse('8/23/15'), desc: "Rangers 1:08p" },
{ date: Date.parse('8/25/15'), desc: "Angels 7:08p" },
{ date: Date.parse('8/26/15'), desc: "Angels 7:08p" },
{ date: Date.parse('8/27/15'), desc: "Angels 1:08p" },
{ date: Date.parse('8/28/15'), desc: "at Blue Jays 7:07p" },
{ date: Date.parse('8/29/15'), desc: "at Blue Jays 1:07p" },
{ date: Date.parse('8/30/15'), desc: "at Blue Jays 1:07p" },
{ date: Date.parse('9/1/15'), desc: "at Royals TBD" },
{ date: Date.parse('9/2/15'), desc: "at Royals TBD" },
{ date: Date.parse('9/3/15'), desc: "at Royals TBD" },
{ date: Date.parse('9/4/15'), desc: "Indians 7:08p" },
{ date: Date.parse('9/5/15'), desc: "Indians 7:08p" },
{ date: Date.parse('9/6/15'), desc: "Indians 1:08p" },
{ date: Date.parse('9/7/15'), desc: "Rays 1:08p" },
{ date: Date.parse('9/8/15'), desc: "Rays 7:08p" },
{ date: Date.parse('9/9/15'), desc: "Rays 7:08p" },
{ date: Date.parse('9/10/15'), desc: "at Indians TBD" },
{ date: Date.parse('9/11/15'), desc: "at Indians TBD" },
{ date: Date.parse('9/12/15'), desc: "at Indians TBD" },
{ date: Date.parse('9/13/15'), desc: "at Indians TBD" },
{ date: Date.parse('9/14/15'), desc: "at Twins 8:10p" },
{ date: Date.parse('9/15/15'), desc: "at Twins 8:10p" },
{ date: Date.parse('9/16/15'), desc: "at Twins 8:10p" },
{ date: Date.parse('9/18/15'), desc: "Royals 7:08p" },
{ date: Date.parse('9/19/15'), desc: "Royals 7:08p" },
{ date: Date.parse('9/20/15'), desc: "Royals 1:08p" },
{ date: Date.parse('9/21/15'), desc: "White Sox 7:08p" },
{ date: Date.parse('9/22/15'), desc: "White Sox 7:08p" },
{ date: Date.parse('9/23/15'), desc: "White Sox 1:08p" },
{ date: Date.parse('9/25/15'), desc: "Twins 7:08p" },
{ date: Date.parse('9/26/15'), desc: "Twins 7:08p" },
{ date: Date.parse('9/27/15'), desc: "Twins 1:08p" },
{ date: Date.parse('9/28/15'), desc: "at Rangers TBD" },
{ date: Date.parse('9/29/15'), desc: "at Rangers TBD" },
{ date: Date.parse('9/30/15'), desc: "at Rangers TBD" },
{ date: Date.parse('10/2/15'), desc: "at White Sox TBD" },
{ date: Date.parse('10/3/15'), desc: "at White Sox TBD" },
{ date: Date.parse('10/4/15'), desc: "at White Sox TBD" }]

daysOfWeek = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']

displayDate = (date, now) ->
  day = date.getDay()
  dayOfWeek = daysOfWeek[day]
  if Date.compare( date, now ) == 0
    dayOfWeek = "Today"
  else if day == now.getDay() + 1
    dayOfWeek = "Tomorrow"
  "#{dayOfWeek} #{date.getMonth() + 1}/#{date.getDate()}"

module.exports = (robot) ->
  robot.respond /tigers/i, (msg) ->
    now = Date.today().clearTime()
    console.log(now) # i need to see what heroku server responds with
    #if you use now.add(-1).days() it will alter now as well
    yesterday = Date.today().add(-1).days() 
    nextWeek = Date.today().add(7).days()
    msg.send _.chain(games)
      .filter((g) -> g.date.isAfter(yesterday) and g.date.isBefore(nextWeek))
      .sortBy((g) -> g.date)
      .map((g) -> "#{displayDate(g.date, now)} #{g.desc}")
      .value()
      .join("\n")