#!/bin/bash
#Chad A. Moore
#Created April 24, 2014
# Various command line scripts, see .bash_alias for aliases for these funcs

my_grep_function() {

  grep -rn --include "$1" "$2" .
}

