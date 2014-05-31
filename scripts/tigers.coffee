# Description:
#   Returns this week's tiger's schedule
#
# Dependencies:
#   None
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

dates = [{ date: Date.parse('5/13/14'), desc: "@Baltimore 7:05 PM" },
{ date: Date.parse('5/14/14'), desc: "@Baltimore 12:35 PM" },
{ date: Date.parse('5/16/14'), desc: "@Boston 7:10 PM" },
{ date: Date.parse('5/17/14'), desc: "@Boston 7:10 PM" },
{ date: Date.parse('5/18/14'), desc: "@Boston 8:05 PM" },
{ date: Date.parse('5/19/14'), desc: "@Cleveland 7:05 PM" },
{ date: Date.parse('5/20/14'), desc: "@Cleveland 7:05 PM" },
{ date: Date.parse('5/21/14'), desc: "@Cleveland 12:05 PM" },
{ date: Date.parse('5/22/14'), desc: "vs. Texas 1:08 PM" },
{ date: Date.parse('5/23/14'), desc: "vs. Texas 7:08 PM" },
{ date: Date.parse('5/24/14'), desc: "vs. Texas 4:08 PM" },
{ date: Date.parse('5/25/14'), desc: "vs. Texas 1:08 PM" },
{ date: Date.parse('5/26/14'), desc: "@Oakland 4:05 PM" },
{ date: Date.parse('5/27/14'), desc: "@Oakland 10:05 PM" },
{ date: Date.parse('5/28/14'), desc: "@Oakland 10:05 PM" },
{ date: Date.parse('5/29/14'), desc: "@Oakland 3:35 PM" },
{ date: Date.parse('5/30/14'), desc: "@Seattle 10:10 PM" },
{ date: Date.parse('5/31/14'), desc: "@Seattle 10:10 PM" },
{ date: Date.parse('6/1/14'), desc: "@Seattle 4:10 PM" },
{ date: Date.parse('6/3/14'), desc: "vs. Toronto 7:08 PM" },
{ date: Date.parse('6/4/14'), desc: "vs. Toronto 7:08 PM" },
{ date: Date.parse('6/5/14'), desc: "vs. Toronto 1:08 PM" },
{ date: Date.parse('6/6/14'), desc: "vs. Boston 7:08 PM" },
{ date: Date.parse('6/7/14'), desc: "vs. Boston 7:15 PM" },
{ date: Date.parse('6/8/14'), desc: "vs. Boston 8:07 PM" },
{ date: Date.parse('6/9/14'), desc: "@Chi White Sox 8:10 PM" },
{ date: Date.parse('6/10/14'), desc: "@Chi White Sox 8:10 PM" },
{ date: Date.parse('6/11/14'), desc: "@Chi White Sox 8:10 PM" },
{ date: Date.parse('6/12/14'), desc: "@Chi White Sox 8:10 PM" },
{ date: Date.parse('6/13/14'), desc: "vs. Minnesota 7:08 PM" },
{ date: Date.parse('6/14/14'), desc: "vs. Minnesota 4:08 PM" },
{ date: Date.parse('6/15/14'), desc: "vs. Minnesota 1:08 PM" },
{ date: Date.parse('6/16/14'), desc: "vs. Kansas City 7:08 PM" },
{ date: Date.parse('6/17/14'), desc: "vs. Kansas City 7:08 PM" },
{ date: Date.parse('6/18/14'), desc: "vs. Kansas City 1:08 PM" },
{ date: Date.parse('6/19/14'), desc: "vs. Kansas City 1:08 PM" },
{ date: Date.parse('6/20/14'), desc: "@Cleveland 7:05 PM" },
{ date: Date.parse('6/21/14'), desc: "@Cleveland 7:15 PM" },
{ date: Date.parse('6/22/14'), desc: "@Cleveland 1:05 PM" },
{ date: Date.parse('6/24/14'), desc: "@Texas 8:05 PM" },
{ date: Date.parse('6/25/14'), desc: "@Texas 8:05 PM" },
{ date: Date.parse('6/26/14'), desc: "@Texas 8:05 PM" },
{ date: Date.parse('6/27/14'), desc: "@Houston 8:10 PM" },
{ date: Date.parse('6/28/14'), desc: "@Houston 4:10 PM" },
{ date: Date.parse('6/29/14'), desc: "@Houston 2:10 PM" },
{ date: Date.parse('6/30/14'), desc: "vs. Oakland 7:08 PM" },
{ date: Date.parse('7/1/14'), desc: "vs. Oakland 7:08 PM" },
{ date: Date.parse('7/2/14'), desc: "vs. Oakland 1:08 PM" },
{ date: Date.parse('7/3/14'), desc: "vs. Tampa Bay 7:08 PM" },
{ date: Date.parse('7/4/14'), desc: "vs. Tampa Bay 7:08 PM" },
{ date: Date.parse('7/5/14'), desc: "vs. Tampa Bay 4:08 PM" },
{ date: Date.parse('7/6/14'), desc: "vs. Tampa Bay 1:08 PM" },
{ date: Date.parse('7/8/14'), desc: "vs. LA Dodgers 7:08 PM" },
{ date: Date.parse('7/9/14'), desc: "vs. LA Dodgers 1:08 PM" },
{ date: Date.parse('7/10/14'), desc: "@Kansas City 8:10 PM" },
{ date: Date.parse('7/11/14'), desc: "@Kansas City 8:10 PM" },
{ date: Date.parse('7/12/14'), desc: "@Kansas City 7:10 PM" },
{ date: Date.parse('7/13/14'), desc: "@Kansas City 2:10 PM" },
{ date: Date.parse('7/18/14'), desc: "vs. Cleveland 7:08 PM" },
{ date: Date.parse('7/19/14'), desc: "vs. Cleveland 1:08 PM" },
{ date: Date.parse('7/19/14'), desc: "vs. Cleveland 7:08 PM" },
{ date: Date.parse('7/20/14'), desc: "vs. Cleveland 1:08 PM" },
{ date: Date.parse('7/21/14'), desc: "@Arizona 9:40 PM" },
{ date: Date.parse('7/22/14'), desc: "@Arizona 9:40 PM" },
{ date: Date.parse('7/23/14'), desc: "@Arizona 3:40 PM" },
{ date: Date.parse('7/24/14'), desc: "@LA Angels 10:05 PM" },
{ date: Date.parse('7/25/14'), desc: "@LA Angels 10:05 PM" },
{ date: Date.parse('7/26/14'), desc: "@LA Angels 9:05 PM" },
{ date: Date.parse('7/27/14'), desc: "@LA Angels TBD" },
{ date: Date.parse('7/29/14'), desc: "vs. Chi White Sox 7:08 PM" },
{ date: Date.parse('7/30/14'), desc: "vs. Chi White Sox 7:08 PM" },
{ date: Date.parse('7/31/14'), desc: "vs. Chi White Sox 1:08 PM" },
{ date: Date.parse('8/1/14'), desc: "vs. Colorado 7:08 PM" },
{ date: Date.parse('8/2/14'), desc: "vs. Colorado 7:08 PM" },
{ date: Date.parse('8/3/14'), desc: "vs. Colorado 1:08 PM" },
{ date: Date.parse('8/4/14'), desc: "@NY Yankees 7:05 PM" },
{ date: Date.parse('8/5/14'), desc: "@NY Yankees 7:05 PM" },
{ date: Date.parse('8/6/14'), desc: "@NY Yankees 7:05 PM" },
{ date: Date.parse('8/7/14'), desc: "@NY Yankees 1:05 PM" },
{ date: Date.parse('8/8/14'), desc: "@Toronto 7:07 PM" },
{ date: Date.parse('8/9/14'), desc: "@Toronto 1:07 PM" },
{ date: Date.parse('8/10/14'), desc: "@Toronto 1:07 PM" },
{ date: Date.parse('8/11/14'), desc: "@Pittsburgh 7:05 PM" },
{ date: Date.parse('8/12/14'), desc: "@Pittsburgh 7:05 PM" },
{ date: Date.parse('8/13/14'), desc: "vs. Pittsburgh 7:08 PM" },
{ date: Date.parse('8/14/14'), desc: "vs. Pittsburgh 1:08 PM" },
{ date: Date.parse('8/15/14'), desc: "vs. Seattle 7:08 PM" },
{ date: Date.parse('8/16/14'), desc: "vs. Seattle 7:08 PM" },
{ date: Date.parse('8/17/14'), desc: "vs. Seattle 1:08 PM" },
{ date: Date.parse('8/19/14'), desc: "@Tampa Bay 7:10 PM" },
{ date: Date.parse('8/20/14'), desc: "@Tampa Bay 7:10 PM" },
{ date: Date.parse('8/21/14'), desc: "@Tampa Bay 1:10 PM" },
{ date: Date.parse('8/22/14'), desc: "@Minnesota 8:10 PM" },
{ date: Date.parse('8/23/14'), desc: "@Minnesota 1:10 PM" },
{ date: Date.parse('8/23/14'), desc: "@Minnesota 8:10 PM" },
{ date: Date.parse('8/24/14'), desc: "@Minnesota 2:10 PM" },
{ date: Date.parse('8/26/14'), desc: "vs. NY Yankees 7:08 PM" },
{ date: Date.parse('8/27/14'), desc: "vs. NY Yankees 7:08 PM" },
{ date: Date.parse('8/28/14'), desc: "vs. NY Yankees 1:08 PM" },
{ date: Date.parse('8/29/14'), desc: "@Chi White Sox 8:10 PM" },
{ date: Date.parse('8/30/14'), desc: "@Chi White Sox 7:10 PM" },
{ date: Date.parse('8/31/14'), desc: "@Chi White Sox 2:10 PM" },
{ date: Date.parse('9/1/14'), desc: "@Cleveland 4:05 PM" },
{ date: Date.parse('9/2/14'), desc: "@Cleveland 7:05 PM" },
{ date: Date.parse('9/3/14'), desc: "@Cleveland 7:05 PM" },
{ date: Date.parse('9/4/14'), desc: "@Cleveland 7:05 PM" },
{ date: Date.parse('9/5/14'), desc: "vs. San Francisco 7:08 PM" },
{ date: Date.parse('9/6/14'), desc: "vs. San Francisco 1:08 PM" },
{ date: Date.parse('9/7/14'), desc: "vs. San Francisco 1:08 PM" },
{ date: Date.parse('9/8/14'), desc: "vs. Kansas City 4:08 PM" },
{ date: Date.parse('9/9/14'), desc: "vs. Kansas City 7:08 PM" },
{ date: Date.parse('9/10/14'), desc: "vs. Kansas City 7:08 PM" },
{ date: Date.parse('9/12/14'), desc: "vs. Cleveland 7:08 PM" },
{ date: Date.parse('9/13/14'), desc: "vs. Cleveland 7:08 PM" },
{ date: Date.parse('9/14/14'), desc: "vs. Cleveland 1:08 PM" },
{ date: Date.parse('9/15/14'), desc: "@Minnesota 8:10 PM" },
{ date: Date.parse('9/16/14'), desc: "@Minnesota 8:10 PM" },
{ date: Date.parse('9/17/14'), desc: "@Minnesota 8:10 PM" },
{ date: Date.parse('9/19/14'), desc: "@Kansas City 8:10 PM" },
{ date: Date.parse('9/20/14'), desc: "@Kansas City 7:10 PM" },
{ date: Date.parse('9/21/14'), desc: "@Kansas City 2:10 PM" },
{ date: Date.parse('9/22/14'), desc: "vs. Chi White Sox 7:08 PM" },
{ date: Date.parse('9/23/14'), desc: "vs. Chi White Sox 7:08 PM" },
{ date: Date.parse('9/24/14'), desc: "vs. Chi White Sox 1:08 PM" },
{ date: Date.parse('9/25/14'), desc: "vs. Minnesota 7:08 PM" },
{ date: Date.parse('9/26/14'), desc: "vs. Minnesota 7:08 PM" },
{ date: Date.parse('9/27/14'), desc: "vs. Minnesota 7:08 PM" },
{ date: Date.parse('9/28/14'), desc: "vs. Minnesota 1:08 PM" },
]

_ = require 'underscore'

module.exports = (robot) ->
  robot.respond /tigers/i, (msg) ->
    now = Date.today().add(-1).days()
    next_week = (7).days().fromNow()

    games = _.filter(dates, (g) ->
      g.date.isAfter(now) && g.date.isBefore(next_week))

    sorted = _.sortBy(games, (g) ->
      g.date)

    message = ""
    for game, index in games
      message += ((game.date.getMonth() + 1) + "/" +  game.date.getDate() + " " + game.desc)
      if index != games.length - 1
        message += "\n"

    msg.send message
