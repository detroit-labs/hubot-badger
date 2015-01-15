# Description:
#   Oblique Strategy
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot oblique - Returns an Oblique Strategy 
#
# Notes:
#
# Author:
#   cdpetersen

module.exports = (robot) ->
  robot.respond /oblique/i , (msg) ->
    oblique msg, (url) ->
      msg.send url

oblique = (msg, cb) ->
  msg.http('http://stoney.sb.org/eno/oblique.html').get() (err, res, body) ->
    response = body.match(/<H3>(.*?)<\/H3>/)
    cb response?[1] || "The oracle is silent"
