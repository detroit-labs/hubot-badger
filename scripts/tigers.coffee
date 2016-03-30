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

games = [{ date: Date.parse('4/5/16'), desc: "at Miami 7:10" },
{ date: Date.parse('4/6/16'), desc: "at Miami 4:55" },
{ date: Date.parse('4/8/16'), desc: "NY Yankees 1:10" },
{ date: Date.parse('4/9/16'), desc: "NY Yankees 1:10" },
{ date: Date.parse('4/10/16'), desc: "NY Yankees 8:10" },
{ date: Date.parse('4/11/16'), desc: "Pittsburgh 1:10" },
{ date: Date.parse('4/12/16'), desc: "Pittsburgh 1:10" },
{ date: Date.parse('4/13/16'), desc: "at Pittsburgh 7:05" },
{ date: Date.parse('4/14/16'), desc: "at Pittsburgh 12:35" },
{ date: Date.parse('4/15/16'), desc: "at Houston 8:10" },
{ date: Date.parse('4/16/16'), desc: "at Houston 7:10" },
{ date: Date.parse('4/17/16'), desc: "at Houston 2:10" },
{ date: Date.parse('4/19/16'), desc: "at Kansas City 7:15" },
{ date: Date.parse('4/20/16'), desc: "at Kansas City 7:15" },
{ date: Date.parse('4/21/16'), desc: "at Kansas City 7:15" },
{ date: Date.parse('4/22/16'), desc: "Cleveland 7:10" },
{ date: Date.parse('4/23/16'), desc: "Cleveland 1:10" },
{ date: Date.parse('4/24/16'), desc: "Cleveland 1:10" },
{ date: Date.parse('4/25/16'), desc: "Oakland 7:10" },
{ date: Date.parse('4/26/16'), desc: "Oakland 7:10" },
{ date: Date.parse('4/27/16'), desc: "Oakland 7:10" },
{ date: Date.parse('4/28/16'), desc: "Oakland 1:10" },
{ date: Date.parse('4/29/16'), desc: "at Minnesota 8:10" },
{ date: Date.parse('4/30/16'), desc: "at Minnesota 2:10" },
{ date: Date.parse('5/1/16'), desc: "at Minnesota 2:10" },
{ date: Date.parse('5/3/16'), desc: "at Cleveland 6:10" },
{ date: Date.parse('5/4/16'), desc: "at Cleveland 6:10" },
{ date: Date.parse('5/5/16'), desc: "at Cleveland 6:10" },
{ date: Date.parse('5/6/16'), desc: "Texas 7:10" },
{ date: Date.parse('5/7/16'), desc: "Texas 1:10" },
{ date: Date.parse('5/8/16'), desc: "Texas 1:10" },
{ date: Date.parse('5/9/16'), desc: "at Washington 7:05" },
{ date: Date.parse('5/10/16'), desc: "at Washington 7:05" },
{ date: Date.parse('5/11/16'), desc: "at Washington 7:05" },
{ date: Date.parse('5/12/16'), desc: "at Baltimore 7:05" },
{ date: Date.parse('5/13/16'), desc: "at Baltimore 7:05" },
{ date: Date.parse('5/14/16'), desc: "at Baltimore 7:05" },
{ date: Date.parse('5/15/16'), desc: "at Baltimore 1:35" },
{ date: Date.parse('5/16/16'), desc: "Minnesota 7:10" },
{ date: Date.parse('5/17/16'), desc: "Minnesota 7:10" },
{ date: Date.parse('5/18/16'), desc: "Minnesota 1:10" },
{ date: Date.parse('5/20/16'), desc: "Tampa Bay 7:10" },
{ date: Date.parse('5/21/16'), desc: "Tampa Bay 4:10" },
{ date: Date.parse('5/22/16'), desc: "Tampa Bay 1:08" },
{ date: Date.parse('5/23/16'), desc: "Philadelphia 7:10" },
{ date: Date.parse('5/24/16'), desc: "Philadelphia 7:10" },
{ date: Date.parse('5/25/16'), desc: "Philadelphia 1:10" },
{ date: Date.parse('5/27/16'), desc: "at Oakland 10:05" },
{ date: Date.parse('5/28/16'), desc: "at Oakland 4:05" },
{ date: Date.parse('5/29/16'), desc: "at Oakland 4:05" },
{ date: Date.parse('5/30/16'), desc: "at LA Angels 9:05" },
{ date: Date.parse('5/31/16'), desc: "at LA Angels 10:05" },
{ date: Date.parse('6/1/16'), desc: "at LA Angels 7:05" },
{ date: Date.parse('6/3/16'), desc: "Chicago Sox 7:10" },
{ date: Date.parse('6/4/16'), desc: "Chicago Sox 4:10" },
{ date: Date.parse('6/5/16'), desc: "Chicago Sox 1:10" },
{ date: Date.parse('6/6/16'), desc: "Toronto 7:10" },
{ date: Date.parse('6/7/16'), desc: "Toronto 7:10" },
{ date: Date.parse('6/8/16'), desc: "Toronto 1:10" },
{ date: Date.parse('6/10/16'), desc: "at NY Yankees 7:05" },
{ date: Date.parse('6/11/16'), desc: "at NY Yankees 7:15" },
{ date: Date.parse('6/12/16'), desc: "at NY Yankees 2:05" },
{ date: Date.parse('6/13/16'), desc: "at Chicago Sox 8:10" },
{ date: Date.parse('6/14/16'), desc: "at Chicago Sox 8:10" },
{ date: Date.parse('6/15/16'), desc: "at Chicago Sox 8:10" },
{ date: Date.parse('6/16/16'), desc: "at Kansas City 8:15" },
{ date: Date.parse('6/17/16'), desc: "at Kansas City 8:15" },
{ date: Date.parse('6/18/16'), desc: "at Kansas City 8:15" },
{ date: Date.parse('6/19/16'), desc: "at Kansas City 2:15" },
{ date: Date.parse('6/20/16'), desc: "Seattle 7:10" },
{ date: Date.parse('6/21/16'), desc: "Seattle 7:10" },
{ date: Date.parse('6/22/16'), desc: "Seattle 7:10" },
{ date: Date.parse('6/23/16'), desc: "Seattle 1:10" },
{ date: Date.parse('6/24/16'), desc: "Cleveland 7:10" },
{ date: Date.parse('6/25/16'), desc: "Cleveland 4:10" },
{ date: Date.parse('6/26/16'), desc: "Cleveland 1:10" },
{ date: Date.parse('6/28/16'), desc: "Miami 7:10" },
{ date: Date.parse('6/29/16'), desc: "Miami 1:10" },
{ date: Date.parse('6/30/16'), desc: "at Tampa Bay 7:10" },
{ date: Date.parse('7/1/16'), desc: "at Tampa Bay 7:10" },
{ date: Date.parse('7/2/16'), desc: "at Tampa Bay 4:10" },
{ date: Date.parse('7/3/16'), desc: "at Tampa Bay 1:10" },
{ date: Date.parse('7/4/16'), desc: "at Cleveland 7:10" },
{ date: Date.parse('7/5/16'), desc: "at Cleveland 7:10" },
{ date: Date.parse('7/6/16'), desc: "at Cleveland 12:10" },
{ date: Date.parse('7/7/16'), desc: "at Toronto 7:07" },
{ date: Date.parse('7/8/16'), desc: "at Toronto 7:07" },
{ date: Date.parse('7/9/16'), desc: "at Toronto 1:07" },
{ date: Date.parse('7/10/16'), desc: "at Toronto 1:07" },
{ date: Date.parse('7/15/16'), desc: "Kansas City 7:08" },
{ date: Date.parse('7/16/16'), desc: "Kansas City 7:10" },
{ date: Date.parse('7/17/16'), desc: "Kansas City 1:10" },
{ date: Date.parse('7/18/16'), desc: "Minnesota 7:08" },
{ date: Date.parse('7/19/16'), desc: "Minnesota 7:10" },
{ date: Date.parse('7/20/16'), desc: "Minnesota 1:10" },
{ date: Date.parse('7/21/16'), desc: "at Chicago Sox 8:10" },
{ date: Date.parse('7/22/16'), desc: "at Chicago Sox 8:10" },
{ date: Date.parse('7/23/16'), desc: "at Chicago Sox 7:10" },
{ date: Date.parse('7/24/16'), desc: "at Chicago Sox 2:10" },
{ date: Date.parse('7/25/16'), desc: "at Boston 7:10" },
{ date: Date.parse('7/26/16'), desc: "at Boston 7:10" },
{ date: Date.parse('7/27/16'), desc: "at Boston 1:35" },
{ date: Date.parse('7/29/16'), desc: "Houston 7:10" },
{ date: Date.parse('7/30/16'), desc: "Houston 7:10" },
{ date: Date.parse('7/31/16'), desc: "Houston 1:10" },
{ date: Date.parse('8/2/16'), desc: "Chicago Sox 7:10" },
{ date: Date.parse('8/3/16'), desc: "Chicago Sox 7:10" },
{ date: Date.parse('8/4/16'), desc: "Chicago Sox 1:10" },
{ date: Date.parse('8/5/16'), desc: "NY Mets 7:10" },
{ date: Date.parse('8/6/16'), desc: "NY Mets 7:08" },
{ date: Date.parse('8/7/16'), desc: "NY Mets 1:10" },
{ date: Date.parse('8/8/16'), desc: "at Seattle 10:10" },
{ date: Date.parse('8/9/16'), desc: "at Seattle 10:10" },
{ date: Date.parse('8/10/16'), desc: "at Seattle 10:10" },
{ date: Date.parse('8/12/16'), desc: "at Texas 8:05" },
{ date: Date.parse('8/13/16'), desc: "at Texas 8:05" },
{ date: Date.parse('8/14/16'), desc: "at Texas 3:05" },
{ date: Date.parse('8/15/16'), desc: "Kansas City 7:10" },
{ date: Date.parse('8/16/16'), desc: "Kansas City 7:10" },
{ date: Date.parse('8/17/16'), desc: "Kansas City 7:10" },
{ date: Date.parse('8/18/16'), desc: "Boston 1:10" },
{ date: Date.parse('8/19/16'), desc: "Boston 7:10" },
{ date: Date.parse('8/20/16'), desc: "Boston 7:10" },
{ date: Date.parse('8/21/16'), desc: "Boston 1:10" },
{ date: Date.parse('8/23/16'), desc: "at Minnesota 8:10" },
{ date: Date.parse('8/24/16'), desc: "at Minnesota 8:10" },
{ date: Date.parse('8/25/16'), desc: "at Minnesota 1:10" },
{ date: Date.parse('8/26/16'), desc: "LA Angels 7:10" },
{ date: Date.parse('8/27/16'), desc: "LA Angels 7:10" },
{ date: Date.parse('8/28/16'), desc: "LA Angels 1:10" },
{ date: Date.parse('8/29/16'), desc: "Chicago Sox 7:10" },
{ date: Date.parse('8/30/16'), desc: "Chicago Sox 7:10" },
{ date: Date.parse('8/31/16'), desc: "Chicago Sox 1:10" },
{ date: Date.parse('9/2/16'), desc: "at Kansas City 8:15" },
{ date: Date.parse('9/3/16'), desc: "at Kansas City 7:15" },
{ date: Date.parse('9/4/16'), desc: "at Kansas City 2:15" },
{ date: Date.parse('9/5/16'), desc: "at Chicago Sox 4:10" },
{ date: Date.parse('9/6/16'), desc: "at Chicago Sox 8:10" },
{ date: Date.parse('9/7/16'), desc: "at Chicago Sox 2:10" },
{ date: Date.parse('9/9/16'), desc: "Baltimore 7:10" },
{ date: Date.parse('9/10/16'), desc: "Baltimore 7:08" },
{ date: Date.parse('9/11/16'), desc: "Baltimore 1:10" },
{ date: Date.parse('9/12/16'), desc: "Minnesota 7:10" },
{ date: Date.parse('9/13/16'), desc: "Minnesota 7:10" },
{ date: Date.parse('9/14/16'), desc: "Minnesota 7:10" },
{ date: Date.parse('9/15/16'), desc: "Minnesota 1:10" },
{ date: Date.parse('9/16/16'), desc: "at Cleveland 7:10" },
{ date: Date.parse('9/17/16'), desc: "at Cleveland 4:10" },
{ date: Date.parse('9/18/16'), desc: "at Cleveland 1:10" },
{ date: Date.parse('9/20/16'), desc: "at Minnesota 8:10" },
{ date: Date.parse('9/21/16'), desc: "at Minnesota 8:10" },
{ date: Date.parse('9/22/16'), desc: "at Minnesota 8:10" },
{ date: Date.parse('9/23/16'), desc: "Kansas City 7:10" },
{ date: Date.parse('9/24/16'), desc: "Kansas City 7:10" },
{ date: Date.parse('9/25/16'), desc: "Kansas City 1:10" },
{ date: Date.parse('9/26/16'), desc: "Cleveland 7:10" },
{ date: Date.parse('9/27/16'), desc: "Cleveland 7:10" },
{ date: Date.parse('9/28/16'), desc: "Cleveland 7:10" },
{ date: Date.parse('9/29/16'), desc: "Cleveland 1:10" },
{ date: Date.parse('9/30/16'), desc: "at Atlanta 7:35" },
{ date: Date.parse('10/1/16'), desc: "at Atlanta 7:10" },
{ date: Date.parse('10/2/16'), desc: "at Atlanta 3:10" }]

daysOfWeek = [
  'Sunday'
  'Monday'
  'Tuesday'
  'Wednesday'
  'Thursday'
  'Friday'
  'Saturday'
]

displayDate = (date, now) ->
  day = date.getDay()
  dayOfWeek = daysOfWeek[day]
  if Date.compare(date, now) == 0
    dayOfWeek = "Today"
  else if day == now.getDay() + 1
    dayOfWeek = "Tomorrow"
  "#{dayOfWeek} #{date.getMonth() + 1}/#{date.getDate()}"

module.exports = (robot) ->
  robot.respond /tigers/i, (msg) ->
    now = Date.today().clearTime()
    yesterday = Date.today().add(-1).days()
    nextWeek = Date.today().add(7).days()
    gamesList =  _.chain(games)
      .filter((g) -> g.date.isAfter(yesterday) and g.date.isBefore(nextWeek))
      .sortBy((g) -> g.date)
      .map((g) -> "#{displayDate(g.date, now)} #{g.desc}")
      .value()
      .join("\n")
    msg.send ":beisbol: TIME!\n" + gamesList
