# Description:
#   Random Nicolas Cage Movie Quote 
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   listens for Nicolas Cage
#   
#   
# Author:
#   ieatkimchi



quotes = [   "That’s funny, my name’s Roger. Two Rogers don’t make a right!",
			 "Put… the bunny… back… in the box.",
			 "Well, I’m one of those fortunate people who like my job, sir. Got my first chemistry set when I was seven, blew my eyebrows off, we never saw the cat again, been into it ever since.",
			 "Sorry boss, but there’s only two men I trust. One of them’s me. The other’s not you.",
			 "What’s in the bag? A shark or something?",
			 "You don’t have a lucky crack pipe?",
			 "Shoot him again… His soul’s still dancing.",
			 "Tool up, honey bunny. It’s time to get bad guys.",
			 "Bangers and mash! Bubbles and squeak! Smoked eel pie! Haggis!",
			 "I love pressure. I eat it for breakfast.",
			 "I just remembered, I have to go into town to pick up your anti-itch cream.",
			 "Hey. Dirtbag.",
			 "I’ll be taking these Huggies and whatever cash ya got.",
			 "After the Cold War, the AK-47 became Russia’s biggest export. After that came vodka, caviar, and suicidal novelists.",
			 "What did I do? You fuck with the bull, you get the horns. That’s what I did.",
			 "It’s like we’re on two different channels now. I’m CNN and she’s the Home Shopping Network.",
			 "People don’t throw things at me any more. Maybe because I carry a bow around.",
		]

module.exports = (robot) ->

  robot.hear /nicolas cage/i, (msg) ->
	msg.send msg.random quotes


	