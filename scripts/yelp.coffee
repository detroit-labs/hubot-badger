# Description:
#   A way to query Yelp! for business recommendations.
#
# Commands:
#   .yelp <query> - Search Yelp! for recommendations of businesses matching <query>

yelpApi = (msg, term, radius, cb) ->
  defCoords =
    lat: 42.335416
    lng: -83.049161
  defRadius = 5
  defLimit = 10

  msg.http('http://api.yelp.com/business_review_search')
    .query(
      term: term
      lat: defCoords.lat
      long: defCoords.lng
      radius: radius || defRadius
      limit: defLimit
      ywsid: 'jA2iIwr1Y2QV0MHe1n1mEQ'
    )
    .get() (err, res, body) ->
      response = JSON.parse(body)
      businesses = response?.businesses

      unless businesses.length
        msg.send "No results found for \"#{term}\""
        return

      cb msg.random businesses

businessView = (business) ->
  """
  You should go to #{business.name}
  #{business.url}
  #{business.photo_url}#.jpg
  """

module.exports = (robot) ->

  robot.respond /yelp (.+)/i, (msg) ->
    yelpApi msg, msg.match[1], 5, (business) ->
      msg.send businessView business
