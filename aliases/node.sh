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

# set_polaris_env_vars() {
#   export AUTH_JWT_SECRET=efahjef2wo321iweWdjh
#   export AUTH_LOGIN_URL=https://auth.dev.eoilreports.com
#   export GIT_COMMIT_INFO="$(git rev-parse HEAD),$(git describe --tags)"
#   export NPM_AUTH_TOKEN=55368147a70e30867510e60a4bd68395111511f8
# }

echo_env_vars() {
  echo "setting NODE_ENV=$NODE_ENV"
  # echo "AUTH_JWT_SECRET=$AUTH_JWT_SECRET"
  # echo "GIT_COMMIT_INFO=$GIT_COMMIT_INFO"
  # echo "NPM_AUTH_TOKEN=$NPM_AUTH_TOKEN"
}

set_node_env_prod() {
  export NODE_ENV=production
  # set_polaris_env_vars
  echo_env_vars
}

set_node_env_dev() {
  export NODE_ENV=development
  export GIT_COMMIT_INFO="$(git rev-parse HEAD),$(git describe --tags)"
  # set_polaris_env_vars
  echo_env_vars
}

alias nsp='set_node_env_prod'
alias nsd='set_node_env_dev'
