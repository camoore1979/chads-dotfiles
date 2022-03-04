#!/bin/bash

my_git_fetch_and_checkout() {
  git fetch

  if [ -z "$1" ]; then
    echo "No branch supplied."
  else
    git checkout $1  
  fi
}

my_long_git_stat_func() {
  git status > git.status.txt
  less git.status.txt
}

my_git_graph() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
}

my_git_graph2() {
  git log --date=short --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --abbrev-commit 
}

my_git_pretty() {
  git log --pretty=format:"%h - %an, %ar : %s"
}

