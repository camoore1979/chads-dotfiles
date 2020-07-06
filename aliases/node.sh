#!/bin/bash

alias lne='launch_node_env'

alias nr='npm run'
alias nrb='npm run build'
alias nrd='npm run develop'
alias nrl='npm run lint'
alias nrlf='npm run lint-fix'
alias nrs='npm start'
alias nrt='npm test'

alias ys='yarn start'

set_node_env_prod() {
  export NODE_ENV=production
  export GIT_COMMIT_INFO="$(git rev-parse HEAD),$(git describe --tags)"
  echo "setting NODE_ENV=production"
  echo "NODE_ENV=$NODE_ENV"
  echo "GIT_COMMIT_INFO=$GIT_COMMIT_INFO"
}

set_node_env_dev() {
  export NODE_ENV=development
  export GIT_COMMIT_INFO="$(git rev-parse HEAD),$(git describe --tags)"
  echo "setting NODE_ENV=development"
  echo "NODE_ENV=$NODE_ENV"
  echo "GIT_COMMIT_INFO=$GIT_COMMIT_INFO"
}

alias nsp='set_node_env_prod'
alias nsd='set_node_env_dev'
