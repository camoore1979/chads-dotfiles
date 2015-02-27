'use strict'

var args = process.argv;

var searchTerm = args[2];

console.log('searching for term: ', searchTerm);

var request = require('request');

var url = 'http://search.crossref.org/dois?q=' + searchTerm + '&sort=normalizedScore&rows=3';



request(url, function (error, response, body) {
  
  if (error) {
    console.log('error: ', error);
    return process.exit(0);
  }

  if (response.statusCode != 200) {
    console.log('Unacceptable Response!');
    console.log('Response with HTTP Status Code: ', response.statusCode);
    return process.exit(0);
  }

  console.log('body: ', body);

  return process.exit(0);


});





