#!/bin/bash

# create the .bash_aliases file from a template
./create_bash_aliases.sh
source ./install/install_funcs.sh

if [ -f ~/.bash_profile ]
  then
    dotfiles_update_config ~/.bash_profile    
elif [ -f ~/.zshrc ]
  then
    echo ".bash_profile does NOT exist.... trying for .zshrc"
    dotfiles_update_config ~/.zshrc

    ./install/zshrc_add_preferred_theme.sh
else
  echo "no known profile / config / rc file found. unable to source dotfiles!"
fi
