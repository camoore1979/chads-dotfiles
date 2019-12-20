#!/bin/bash

# docker images

# cdls - list all docker images
alias cdls='docker image ls'

# cdb - docker build
alias cdb='docker build .'

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
