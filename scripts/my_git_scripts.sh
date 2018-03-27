#!/bin/bash
#Chad A. Moore
#Created April 24, 2014


my_git_branches_func() {
  git branch
}

my_git_remote_branches_func() {
  git branch -r
}

my_long_git_stat_func() {

  git status > git.status.txt

  less git.status.txt
}

my_git_stat_func() {

  git status 

}

my_git_add_func() {
  git add $1

}

my_git_commit_func() {
  git commit -m"$1"

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

