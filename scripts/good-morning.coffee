# Description:
#   GOOD Morning
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   good morning
#
# Author:
#   nwest

ways_to_say_good_morning = [
  "Rise and shine!",
  "Good Morning",
  "Guten Morgen",
  "Buenos Dias",
  "http://media1.giphy.com/media/13E3GEE2zxlhhm/giphy.gif",
  "http://media3.giphy.com/media/frc5xfWMX0Vig/giphy.gif",
  "http://media.giphy.com/media/gBxL0G0DqZd84/giphy.gif",
  "http://media.giphy.com/media/XiMbUa46o1VXq/giphy.gif",
  "http://media.giphy.com/media/dilBP4FslWpm8/giphy.gif",
  "http://media1.giphy.com/media/HHxRwRSrlSBBS/200.gif",
  "http://media.giphy.com/media/XCVm7xxtEolwc/giphy.gif",
  "http://media.giphy.com/media/11rwQLkZilbRxS/giphy.gif",
  "http://media.giphy.com/media/3OYyAv41yxMnS/giphy.gif",
  "http://media.giphy.com/media/RqWlJJUuNCkBq/giphy.gif",
  "http://media.giphy.com/media/5fBH6zvK9bUXN1HKfbW/giphy.gif",
  "http://media.giphy.com/media/NLfI3zZLBp56g/giphy.gif"
]

module.exports = (robot) ->
  robot.hear /good morning/i, (msg) ->
    msg.send msg.random ways_to_say_good_morning
