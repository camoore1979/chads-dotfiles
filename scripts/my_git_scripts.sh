#!/bin/bash

my_git_fetch_and_checkout() {
  git fetch

  if [ -z "$1" ]; then
    echo "No branch supplied."
  else
    git checkout $1  
  fi
}
alias cgfco='my_git_fetch_and_checkout'

my_long_git_stat_func() {
  git status > git.status.txt
  less git.status.txt
}
alias cgl='my_long_git_stat_func'

my_git_graph() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
}
alias cgg='my_git_graph'

my_git_graph2() {
  git log --date=short --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --abbrev-commit 
}
alias cgitp='my_git_pretty'

my_git_pretty() {
  git log --pretty=format:"%h - %an, %ar : %s"
}
alias cgg2='my_git_graph2'

function my_github_create_pr {
  # use any options available for `gh pr create`
  gh pr create $@

  gh pr view -w
}
alias cghcp='my_github_create_pr'

alias cgbr='git branch -l | cat'
