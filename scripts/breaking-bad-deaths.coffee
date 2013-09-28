# Description:
#    Animated gifs of all deaths from AMC's breaking bad.  Images from Buzzfeed http://www.buzzfeed.com/robinedds/an-exhaustive-rundown-of-every-single-death-in-breaking-bad
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   breaking bad death - Displays a random death scene from Breaking Bad
#   is <name> dead - Check if a character is dead or not
#
# Author:
#   Jake Payton

 images = [
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr01/26/12/anigif_original-grid-image-20674-1380212644-3.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr05/26/12/anigif_enhanced-buzz-20530-1380212938-0.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr05/26/12/anigif_original-grid-image-17969-1380213360-17.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr02/26/12/anigif_enhanced-buzz-31543-1380213848-18.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr05/26/12/anigif_enhanced-buzz-19938-1380214179-13.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr05/26/12/anigif_enhanced-buzz-19940-1380214527-22.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr05/26/12/anigif_enhanced-buzz-19955-1380214726-32.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr05/26/13/anigif_enhanced-buzz-29746-1380218270-0.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr02/26/14/anigif_enhanced-buzz-13162-1380218422-22.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr02/26/14/anigif_enhanced-buzz-15119-1380218664-16.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr03/26/14/anigif_enhanced-buzz-23104-1380219527-11.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr02/26/14/anigif_enhanced-buzz-14069-1380219967-16.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr01/27/4/anigif_enhanced-buzz-9233-1380269901-0.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/4/anigif_enhanced-buzz-14731-1380269973-0.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr01/27/4/anigif_enhanced-buzz-16373-1380270438-0.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr01/27/4/anigif_enhanced-buzz-18121-1380270524-2.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr01/27/4/anigif_enhanced-buzz-13128-1380271054-5.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr01/27/4/anigif_enhanced-buzz-17498-1380271087-0.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/8/anigif_enhanced-buzz-7308-1380285167-0.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/4/anigif_enhanced-buzz-14493-1380271738-20.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/4/anigif_enhanced-buzz-29219-1380271789-0.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/5/anigif_enhanced-buzz-10458-1380272454-0.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/5/anigif_enhanced-buzz-11576-1380272780-6.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr03/27/5/anigif_original-grid-image-21620-1380272813-8.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr03/27/5/anigif_enhanced-buzz-22461-1380273081-2.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/5/anigif_enhanced-buzz-11315-1380273406-5.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/5/anigif_enhanced-buzz-19535-1380273799-9.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/5/anigif_enhanced-buzz-16749-1380274244-11.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr03/27/5/anigif_enhanced-buzz-2296-1380274271-0.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr03/27/5/anigif_enhanced-buzz-26107-1380274562-3.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/5/anigif_enhanced-buzz-21306-1380274596-1.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr03/27/5/anigif_enhanced-buzz-7043-1380274915-0.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/5/anigif_enhanced-buzz-14215-1380275204-2.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/5/anigif_enhanced-buzz-18143-1380275518-9.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr01/27/5/anigif_enhanced-buzz-11291-1380275729-4.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/5/anigif_enhanced-buzz-17116-1380275965-38.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/6/anigif_enhanced-buzz-14731-1380276199-19.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr01/27/6/anigif_enhanced-buzz-17110-1380276540-13.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/6/anigif_enhanced-buzz-13839-1380276591-4.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr03/27/6/anigif_original-grid-image-14634-1380276960-3.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/6/anigif_enhanced-buzz-7356-1380277150-0.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr03/27/6/anigif_enhanced-buzz-14672-1380277448-0.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr03/27/6/anigif_original-grid-image-14582-1380277524-8.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr03/27/6/anigif_original-grid-image-14582-1380277526-12.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/6/anigif_enhanced-buzz-7343-1380277790-2.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/6/anigif_enhanced-buzz-7343-1380278182-4.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr03/27/6/anigif_enhanced-buzz-14655-1380278230-0.gif",
   "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/6/anigif_enhanced-buzz-7392-1380278438-5.gif"
 ]

 module.exports = (robot) ->
   robot.hear /breaking bad death/i, (msg) ->
     msg.send msg.random images

   robot.hear /is hank dead/i, (msg) ->
     msg.send "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr03/27/6/anigif_enhanced-buzz-14655-1380278230-0.gif"
   
   robot.hear /is gus dead/i, (msg) ->
     msg.send "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr01/27/5/anigif_enhanced-buzz-11291-1380275729-4.gif"

   robot.hear /is tuco dead/i, (msg) ->
     msg.send "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr05/26/12/anigif_enhanced-buzz-19938-1380214179-13.gif"

   robot.hear /is jane dead/i, (msg) ->
     msg.send "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr03/26/14/anigif_enhanced-buzz-23104-1380219527-11.gif"

   robot.hear /is gale dead/i, (msg) ->
     msg.send "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/5/anigif_enhanced-buzz-11315-1380273406-5.gif"

   robot.hear /is don eladio dead/i, (msg) ->
     msg.send "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/5/anigif_enhanced-buzz-18143-1380275518-9.gif"

   robot.hear /is mike dead/i, (msg) ->
     msg.send "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/6/anigif_enhanced-buzz-7356-1380277150-0.gif"

   robot.hear /is steve dead/i, (msg) ->
     msg.send "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/6/anigif_enhanced-buzz-7343-1380278182-4.gif"

   robot.hear /is andrea dead/i, (msg) ->
     msg.send "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/6/anigif_enhanced-buzz-7392-1380278438-5.gif"

   robot.hear /is (todd|meth damon) dead/i, (msg) ->
     msg.send "http://s3-ec.buzzfed.com/static/2013-09/enhanced/webdr06/27/6/anigif_enhanced-buzz-19526-1380276891-9.gif"

   robot.hear /is (jesse|pinkman|jesse pinkman) dead/i, (msg) ->
     msg.send "https://lh5.googleusercontent.com/-yfqyg6jhC7U/UiZUVl-VwMI/AAAAAAAAAtc/k4GgVeBMsFs/breaking-bad-gif-jesse-pinkman-29695.gif"

   robot.hear /is (walt|walter|walter white|mr white) dead/i, (msg) ->
     msg.send "http://i.imgur.com/jo4kZQ8.gif"

   robot.hear /is heisenberg dead/i, (msg) ->
     msg.send "http://cdn.uproxx.com/wp-content/uploads/2012/08/heisenberg-saymyname.gif"

   robot.hear /is mr lambert dead/i, (msg) ->
     msg.send "http://kalipinckney.files.wordpress.com/2012/08/livefreeordie-dennys.jpg"

   robot.hear /is skyler dead/i, (msg) ->
     msg.send "http://thebacklot.mtvnimages.com/uploads/2013/04/bb-skyshutup1.gif"

   robot.hear /is walt jr dead/i, (msg) ->
     msg.send "http://media3.giphy.com/media/r2yaMm7v7je8w/original.gif"
