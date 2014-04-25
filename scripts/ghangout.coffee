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
defaultRooms = [
	"supercoolroom",
	"the13thFloor",
	"robotemporium",
	"fartlab",
	"offtopic",
	"milleniumfalcon",
	"aluminumfalcon",
	"deathstar"
]

module.exports = (robot) ->
	robot.respond /(ghangout|ghang)(?: me)?\s(.*)/i, (msg) ->
		roomName = msg.match[2]

		roomName = parseRoomName(roomName)

		if not roomName.length
			roomName = parseRoomName(msg.envelope.room)
			if not roomName.length
				roomName = defaultRooms[Math.floor(Math.random() * defaultRooms.length)]
			msg.send "I didn't understand that room name, but here's one you can use anyway."

		msg.send "https://plus.google.com/hangouts/_/detroitlabs.com/#{roomName}"
		msg.send "Or join room \"#{roomName}\" via a Chromebox"


	parseRoomName = (roomName) ->
		roomName = roomName.replace /[^\w\s]/gi, ""
		roomName = roomName.replace /(\s)/g, ""