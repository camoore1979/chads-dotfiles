#!/bin/bash
#my_curl_ scripts.sh
#Chad A. Moore
#Started April 24, 2014

##functions for executing Curl commands, JSON data is assumed 

# NOTE: see .bash_aliases for aliases to these functions.

# my_curl_get_test - curl get helper
#   $1 - URL 
my_curl_get_test() {
  curl --silent --show-error $1  > ./test.json
  python -m json.tool ./test.json
  rm ./test.json 
}
 
# my_curl_post_login - curl post helper for the login route
my_curl_post_login() {

  curl --silent --show-error -X POST -H"Content-Type: application/json" -d'{"userId":"chad","password":"test1b"}' "http://localhost:3000/api/login" > ./auth.json
  python -m json.tool ./auth.json

  authToken=$(cat auth.json | python -c 'import sys, json; print json.load(sys.stdin)[sys.argv[1]]' token)

  echo $authToken > authToken.txt
  rm ./auth.json
}

# my_curl_post_test - curl post helper
#   $1 - data in json file
#   $2 - URL 
my_curl_post_test() {

  curl --silent --show-error -X POST -H"Content-Type: application/json" -d$1 $2 > ./test.json
  python -m json.tool ./test.json
  rm ./test.json 
}

# my_curl_put_test - curl put helper
#   $1 - data in json file
#   $2 - URL 
my_curl_put_test() {

  curl --silent --show-error -X PUT -H"Content-Type: application/json" -d$1 $2 > ./test.json
  python -m json.tool ./test.json
  rm ./test.json 
}

# my_curl_delete_test- curl delete helper
#   $1 - URL 
my_curl_delete_test() {
  curl --silent --show-error -X DELETE $1  > ./test.json
  python -m json.tool ./test.json 
  rm ./test.json 
}


# my_curl_get_test_auth - curl get helper requiring an Auth Token
#   $1 - Auth Header
#   $2 - URL 
my_curl_get_test_auth() {
  curl --silent --show-error -H"$1" $2  > ./test.json
  python -m json.tool ./test.json 
  rm ./test.json 
}
 
# my_curl_post_test_auth - curl post helper
#   $1 - Auth Header
#   $2 - data in json file
#   $3 - URL 
my_curl_post_test_auth() {

  curl --silent --show-error -X POST -H"$1" -H"Content-Type: application/json" -d$2 $3 > ./test.json
  python -m json.tool ./test.json
  rm ./test.json 
}

# my_curl_put_test_auth - curl put helper
#   $1 - Auth Header
#   $2 - data in json file
#   $3 - URL 
my_curl_put_test_auth() {

  curl --silent --show-error -X PUT -H"$1" -H"Content-Type: application/json" -d$2 $3 > ./test.json
  python -m json.tool ./test.json
  rm ./test.json 
}

# my_curl_delete_test_auth- curl delete helper
#   $1 - Auth Header
#   $2 - URL 
my_curl_delete_test_auth() {
  curl --silent --show-error -X DELETE -H"$1" $2  > ./test.json
  python -m json.tool ./test.json 
  rm ./test.json 
}


my_curl_get_token() {
  authHeader="Authorization: Token: "
  authToken=$(cat authToken.txt)

  curl --silent --show-error -H"$authHeader$authToken" $1 > test.json
  python -m json.tool test.json
  rm test.json
}

my_curl_post_token() {
  authHeader="Authorization: Token: "
  authToken=$(cat authToken.txt)

  curl --silent --show-error -X POST -H"$authHeader$authToken" -H"Content-Type: application/json" -d$1 $2 > ./test.json
  python -m json.tool test.json
  rm test.json

}

my_curl_put_token() {
  authHeader="Authorization: Token: "
  authToken=$(cat authToken.txt)

  curl --silent --show-error -X PUT -H"$authHeader$authToken" -H"Content-Type: application/json" -d$1 $2 > ./test.json
  python -m json.tool test.json
  rm test.json
}

my_curl_delete_token() {
  authHeader="Authorization: Token: "
  authToken=$(cat authToken.txt)

  curl --silent --show-error -X DELETE -H"$authHeader$authToken" $1 > test.json
  python -m json.tool test.json
  rm test.json
}

