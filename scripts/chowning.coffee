# Description:
#   Matt Chowning
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   nwest

suggestions = [
  "Did you mean Matt Tyndall?",
  "http://i.imgur.com/NWNHh1e.png Maybe you meant Matt Lauer.",
  "Hypothetically, of course."
]

module.exports = (robot) ->
  robot.hear /Matt Chowning/i, (msg) ->
    msg.send msg.random suggestions 

