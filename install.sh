#!/bin/bash

# create the .bash_aliases file from a template
./create_bash_aliases.sh

ACTUAL_PATH=$(pwd)

if [ -f ~/.bash_profile ]
  then
    echo ".bash_profile exists!"
    LINE_NUMBER=$(grep -n "/.bash_aliases" ~/.bash_profile | cut -d: -f 1);

    if [ -n "$LINE_NUMBER" ] 
      then
      echo "sources .bash_aliases on line number $LINE_NUMBER, removing";
      sed -i -e "$LINE_NUMBER d" ~/.bash_profile
    else
      echo ".bash_aliases not in .bash_profile"
    fi 
    echo "source $ACTUAL_PATH/.bash_aliases  # source aliases and scripts for chads dotfiles " >> ~/.bash_profile
  else
    echo ".bash_profile does NOT exist."
fi
