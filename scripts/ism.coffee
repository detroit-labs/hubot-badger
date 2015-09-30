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
        "Always raising our level of awareness.",
        "The inches we need are everywhere around us.",
        "Responding with a sense of urgency is the ante to play.",
        "Every Client. Every Time. No Exceptions. No Excuses.",
        "Obsessed with finding a better way.",
        "Ignore the noise.",
        "It’s not about WHO is right; it’s about WHAT is right.",
        "We are the \"they.\"",
        "You have to take the roast out of the oven.",
        "You’ll see it when you believe it.",
        "We’ll figure it out.",
        "A penny saved is a penny.",
        "Numbers and money follow; they do not lead.",
        "We eat our own dog food.",
        "Simplicity is genius.",
        "Innovation is rewarded. Execution is worshipped.",
        "Do the right thing.",
        "Every second counts.",
        "Yes before no."
        ]

module.exports = (robot) ->
    robot.hear /isms?\b/i, (msg) ->
        msg.send msg.random isms
