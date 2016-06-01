# Description:
#   Bueller?
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   listens for "bueller" or "anyone?"
#
# Author:
#   eliot

benSteinBuellerImages = [
  "http://www.wearysloth.com/Gallery/ActorsS/24593-6184-0.jpg",
  "http://www.rantlifestyle.com/wp-content/uploads/2014/02/rbk-12-ferris-buellers-day-off-the-economics-teacher-de.jpg",
  "https://media4.giphy.com/media/sW6P26sp3HFvy/200_s.gif",
  "http://31.media.tumblr.com/tumblr_lxul3iUMg61qgdbito1_500.gif"
]

benSteinAnyoneImages = [
  "http://38.media.tumblr.com/5455c05fbf65a83008e9ab15c66c1e84/tumblr_ncpno2ZgJG1tuk7ruo1_400.gif",
  "http://4.bp.blogspot.com/-RFCJGxvCCxo/VLXeb2OYgXI/AAAAAAAAAG4/smtkbwzTcj0/s1600/anyone.jpg"
]

module.exports = (robot) ->
  
  robot.respond /bueller/i, (msg) ->
    msg.send msg.random benSteinBuellerImages
    msg.send "...Bueller?"

  robot.respond /anyone\?/i, (msg) ->
    msg.send msg.random benSteinAnyoneImages
    msg.send "Anyone, anyone?"
