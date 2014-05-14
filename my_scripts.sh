#!/bin/bash
#my_scripts.sh
#Chad A. Moore
#Created April 24, 2014
# Various command line scripts, see .bash_alias for aliases for these funcs

# my_grep_function() - greps thru all the files types in the array below
# and returns matches to a text file and piped to less
#
# grep is called below with the following options;
#   -a  to force read of .html files as text (sometimes mistaken
#        for binary)
#   -n  to output file line number of match
#
# func has parameters:  
#   $1 - search string
#   $2 - for grep options, such as recursive option, 'r' or 'i' for 
#        case insensitivity
#  e.g. To grep in current dir and below, ignoring case sensitivity:
#        $ g ember ri
my_grep_function() {

  FileTypes=( "*.js" "*.php" "*.txt" "*.json" "*.css" "*.html" )

  if [[ -z "$1" ]]; then

    echo "No search string entered...."
    exit

  else
    for t in "${FileTypes[@]}"
    do
      grep -an$2$3 --include "$t" $1 .
    done
  fi

  echo "grepping complete! "
}

my_long_git_stat_func() {

  git status > git.status.txt

  less git.status.txt
}

my_git_stat_func() {

  git status 

}

my_git_graph() {

  git log --pretty=format:"%h %s" --graph

}
my_git_pretty() {
  git log --pretty=format:"%h - %an, %ar : %s"
}

my_tail_func() {
  tail -f $1
}
my_cov_mp_ps_func() {
  ps -e | grep node
  ps -e | grep mongod
  ps -e | grep java
}

print_my_aliases() {
  cat /home/cmoore/.bash_aliases
}
