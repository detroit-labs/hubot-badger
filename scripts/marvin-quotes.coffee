# Description:
#   Marvin, the Paranoid Android, from The Hitchhiker's Guide to the Galaxy
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot you saved me
#   hubot how is your life?
#
# Author:
#   jweslley

quotes = [
  "I have a million ideas. They all point to certain death.",
  "I could calculate your chance of survival, but you wouldn't like it.",
  "I ache, therefore I am.",
  "The first ten million years were the worst. And the second ten million years, they were the worst too. The third ten million years I didn't enjoy at all. After that I went into sort of a decline.",
  "My capacity for happiness you could fit into a matchbox without taking out the matches first.",
  "Pardon me for breathing, which I never do anyway so I don't know why I bother to say it, oh God, I'm so depressed.",
  "I hate oceans.",
  "Now the world has gone to bed, Darkness won't engulf my head, I can see by infra-red, How I hate the night.",
  "Here I am brain the size of a planet, and they ask me to take you to the bridge. Call that job satisfaction? Because I sure don't.",
  "Sounds awful.",
  "It gives me a headache just trying to think down to your level.",
  "'Reverse primary thrust, Marvin, open airlock number 3, Marvin, can you pick up that piece of paper? Here I am, brain the size of a planet, and they ask me to pick up a piece of paper.'",
  "I\'m not getting you down at all am I?",
  "This is the sort of thing you lifeforms enjoy is it? I ask merely for information",
  "I can even go stick my head in a bucket of water if you like. Would you like me to go stick my head in a bucket of water? I\'ve got one ready. Wait a minute.",
  "Why stop now just when I\'m hating it?",
  "That would destroy the universe in total. Good idea, if you ask me.",
  "The dew has clearly fallen with a particularly sickening thud this morning.",
  "Life! Don\'t talk to me about life",
  "Life, loathe it or ignore it, you can\'t like it",
  "Life\'s bad enough as it is without wanting to invent any more of it",
  "Funny, how just when you think life can\'t possibly get any worse it suddenly does"
]

module.exports = (robot) ->

  robot.hear /you saved me/, (msg) ->
    msg.send "I know. Wretched isn't it?"

  robot.respond /life/i, (msg) ->
    msg.send msg.random quotes
