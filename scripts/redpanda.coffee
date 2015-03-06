# Description:
#   Red Panda
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot red panda - show a (redpanda)
#
# Author:
#   nwest

redpandas = [
  "http://media2.giphy.com/media/8zDvUDkOB4Iww/giphy.gif",
  "http://stream1.gifsoup.com/view7/3509126/red-panda-o.gif",
  "http://media2.giphy.com/media/HUPc3ijS4WyRO/giphy.gif",
  "http://media.giphy.com/media/UW7O5gy13P38c/giphy.gif",
  "http://gifrific.com/wp-content/uploads/2013/03/Red-Panda-Jumping-for-Door-Handle.gif",
  "http://media3.giphy.com/media/QZDmLYMXw2M6Y/giphy.gif",
  "https://s-media-cache-ak0.pinimg.com/originals/c8/a0/9a/c8a09aae3ecd00bd482a5bed1a6ca508.jpg",
  "http://static.fjcdn.com/gifs/Swag.%252BDem%252Bred%252Bpanda%252Bbitches%252Ball%252Bup%252Bon%252Bhis%252Bshit_2a21f8_3837044.gif",
  "http://www.gifbin.com/bin/112012/1353349582_man_scares_red_panda.gif",
  "http://www.pleated-jeans.com/wp-content/uploads/2014/04/funny-gif-panda-red-food-tray.gif",
  "http://gifrific.com/wp-content/uploads/2013/10/Red-Panda-Pounce.gif",
  "http://media.giphy.com/media/11YtmIayqIKR2w/giphy.gif",
  "https://33.media.tumblr.com/9975dd73683bebb9b84c360652abbbdf/tumblr_mmrtpcbdGc1rljgauo1_500.gif",
  "http://d22zlbw5ff7yk5.cloudfront.net/images/stash-1-511ee5c4ed858.jpeg",
  "http://4.bp.blogspot.com/-VyaufeC6668/VKEWglSBGoI/AAAAAAAAHaU/upFANfpibuk/s1600/hillarious.gif",
  "http://telegraf.com.ua/files/2014/05/171.gif",
  "http://4.bp.blogspot.com/-KMEqsKeO1MI/TnApJdkAkKI/AAAAAAAAOsc/2N8XUE76XJ0/s1600/red%2Bpanda%2B1.jpg",
  "http://imgur.com/0B3dbH6.gif",
  "http://i.dailymail.co.uk/i/pix/2012/10/24/article-2222304-15A7E9E4000005DC-511_964x475.jpg"
]

module.exports = (robot) ->
  robot.respond /redpanda/i, (msg) ->
    msg.send msg.random redpandas
