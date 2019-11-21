#!/bin/bash

# create the .bash_aliases file from a template
./create_bash_aliases.sh

ACTUAL_PATH=$(pwd)

dotfiles_update_config() {
    echo "$1 exists!"
    LINE_NUMBER=$(grep -n "/$1" $1 | cut -d: -f 1);

    if [ -n "$LINE_NUMBER" ] 
      then
             echo "sources .bash_aliases on line number $LINE_NUMBER, removing";
        sed -i -e "$LINE_NUMBER d" $1
    else
      echo ".bash_aliases not in $1"
    fi 
    echo "source $ACTUAL_PATH/.bash_aliases  # source aliases and scripts for chads dotfiles " >> $1
    echo "$1 updated"
}

if [ -f ~/.bash_profile ]
  then
    dotfiles_update_config ~/.bash_profile    
elif [ -f ~/.zshrc ]
  then
    echo ".bash_profile does NOT exist.... trying for .zshrc"
    dotfiles_update_config ~/.zshrc
else
  echo "no known profile / config / rc file found. unable to source dotfiles!"
fi
