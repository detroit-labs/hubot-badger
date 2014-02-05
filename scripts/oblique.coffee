# Returns an Oblique Strategy 
# 
# hubot oblique
#
module.exports = (robot) ->
  robot.respond /oblique/i , (msg) ->
    oblique msg, (url) ->
      msg.send url

oblique = (msg, cb) ->
  msg.http('http://stoney.sb.org/eno/oblique.html').get() (err, res, body) ->
    response = body.match(/<h3>(.*?)<\/h3>/);
    cb response?[1] || "The oracle is silent"
