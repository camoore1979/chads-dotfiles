#!/bin/bash

set -e

CURRENT_DIR=$(pwd);

WORKING_DIR=/Users/chadmoore/code/projects/polaris

cd $WORKING_DIR

list_of_repos=(
    "aurora-service"
    "aurora-client"
    "aurora-lambdas"
    # "eslint-config-polaris"
    "horizon-pro-api"
    "legacy-data-loader"
    "polaris-cli"
    "polaris-nest-core"
    "polaris-ui-reference"
    "rule-template-generator"
    "wavefront-integrator"
)

export NODE_ENV=development

for dir in "${list_of_repos[@]}"; 
do 
  echo " "  
  cd "$WORKING_DIR/$dir"
  echo "repository: $dir"
#   nvm use
  git stash clear
  git stash
  git checkout develop
  git fetch
  git pull
  npm i
  npm run lint
done


cd $CURRENT_DIR
