# Description:
#   Sends an email
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_ANNOUNCEMENT_EMAIL_LIST
#   HUBOT_ANNOUNCEMENT_TRIGGER_WORD
#   HUBOT_ANNOUNCEMENT_EMAIL_USER
#   HUBOT_ANNOUNCEMENT_EMAIL_PASSWORD
#
# Commands:
#   None
#
# Notes:
#   Looks for a trigger phrase at the start of the message and will send an email to a predermined address.
#   If you are using 2 Factor Auth Gmail account, you will have to use an App Password
#
# Author:
#   maschall

email = require 'emailjs/email'

server = email.server.connect ({
  user: process.env.HUBOT_ANNOUNCEMENT_EMAIL_USER,
  password: process.env.HUBOT_ANNOUNCEMENT_EMAIL_PASSWORD,
  host: "smtp.gmail.com",
  ssl: true,
  port: 465,
  domain: "gmail.com",
})

module.exports = (robot) ->
  robot.hear new RegExp(process.env.HUBOT_ANNOUNCEMENT_TRIGGER_WORD + " (.*)", "i"), (msg) ->
    subject = msg.envelope.user.mention_name + " announced"
    message = {
      text: msg.match[1],
      to: process.env.HUBOT_ANNOUNCEMENT_EMAIL_LIST,
      subject: subject
    }
    
    server.send message, (err, message) ->
      msg.send err if err