#!/bin/bash

# alias clne='my_launch_node_env'

nvm_use_and_npm_install() {
  nvm use
  npm i
}

alias cnr='npm run'
alias cnrb='npm run build'
alias cnrd='npm run develop'
alias cnrl='npm run lint'
alias cnrlf='npm run lint-fix'
alias cnrs='npm start'
alias cnrt='npm test'

alias nsp='my_set_node_env_prod'
alias nsd='my_set_node_env_dev'
alias cnvmi='nvm_use_and_npm_install'
