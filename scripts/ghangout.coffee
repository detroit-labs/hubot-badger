# Description:
#   Quickly generate on the fly google hangouts that are accessible via the chromeboxes
#
# Dependencies:
#	None
#
# Configuration:
#	None
#
# Commands:
#   hubot ghangout me <roomname> - generates a room link for the given room name
# 	hubot ghang me <roomname> - generates a room link for the given room name
# 	hubot ghang <roomname> - generates a room link for the given room name
#	hubot ghangout <roomname> - generates a room link for the given room name
#
# Author:
#	Will Hinchman

module.exports = (robot) ->
	robot.respond /(ghangout|ghang)(?: me)?\s(.*)/i, (msg) ->
		roomName = msg.match[2]

		if not roomName.length
			msg.send "Something's gone terribly wrong, try a different name, maybe?"
			return

		roomName = roomName.replace /[^\w\s]/gi, ""
		roomName = roomName.replace /(\s)/g, ""
		
		if roomName.length
			msg.send "https://plus.google.com/hangouts/_/detroitlabs.com/#{roomName}"
			msg.send "Or join room \"#{roomName}\" via a Chromebox"
		else
			msg.send "Something's gone terribly wrong, try a different name, maybe?"