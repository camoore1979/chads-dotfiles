#!/bin/bash
#my_curl_ scripts.sh
#Chad A. Moore
#Started April 24, 2014

##functions for executing Curl commands, JSON data is assumed 

# NOTE: see .bash_aliases for aliases to these functions.

# curlGetTest - curl get helper
#   $1 - URL 
curlGetTest() {
  curl --silent --show-error $1  > ./test.json
  python -m json.tool ./test.json
  rm ./test.json 
}
 
# curlPostLogin - curl post helper for the login route
curlPostLogin() {

  curl --silent --show-error -X POST -H"Content-Type: application/json" -d'{"userId":"chad","password":"test1b"}' "http://localhost:3000/api/login" > ./auth.json
  python -m json.tool ./auth.json

  authToken=$(cat auth.json | python -c 'import sys, json; print json.load(sys.stdin)[sys.argv[1]]' token)

  echo $authToken > authToken.txt
  rm ./auth.json
}

# curlPostTest - curl post helper
#   $1 - data in json file
#   $2 - URL 
curlPostTest() {

  curl --silent --show-error -X POST -H"Content-Type: application/json" -d$1 $2 > ./test.json
  python -m json.tool ./test.json
  rm ./test.json 
}

# curlPutTest - curl put helper
#   $1 - data in json file
#   $2 - URL 
curlPutTest() {

  curl --silent --show-error -X PUT -H"Content-Type: application/json" -d$1 $2 > ./test.json
  python -m json.tool ./test.json
  rm ./test.json 
}

# curlDeleteTest- curl delete helper
#   $1 - URL 
curlDeleteTest() {
  curl --silent --show-error -X DELETE $1  > ./test.json
  python -m json.tool ./test.json 
  rm ./test.json 
}


# curlGetTestwAuth - curl get helper requiring an Auth Token
#   $1 - Auth Header
#   $2 - URL 
curlGetTestwAuth() {
  curl --silent --show-error -H"$1" $2  > ./test.json
  python -m json.tool ./test.json 
  rm ./test.json 
}
 
# curlPostTestwAuth - curl post helper
#   $1 - Auth Header
#   $2 - data in json file
#   $3 - URL 
curlPostTestwAuth() {

  curl --silent --show-error -X POST -H"$1" -H"Content-Type: application/json" -d$2 $3 > ./test.json
  python -m json.tool ./test.json
  rm ./test.json 
}

# curlPutTestwAuth - curl put helper
#   $1 - Auth Header
#   $2 - data in json file
#   $3 - URL 
curlPutTestwAuth() {

  curl --silent --show-error -X PUT -H"$1" -H"Content-Type: application/json" -d$2 $3 > ./test.json
  python -m json.tool ./test.json
  rm ./test.json 
}

# curlDeleteTestwAuth- curl delete helper
#   $1 - Auth Header
#   $2 - URL 
curlDeleteTestwAuth() {
  curl --silent --show-error -X DELETE -H"$1" $2  > ./test.json
  python -m json.tool ./test.json 
  rm ./test.json 
}


curlGetWAuth() {
  authHeader="Authorization: Token: "
  authToken=$(cat authToken.txt)

  curl --silent --show-error -H"$authHeader$authToken" $1 > test.json
  python -m json.tool test.json
  rm test.json
}

curlPostWAuth() {
  authHeader="Authorization: Token: "
  authToken=$(cat authToken.txt)

  curl --silent --show-error -X POST -H"$authHeader$authToken" -H"Content-Type: application/json" -d$1 $2 > ./test.json
  python -m json.tool test.json
  rm test.json

}

curlPutWAuth() {
  authHeader="Authorization: Token: "
  authToken=$(cat authToken.txt)

  curl --silent --show-error -X PUT -H"$authHeader$authToken" -H"Content-Type: application/json" -d$1 $2 > ./test.json
  python -m json.tool test.json
  rm test.json
}

curlDeleteWAuth() {
  authHeader="Authorization: Token: "
  authToken=$(cat authToken.txt)

  curl --silent --show-error -X DELETE -H"$authHeader$authToken" $1 > test.json
  python -m json.tool test.json
  rm test.json
}

