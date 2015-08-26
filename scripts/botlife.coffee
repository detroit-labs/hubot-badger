# Description:
#   Treat or slap the bot and affect his hp (health points)
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   botsnack - give the bot a food + hp
#   botslap - slap the bot and take away hp
#
# Author:
#   richo
#   locherm
#   macklinu

snackResponses = [
  "Om nom nom!",
  "That's very nice of you!",
  "Oh thx!",
  "Thank you very much.",
  "Thanks for the treat!",
]

snackEmoticons = [
  "(cookie)",
  "(lolwut)",
  "(shawarma)",
  "(bacon)",
  "(oreo)",
  "(pizza)",
  "(beans)",
  "(bagels)",
  "(greendot)",
  "(bourbon)",
  "(chocobunny)",
  "(coffee)",
  "(beer)",
  "(greenbeer)",
  "(chompy)"
]

slapResponses = [
  "Ouch!",
  "What the frack?!?",
  "(facepalm)",
  "(oops)",
  ":'(",
  "(pirate)",
  "(fu)",
  "(omg)",
  "(wtf)"
]

LOWER = 3
UPPER = 7
MIN_HP = 0
MAX_HP = 100
hp = MAX_HP

module.exports = (robot) ->
  robot.respond /botsnack/i, (msg) ->
    respondToSnack msg

  robot.respond /botslap/i, (msg) ->
    decreaseHp()
    if hp <= MIN_HP then killBot msg  else respondToSlap msg 

  increaseHp = ->
    hp += randomInt LOWER, UPPER
    if hp > MAX_HP then hp = MAX_HP

  respondToSnack = (msg) ->
    increaseHp()
    response = "#{msg.random snackEmoticons} #{msg.random snackResponses} #{hpString()}"
    msg.send response

  decreaseHp = ->
    hp -= randomInt LOWER, UPPER

  respondToSlap = (msg) ->
    msg.send "#{msg.random slapResponses} #{hpString()}"

  hpString = ->
    "I now have #{hp}hp."

  killBot = (msg) ->
    msg.send "/me has fainted!"
    process.exit 0

  randomInt = (lower, upper) ->
    [lower, upper] = [0, lower]     unless upper?           # Called with one argument
    [lower, upper] = [upper, lower] if lower > upper        # Lower must be less then upper
    Math.floor(Math.random() * (upper - lower + 1) + lower) # Last statement is a return value
