#!/bin/bash

ACTUAL_PATH=$(pwd)

dotfiles_update_config() {
    echo "$1 exists!"
    LINE_NUMBER=$(grep -n "/.bash_aliases" $1 | cut -d: -f 1);

    if [ -n "$LINE_NUMBER" ] 
      then
        echo ".bash_aliases already sourced on line number $LINE_NUMBER in $1";
        # sed -i -e "$LINE_NUMBER d" $1
    else
        echo ".bash_aliases not in $1"
        echo "source $ACTUAL_PATH/.bash_aliases  # source aliases and scripts for chads dotfiles " >> $1
        echo "$1 updated"
    fi 
}
