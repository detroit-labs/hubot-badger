# Description:
#   Random Pizza-Ism
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   listens for the word "Pizza"
#
# Author:
#   ted

isms = [
    "Always raising our level of pizza.",
    "The pizzas we need are everywhere around us.",
    "Dan Newport is a fopdoodle.",
    "Every Pizza. Every Time. No Exceptions. No Excuses.",
    "Obsessed with finding a better Pizza.",
    "Ignore the Pizza.",
    "It’s not about WHO is right; it’s about WHAT PIZZA is right.",
    "We are the \"Pizza.\"",
    "You have to take the pizza out of the oven.",
    "You’ll see pizza when you believe it.",
    "We’ll figure pizza out.",
    "A penny saved is a pizza.",
    "Pizza and money follow; they do not lead.",
    "We eat our own dog pizza.",
    "Pizza is genius.",
    "Innovation is rewarded. Pizza is worshipped.",
    "Do the right pizza.",
    "Every pizza counts.",
    "Pizza before no."
]

module.exports = (robot) ->
    robot.hear /pizza/i, (msg) ->
        msg.send msg.random isms
