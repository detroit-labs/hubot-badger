# Description:
#    None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   gone but not forgotten - Display a fallen comrade
#   hubot dont forget <image-url> - Add a fallen comrade
#
# Author:
#   nwest

gbnf_images_key = "gbnf_images"
default_gbnf_images = [
  "http://i.imgur.com/xG9NR0k.jpg",
  "http://i.imgur.com/d6IJJex.jpg",
  "http://i.imgur.com/BcmnaKD.jpg",
  "http://i.imgur.com/OekGPKb.jpg",
  "http://i.imgur.com/DK1JfIo.jpg",
  "http://i.imgur.com/XvUJnOa.jpg",
  "http://i.imgur.com/UvKEryk.jpg",
  "http://i.imgur.com/Zkrvodl.jpg",
  "http://i.imgur.com/zAY3NrR.jpg"
]

initBrain  = (robot) ->
  if not robot.brain.get(gbnf_images_key)?
    robot.brain.set gbnf_images_key, default_gbnf_images

module.exports = (robot) ->
  robot.hear /gone (but|and) not forgotten/i, (msg) ->
    initBrain msg.robot

    msg.send msg.random robot.brain.get gbnf_images_key

  robot.respond /dont forget (.*)/i, (msg) ->
    initBrain msg.robot

    gbnf_images = robot.brain.get gbnf_images_key
    gbnf_images.push msg.match[1]
    robot.brain.set gbnf_images_key, gbnf_images
