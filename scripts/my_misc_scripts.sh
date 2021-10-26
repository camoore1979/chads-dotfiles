#!/bin/bash
#Chad A. Moore
#Created April 24, 2014

my_tail_func() {
  tail -f $1
}

my_print_aliases() {
  cat ~/.bash_aliases
}

my_kill_port() {
  lsof -i $1 | grep "(LISTEN)" | cut -c 9-13 | xargs kill
}

my_go_and_ls() {
  cd $1
  ls -al
}