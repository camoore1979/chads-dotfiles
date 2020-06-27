#!/bin/bash

# docker images
# cdls - list all docker images
alias cdls='docker image ls'

# cdb - docker build
alias cdb='docker build .'

# cdbn - docker build no cache
alias cdbn='docker build . --no-cache'


# cdbt - docker build, pass image name 
my_docker_build_command() {
  docker build -t $1 .
}
alias cdbt='my_docker_build_command'

# cdrm - docker remove image
my_docker_rm_command() {
  docker rmi $1
}
alias cdrm='my_docker_rm_command'

# cdrma - destroy all docker images
alias cdrma='docker rmi $(docker image ls -q)'

# docker containers

# cdps - list running docker containers
alias cdps='docker ps'

# cdpsa - list all docker containers, including stopped ones
alias cdpsa='docker ps -a'
my_docker_logs_command() {
  docker container logs --tail $1
}

# cdsa - stop all running containers
alias cdsa='docker stop $(docker ps -q)'

# cdda - delete all running and stopped containers
alias cdda='docker container rm -f $(docker ps -aq)'

# cgdid - get latest docker image id
alias cgdid='docker image ls -q | head -n 1 | pbcopy'

# cgdid2 - get latest docker image id
# my_docker_get_last_image_id() {
#   local CGDID2_MY_DOCKER_IMAGE
#   CGDID2_MY_DOCKER_IMAGE="$(docker image ls -q | head -n 1)"
#   echo $CGDID2_MY_DOCKER_IMAGE_ID | pbcopy
#   echo "$CGDID2_MY_DOCKER_IMAGE_ID copied to clipboard!"
# }
# alias cgdid2='my_docker_get_last_image_id'

# my_test_function () {
#   local func_result="some result 2"
#   echo "$func_result"
# }
# alias myfunc='my_test_function'

# cdrs - docker run and connect via shell command
function my_docker_run_sh() {
  docker run --entrypoint "/bin/sh" -it $1
}
alias cdrs='my_docker_run_sh'

# cdcc - connect to running container 
function my_docker_connect_to_container() {
  docker exec -it $1 bash
}
alias cdcc='my_docker_connect_to_container'

alias cdcu='docker-compose up'