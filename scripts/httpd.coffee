# Description:
#   A simple interaction with the built in HTTP Daemon
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# URLS:
#   /hubot/version
#   /hubot/ping
#   /hubot/time
#   /hubot/info
#   /hubot/ip

spawn = require('child_process').spawn

module.exports = (robot) ->

  robot.http("https://dl.dropbox.com/s/ewvgh81qpelr9u7/standup.json?dl=1").get() (err, res, body) ->
    @standup = JSON.parse(body)

  robot.router.get "/hubot/version", (req, res) ->
    res.end robot.version

  robot.router.post "/hubot/ping", (req, res) ->
    res.end "PONG"

  robot.router.get "/hubot/time", (req, res) ->
    res.end "Server time is: #{new Date()}"
	
  robot.router.get "/hubot/standup/:team", (req, res) ->
    team = req.params["team"]
    
    if @standup.hasOwnProperty( team )
      res.end @standup[team]["messages"][0]
    else
      res.end "couldn't find the team"

  robot.router.get "/hubot/koha", (req, res) ->
    envelope = {}
    envelope.reply_to = "31582_detroit_labs@conf.hipchat.com"
    robot.send envelope, "http://livekoha.com/img/testimonial-tim.jpg"
    robot.send envelope, "KOHA STANDUP! KOHA STANDUP! KOHA STANDUP!"
    res.end "Dunzo"

  robot.router.get "/hubot/lunchclub", (req, res) ->
    envelope = {}
    envelope.reply_to = "31582_detroit_labs@conf.hipchat.com"
    robot.send envelope, "http://cdn.memegenerator.net/instances/400x/33855167.jpg"
    robot.send envelope, "LUNCH CLUB! LUNCH CLUB! LUNCH CLUB!"
    res.end "Dunzo"

  robot.router.get "/hubot/titlesource", (req, res) ->
    envelope = {}
    envelope.reply_to = "31582_detroit_labs@conf.hipchat.com"
    robot.send envelope, "http://www.enniscenter.org/wp-content/uploads/2011/07/Title-Source-Check-Presentation-e1309974615321.jpg"
    robot.send envelope, "TITLE SOURCE STANDUP! TITLE SOURCE STANDUP! TITLE SOURCE STANDUP!"
    res.end "Dunzo"

  robot.router.get "/hubot/shipped", (req, res) ->
    envelope = {}
    envelope.reply_to = "31582_detroit_labs@conf.hipchat.com"

    robot.send envelope, "Software has been shipped!"
    robot.send envelope, "http://3.bp.blogspot.com/-0soNROhh61I/TxCxse0cFdI/AAAAAAAAARE/v4nL2Zim7Bw/s1600/homer+woohoo.jpg"
    robot.send envelope, "Software has been shipped!"
    res.end "Dunzo"

  robot.router.get "/hubot/info", (req, res) ->
    child = spawn('/bin/sh', ['-c', "echo I\\'m $LOGNAME@$(hostname):$(pwd) \\($(git rev-parse HEAD)\\)"])

    child.stdout.on 'data', (data) ->
      res.end "#{data.toString().trim()} running node #{process.version} [pid: #{process.pid}]"
      child.stdin.end()

  robot.router.get "/hubot/ip", (req, res) ->
    robot.http('http://ifconfig.me/ip').get() (err, r, body) ->
      res.end body