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
#
# Author:
#   nwest

 gbnf_images_key = "gbnf_images"
 gaf_images_key = "gaf_images"
 
 initTheBrain  = (robot) ->
   default_gbnf_images = [
     "http://i.imgur.com/xG9NR0k.jpg",
     "http://i.imgur.com/d6IJJex.jpg",
     "http://i.imgur.com/BcmnaKD.jpg",
     "http://i.imgur.com/OekGPKb.jpg",
     "http://i.imgur.com/DK1JfIo.jpg",
     "http://i.imgur.com/XvUJnOa.jpg",
     "http://i.imgur.com/UvKEryk.jpg",
     "http://i.imgur.com/Zkrvodl.jpg"
   ]
   
   default_gaf_images = [
     "http://i.imgur.com/b94MaKX.jpg"
   ]
   
   if not robot.brain.get(gbnf_images_key)?
     robot.brain.set( gbnf_images_key, default_gbnf_images  )
   if not robot.brain.get(gaf_images_key)?
     robot.brain.set( gaf_images_key , default_gaf_images  )

 module.exports = (robot) ->
   robot.hear /gone but|and not forgotten/i, (msg) ->
     initTheBrain msg.robot
     
     msg.send msg.random robot.brain.get gbnf_images_key

   robot.hear /gone and forgotten/i, (msg) ->
     initTheBrain msg.robot
     
     msg.send msg.random robot.brain.get gaf_images_key
     
   robot.respond /dont forget (.*)/i, (msg) ->
     initTheBrain msg.robot
     
     gbnf_images = robot.brain.get gbnf_images_key
     gbnf_images.push msg.match[1]
     robot.brain.set gbnf_images_key, gbnf_images

   robot.respond /you can forget (.*)/i, (msg) ->
     initTheBrain msg.robot
     
     gaf_images = robot.brain.get gaf_images_key
     gaf_images.push msg.match[1]
     robot.brain.set gaf_images_key, gaf_images
