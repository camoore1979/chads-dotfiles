#!/bin/bash

source ./helpers/sed_helpers.sh

# # see https://github.com/ohmyzsh/ohmyzsh/wiki/themes#bureau
# ZSH_THEME="bureau"

ZSHRC_FILE=~/.zshrc

if [ -f $ZSHRC_FILE ];
then

  # comment_out_line_that_starts_with ~/.zshrc ZSH_THEME=

  # comment existing theme assignment
  LINE_VALUE=$(grep -m 1 "^ZSH_THEME=" $ZSHRC_FILE)
  NEW_LINE_VALUE="#$LINE_VALUE"
  sed -i -- "s/^$LINE_VALUE/$NEW_LINE_VALUE/g" $ZSHRC_FILE


  # add comment
  COMMENT_ABOUT_ZSH_THEME='# see https://github.com/ohmyzsh/ohmyzsh/wiki/themes#bureau'
  insert_after_line_that_starts_with ~/.zshrc '#ZSH_THEME="robbyrussell"' $COMMENT_ABOUT_ZSH_THEME
  sed -i -- '/^#ZSH_THEME="robbyrussell"/ a\ 
    '"$COMMENT_ABOUT_ZSH_THEME"'\
     ' $FILE_NAME

  # insert new theme


  # insert plugins
fi
