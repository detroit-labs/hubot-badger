# Description:
#   Screencast deshortener
#
#   Turn screencast short urls into image urls automatically.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   maschall

getContentUrl = ( screencastUrl, response, callback ) ->
   response.http(screencastUrl)
      .get() (err, res, body) ->
         if res.statusCode is not 200
           response.send "I tried to get the image, but it's all borked. Is screencast okay? I got code: " + res.statusCode
         else
            parseForContentUrl body, callback

parseForContentUrl = ( body, callback ) ->
  contentUrls = body.match /src="(https?:\/\/content.screencast.com\/users(.*?))"/
  callback contentUrls[1] if contentUrls

module.exports = (robot) ->
  robot.hear /(https?:\/\/(www.)?screencast.com\/(t|users)\/[^\s]*)/, (response) ->
    getContentUrl response.match[1], response, ( url ) ->
       response.send url