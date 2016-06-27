# Description:
#   Returns this week's Omnibus Demo schedule
#
# Dependencies:
#   underscore, datejs
#
# Configuration:
#   None
#
# Commands:
#   hubot omnidemo
#
# Author:
#   maschall

require 'datejs'
_ = require 'underscore'

demos = [{ date: Date.parse('6/22/16'), desc: "Renaissance Conference Center Tower 300" },
{ date: Date.parse('6/29/16'), desc: "Room 6" },
{ date: Date.parse('7/13/16'), desc: "Renaissance Conference Center Tower 300" },
{ date: Date.parse('7/20/16'), desc: "Renaissance Conference Center Tower 300" },
{ date: Date.parse('7/27/16'), desc: "Renaissance Conference Center Tower 300" },
{ date: Date.parse('8/3/16'), desc: "Room 5 & 6" },
{ date: Date.parse('8/10/16'), desc: "Room 12 & 13" },
{ date: Date.parse('8/17/16'), desc: "Room 12 & 13" },
{ date: Date.parse('8/24/16'), desc: "Room 5 & 6" },
{ date: Date.parse('8/31/16'), desc: "Room 12 & 13" },
{ date: Date.parse('9/7/16'), desc: "Room 12 & 13" },
{ date: Date.parse('9/14/16'), desc: "Room 5 & 6" },
{ date: Date.parse('9/21/16'), desc: "Room 5 & 6" },
{ date: Date.parse('9/28/16'), desc: "Room 5 & 6" },
{ date: Date.parse('10/5/16'), desc: "Room 5 & 6" },
{ date: Date.parse('10/12/16'), desc: "Room 5 & 6" },
{ date: Date.parse('10/19/16'), desc: "Room 12 & 13" },
{ date: Date.parse('10/26/16'), desc: "Room 5 & 6" },
{ date: Date.parse('11/2/16'), desc: "Room 5 & 6" },
{ date: Date.parse('11/9/16'), desc: "Room 5 & 6" },
{ date: Date.parse('11/16/16'), desc: "Room 12 & 13" },
{ date: Date.parse('11/30/16'), desc: "Room 5 & 6" },
{ date: Date.parse('12/7/16'), desc: "Room 5 & 6" },
{ date: Date.parse('12/14/16'), desc: "Room 5 & 6" },
{ date: Date.parse('12/21/16'), desc: "Room 5 & 6" }]

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
  robot.respond /omnidemo/i, (msg) ->
    now = Date.today().clearTime()
    yesterday = Date.today().add(-1).days()
    nextWeek = Date.today().add(7).days()
    demosList =  _.chain(demos)
      .filter((d) -> d.date.isAfter(yesterday) and d.date.isBefore(nextWeek))
      .sortBy((d) -> d.date)
      .map((d) -> "#{displayDate(d.date, now)} #{d.desc}")
      .value()
      .join("\n")
    msg.send demosList
