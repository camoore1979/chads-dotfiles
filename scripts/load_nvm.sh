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

run_nvm_use() {
  nvm use
  returnValue=$?
  if [ $returnValue -ne 0 ]; then
    nvm alias default 12.13.1
    nvm use default
  fi
}

launch_nvm() {
  lazynvm
  returnValue=$?
  if [ $returnValue -ne 0 ]; then
    run_nvm_use
  fi
}

launch_node_env() {
  launch_nvm
  node --version
  npm --version
  nvm --version
}
