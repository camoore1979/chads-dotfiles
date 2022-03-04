#!/bin/zsh

my_analyze_code_files() {
    # see https://unix.stackexchange.com/questions/76617/passing-glob-expressions-to-functions-scripts
    # the $@ allows for the users shell to do the expansion, and the following includes all arguments to the func
    # which is the list of expanded filenames
    # ls -al -- "$@"

    TOTAL_FILES=$(ls -l $@ | wc -l);
    echo "Number of Files: $TOTAL_FILES";

    TOTAL_LINES=$(wc -l $@ | tail -n 1);
    echo "Number of Code Lines: $TOTAL_LINES";

    TOTAL_MEMORY=$(ls -FaGl $@ | awk '{ total += $5 }; END { print total }');
    MEMORY_KB=$((TOTAL_MEMORY/1000));
    echo "Memory: $TOTAL_MEMORY bytes ($MEMORY_KB KB)";
}

alias cacf='my_analyze_code_files'


fetch_pull_install() {
  git fetch

  if [ -z "$1" ]; then
    echo "No branch supplied."
  else
    git checkout $1  
  fi

  git pull

  nvm use

  npm install

}

alias cfpi='fetch_pull_install'


fetch_pull_install_lint_test() {
  git fetch

  if [ -z "$1" ]; then
    echo "No branch supplied."
  else
    git checkout $1  
  fi

  git pull

  nvm use

  npm install
  
  npm run lint

  npm run test
}

alias cfpilt='fetch_pull_install_lint_test'
