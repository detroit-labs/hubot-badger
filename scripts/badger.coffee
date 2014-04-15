# Description:
#   Send friendly reminders to people through Hubot
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_BADGER_KEY
#
# Commands:
#   None
#
# Notes:
#   POST a JSON array to /badger
#   e.g. [{"name":"Nate West","message":"Pickup the milk!"}, {"name":"John Doe","message":"Tie your shoes."}]
#   The source needs to use HMAC-md5 based on HUBOT_BADGER_KEY
#   Currently only works on hipchat.
#
# Author:
#   nwest

crypto = require('crypto')

module.exports = (robot) ->
  robot.router.post "/badger", (req, res) ->
    hmac = crypto.createHmac "md5", process.env.HUBOT_BADGER_KEY
    hmac.update JSON.stringify req.body

    if req.header("X-BADGER-HMAC-MD5") == hmac.digest("hex")
      for dispatch in req.body
        if user = robot.brain.userForName dispatch["name"]
          robot.send user.jid, dispatch["message"]
      res.end "OK"
    else
      res.end "Nope."

  robot.router.post "/remind", (req, res) ->
    hmac = crypto.createHmac "md5", process.env.HUBOT_BADGER_KEY
    hmac.update JSON.stringify req.body

    if req.header("X-BADGER-HMAC-MD5") == hmac.digest("hex")
      payload = req.body
      robot.messageRoom payload["room"], [payload["message"]]
      res.end "OK"
    else
      res.end "Nope."
