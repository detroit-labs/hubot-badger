# Description:
#   Roll x number of y sided dice.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot roll me <n>d<sides> - rolls n number of n sided dice
#   hubot dice me <n>d<sides> - rolls n number of n sided dice
#   hubot roll <n>d<sides> - rolls n number of n sided dicee
#   hubot dice <n>d<sides> - rolls n number of n sided dice
#
# Author:
#   Will Hinchman
#   Yes, I know dices isn't a word. Also, Yes, I like to make Hal sassy.

randomCrits = [
  "CRITS!",
  "REKT!",
  "It's super effective!",
  ":boom:",
  "Throwing Rocks Tonight!",
  "YES!",
  "😍",
  "😎😎😎",
  "natch"
]

randomFails = [
  "FAIL!",
  ":facepalm:",
  "Oh. I'm Sorry.",
  "That's... terrible",
  "😐",
  "Hope that wasn't important",
  "😭",
  "¯\\_(ツ)_/¯",
  "TPK! TPK! TPK!"
]

randomNum = (max,min=0) ->
  return (Math.floor(Math.random() * (max - min) + min)) + 1
# min is set to 0 by default but a different value can be passed to function

parseDice = (diceRoll) ->
  diceRoll = diceRoll.replace /[\a-c\e-z\s\-\_\W+]/gi, ""
  diceRoll = diceRoll.replace /(\s)/g, ""
  diceRoll = diceRoll.toLowerCase()

rollDice = (dices,sides) ->
  outDice = []

  for i in [1..dices] by 1
    number = randomNum(sides)
    if sides == 100
      number = number - 1
    outDice.push number

  dices = outDice


averageDiceRolls = (dices,sides) ->
  sum = 0
  for num in dices
    sum = sum + num

  avg = sum/dices.length
  #can't be less than 1.
  if avg < 1.0
    avg = 1.0

  return avg

module.exports = (robot) ->
  robot.respond /(?:roll|dice)(?: me)?(.*)/i, (msg) ->
    diceToRoll = msg.match[1]
    diceToRoll = parseDice(diceToRoll)
    userName = msg.message.user.name
    diceArray = diceToRoll.split("d")

    if not diceToRoll.length or !diceArray[1]
      msg.send "Uhh, dice without sides don't exist, #{userName}. \"roll me <n>d<sides>\""
    else
      if diceArray.length == 2
        diceCount = diceArray[0]
        sides = diceArray[1]

        if diceCount > 20
          diceCount = 20
          msg.send "Whoa, #{userName}, chill! Only 20 dice at a time please."

        if sides > 10000
          sides = 10000
          msg.send "Dude, #{userName}, more than ten thousand sides? I'm not a supercomputer, you know."

        if diceCount < 1
          diceCount = 1

        if sides < 2
          sides = 2
          msg.send "Is A Die With 1 Side, Still A Die? Let's try 2 sides instead."

        dices = rollDice(diceCount, sides)

        msg.send "Here You Go, #{userName}: #{dices}"

        averageRoll = averageDiceRolls(dices, sides)

        #cheer!
        if averageRoll >= (sides * 0.85)
          msg.send msg.random randomCrits

        #jeer!
        if averageRoll <= Math.ceil((sides * 0.15),1)
          msg.send msg.random randomFails

      else
        msg.send "Try again, #{userName}. \"roll me <n>d<sides>\""
