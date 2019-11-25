#!/bin/bash

ACTUAL_PATH=$(pwd)
echo "ACTUALPATH: $ACTUAL_PATH";

cd ~
FULL_PATH_TO_HOME=$(pwd)
echo "FULL_PATH_TO_HOME: $FULL_PATH_TO_HOME";
cd $ACTUAL_PATH

ACTUAL_PATH_TO_CHADS_CODE="$FULL_PATH_TO_HOME/code"

sed "s,VAR_PATH_TO_CHADS_DOTFILES,$ACTUAL_PATH,g" .bash_aliases.template > .bash_aliases
sed -i -- "s,VAR_PATH_TO_CHADS_CODE,$ACTUAL_PATH_TO_CHADS_CODE,g" .bash_aliases
