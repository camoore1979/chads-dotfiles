#!/bin/bash

ACTUAL_PATH=$(pwd)
echo "ACTUALPATH: $ACTUAL_PATH";
echo "ACTUALPATH: $(pwd)";
echo $(pwd)

sed "s,VAR_PATH_TO_DOTFILES,$ACTUAL_PATH,g" .bash_aliases.template > .bash_aliases
