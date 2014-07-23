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

nodemailer = require 'nodemailer' 

server = nodemailer.createTransport({
    service: 'Gmail',
    auth: {
        user: process.env.HUBOT_ANNOUNCEMENT_EMAIL_USER,
        pass: process.env.HUBOT_ANNOUNCEMENT_EMAIL_PASSWORD
    }
})

module.exports = (robot) ->
  
  robot.hear new RegExp("^" + process.env.HUBOT_ANNOUNCEMENT_TRIGGER_WORD + " (.*)", "i"), (msg) ->
    subject = msg.envelope.user.name + " announced"
    message = {
      text: msg.match[1],
      to: process.env.HUBOT_ANNOUNCEMENT_EMAIL_LIST,
      from: process.env.HUBOT_ANNOUNCEMENT_EMAIL_USER,
      subject: subject
    }
    
    server.sendMail message, (err, message) ->
      msg.send err if err