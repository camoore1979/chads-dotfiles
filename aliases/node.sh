#!/bin/bash

alias clne='my_launch_node_env'

alias cnr='npm run'
alias cnrb='npm run build'
alias cnrd='npm run develop'
alias cnrl='npm run lint'
alias cnrlf='npm run lint-fix'
alias cnrs='npm start'
alias cnrt='npm test'

my_echo_env_vars() {
  echo "setting NODE_ENV=$NODE_ENV"
}

my_set_node_env_prod() {
  export NODE_ENV=production
  # set_polaris_env_vars
  my_echo_env_vars
}

my_set_node_env_dev() {
  export NODE_ENV=development
  export GIT_COMMIT_INFO="$(git rev-parse HEAD),$(git describe --tags)"
  # set_polaris_env_vars
  my_echo_env_vars
}

alias nsp='my_set_node_env_prod'
alias nsd='my_set_node_env_dev'
