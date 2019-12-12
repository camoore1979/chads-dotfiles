#!/bin/bash

## got this from https://stackoverflow.com/questions/47009776/how-to-run-nvm-in-oh-my-zsh

lazynvm() {
  unset -f nvm node npm

  if [ -d ~/.nvm ]
  then

    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  else
    echo "nvm is not installed. Should expect a ~/.nvm dir to exist. Unable to load nvm!"
  fi
}

nvm() {
  lazynvm 
  nvm $@
}

node() {
  lazynvm
  node $@
}

npm() {
  lazynvm
  npm $@
}

## move this later elsewhere
maven-migrate() {
  docker run -it --rm \
    --name maven-runner \
    -v "$(pwd)":/usr/src/mymaven \
    -w /usr/src/mymaven \
    maven:3.6.2-jdk-11 \
    mvn liquibase:update \
      -Dliquibase.username=polaris \
      -Dliquibase.password=password \
      -Dliquibase.url=jdbc:${1:-"postgresql://host.docker.internal:5434/hps"}
}