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