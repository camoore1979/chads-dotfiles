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

node() {
  node $@
}

npm() {
  npm $@
}

nvm() {
  nvm $@
}

launch_node_env() {
  lazynvm
  returnValue=$?
  if [ $returnValue -ne 0 ]; then
    echo "\nHmm... problem with nvm:"
    echo "  a) nvm needs to be installed; or"
    echo "  b) you need to set a default node version\n"
  fi
  node --version
  npm --version
  nvm --version
}
