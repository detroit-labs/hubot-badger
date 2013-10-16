# Returns a random Pun
# 
# hubot pun me
#
module.exports = (robot) ->
  robot.respond /(say a )?(bad)?pun( me)?$/i , (msg) ->
    punOfTheDay msg, (url) ->
      msg.send url

punOfTheDay = (msg, cb) ->
  msg.http('http://www.badpuns.com/jokes.php?section=oneline&pos=random').get() (err, res, body) ->
    response = body.match(/<div class='joke_body_text'>(.*?)<\/div>/);
    cb response?[1] || "Sorry not feeling so punny right now, none found"
