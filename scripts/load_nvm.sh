#!/bin/bash

## got this from https://stackoverflow.com/questions/47009776/how-to-run-nvm-in-oh-my-zsh

export LAZY_NVM_LOADED=notyet

lazynvm() {
  unset -f nvm node npm

  if [ -d ~/.nvm ]
  then

    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    echo "nvm/node/npm loaded!"
  else
    echo "nvm is not installed. Should expect a ~/.nvm dir to exist. Unable to load nvm!"
  fi
}

node() {
  if [ $LAZY_NVM_LOADED = 'notyet' ]; then
    echo "nvm/npm/node not yet loaded!"
    exit 1
  elif; then 
    node $@
  fi
}

npm() {
  if [ $LAZY_NVM_LOADED = 'notyet' ]; then
    echo "nvm/npm/node not yet loaded!"
  elif; then 
    npm $@
  fi
}

nvm() {
  if [ $LAZY_NVM_LOADED = 'notyet' ]; then
    echo "nvm/npm/node not yet loaded!"
  elif; then
    nvm $@
  fi
}

run_nvm_use() {
  nvm use
  returnValue=$?
  if [ $returnValue -ne 0 ]; then
    echo "no .nvmrc file, setting and loading default node."
    nvm alias default 12.18.3
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
  if [ $LAZY_NVM_LOADED = 'notyet' ]; then
    echo "nvm/node/npm not yet loading! Loading..."
    launch_nvm
  fi
  node --version
  npm --version
  nvm --version
  export LAZY_NVM_LOADED=loaded
}
