// Description:
//   Finder command for Hubot which pulls from the Yelp API.
//   Can only search in Detroit right now.
//
// Dependencies:
//   yelp, bitly
//
// Configuration:
//   None
//
// Commands:
//   'hubot find me...'
//   e.g. —
//     hubot find me a quick lunch
//     hubot find me dinner
//     hubot find me breakfast
//     hubot find me a mechanic
//
// Author:
//   yramocan

// Javascript client for Yelp's API (v2.0)
// Copyright (c) 2012 Olivier Lalonde olalonde@gmail.com
// https://github.com/olalonde/node-yelp
var Yelp = require('yelp');

// Client for Bitly's API (v4.1.1)
// By Tane Piper piper.tane@gmail.com
// https://github.com/tanepiper/node-bitly
var Bitly = require('bitly');

var yelp = new Yelp({
  consumer_key: process.env.YELP_CONSUMER_KEY,
  consumer_secret: process.env.YELP_CONSUMER_SECRET,
  token: process.env.YELP_ACCESS_TOKEN,
  token_secret: process.env.YELP_ACCESS_TOKEN_SECRET
});

var bitly = new Bitly(process.env.BITLY_ACCESS_TOKEN);

module.exports = function(robot) {
  var patt = /find me a?\s?(.+)/i;

  robot.respond(patt, function(msg) {
    var args = msg.message.text.split(' ');
    var terms = msg.match[1];
    msg.send('Finding ' + terms + ' in the Detroit area...');

    // Searches within 5 miles (8000 meters).
    // Limits to one random result to deter Analysis Paralysis.
    // https://en.wikipedia.org/wiki/Analysis_paralysis
    yelp.search({term: terms, location: 'Detroit', radius_filter: 8000})
    .then(function(data) {
      var places = data.businesses.filter(function(x) {
        // Filter out businesses with ratings of 2.5 and lower.
        return x.rating > 2.5;
      });

      var len = places.length;

      if (len < 1) {
        // If there are no quality results in the area then provide
        // informational response.
        msg.send('Couldn\'t find quality ' + terms + ' in the area :\'(');
        return;
      }

      // Choose one random result in the top half of results returned
      // to the places array.
      var result = places[Math.floor(Math.random() * Math.floor(len / 2))];

      // Shorten URL using Bitly
      bitly.shorten(result.url).then(function(response) {
        var shortUrl = response.data.url;
        msg.send('How about ' + result.name + ' (' + result.rating + ' stars)?');
        msg.send('URL: ' + (shortUrl || result.url));
      });
    }).catch(function(err) {
      msg.send('There was an error locating your search results. Blame @nate-west-party-of-one.');
    });
  });
};
