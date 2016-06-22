# Description:
#   Random Ism
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   listens for words ending in "ism"
#
# Author:
#   ted

isms = [
    "Always raising our level of pizza.",
    "The pizzas we need are everywhere around us.",
    "Responding with a slice of pizza is the ante to play.",
    "Every Pizza. Every Time. No Exceptions. No Excuses.",
    "Obsessed with finding a better pizza.",
    "Ignore the salad.",
    "It’s not about WHO is right; it’s about WHAT PIZZA is right.",
    "We are the \"pizza.\"",
    "You have to take the pizza out of the oven.",
    "You’ll pizza it when you believe it.",
    "We’ll pizza it out.",
    "A penny saved is a pizza.",
    "Numbers and money follow; pizza leads.",
    "We eat our own pizza.",
    "Pizza is genius.",
    "Innovation is rewarded. Pizza is worshipped.",
    "Eat the right pizza.",
    "Every pizza counts.",
    "Pizza before no."
]

module.exports = (robot) ->
    robot.hear /isms?\b/i, (msg) ->
        msg.send msg.random isms
