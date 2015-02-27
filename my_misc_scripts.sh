#!/bin/bash
#Chad A. Moore
#Created April 24, 2014

my_tail_func() {
  tail -f $1
}

my_cov_mp_ps_func() {
  ps -e | grep node
  ps -e | grep mongod
  ps -e | grep java
}

print_my_aliases() {
  cat ~/.bash_aliases
}


