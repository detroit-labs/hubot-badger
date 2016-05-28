# Description:
#   Finder command for Hubot which pulls from the Yelp API.
#   Can only search in Detroit right now.
#
# Dependencies:
#   yelp
#
# Configuration:
#   None
#
# Commands:
#   "hubot find me..."
#   e.g. —
#     hubot find me a quick lunch
#     hubot find me dinner
#     hubot find me breakfast
#     hubot find me a mechanic
#
# Author:
#   yramocan

Yelp = require 'yelp'

yelp = new Yelp {
  consumer_key: "O-ZaBbLcuC6T1GdJD6rdDQ",
  consumer_secret: "HbbI1K5RWud7gkADzmsyntC1nfo",
  token: "hGuFRantjeGCGMISPyG5eRuJp8EXtVn7",
  token_secret: "UklZ877wZakr6L797Vlgvu0R0vw"
}

module.exports = (robot) ->
  robot.respond /find me a?/i, (msg) ->
    args = msg.message.text.split " "
    query = args[args.length - 1]
    msg.send capitalize query + " in the area:"

    yelp.search { term: 'lunch', location: 'Detroit' }
    .then (data) ->
      console.log result.name + " (" + result.rating + " stars)" for result in data.businesses
    .catch (err) ->
      console.error(err)

# Since JS couldn't include a basic word capitalization method...
capitalize = (string) ->
    string.charAt(0).toUpperCase() + string.slice(1);
