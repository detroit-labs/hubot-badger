# Description:
#   Unicode Faces
#
# Dependencies:
#   cool-ascii-faces
#
# Configuration:
#   None
#
# Commands:
#   face
#
# Author:
#   nwest

cool = require 'cool-ascii-faces'

module.exports = (robot) ->
  robot.respond /face/i, (msg) ->
    msg.send cool()
