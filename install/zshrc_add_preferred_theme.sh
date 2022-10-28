#!/bin/bash

source ./scripts/sed_helpers.sh

# # see https://github.com/ohmyzsh/ohmyzsh/wiki/themes#bureau
# ZSH_THEME="bureau"  

ZSHRC_FILE=~/.zshrc

if [ -f $ZSHRC_FILE ];
then

  # comment_out_line_that_starts_with ~/.zshrc ZSH_THEME=
  # comment existing theme assignment
  SEARCH_STRING=$(grep -m 1 "^ZSH_THEME=\"robbyrussell\"" $ZSHRC_FILE)

  if [ -n "$SEARCH_STRING" ];
  then
    NEW_LINE_VALUE="#$SEARCH_STRING"
    sed -i -- "s/^$SEARCH_STRING/$NEW_LINE_VALUE/g" $ZSHRC_FILE
  fi

  NEW_THEME_LINE="ZSH_THEME=\"bureau\""
  THEME_SEARCH=$(grep -m 1 "^ZSH_THEME=\"bureau\"" $ZSHRC_FILE)
  echo "THEME_SEARCH: $THEME_SEARCH"
  if [ -n "$THEME_SEARCH" ];
  then
    echo "$NEW_THEME_LINE already installed!"
  else
    # add comment
    echo "adding $NEW_THEME_LINE"
    COMMENT_ABOUT_ZSH_THEME='#CAM preferred theme: see https://github.com/ohmyzsh/ohmyzsh/wiki/themes#bureau'
    # insert_after_line_that_starts_with ~/.zshrc '#ZSH_THEME="robbyrussell"' $COMMENT_ABOUT_ZSH_THEME
    sed -i -- '/^#ZSH_THEME="robbyrussell"/ a\ 
      '"$COMMENT_ABOUT_ZSH_THEME"'\
      ' $ZSHRC_FILE

    # insert new theme
    sed -i -- '/^#CAM preferred theme:/ a\ 
      '"$NEW_THEME_LINE"'\
      ' $ZSHRC_FILE

  fi

  SEARCH_STRING=$(grep -m 1 "^plugins=" $ZSHRC_FILE)

  if [ -n "$SEARCH_STRING" ];
  then
    echo "adding preferred plugins"
    # insert plugins
    NEW_PLUGINS="plugins=(git gitfast vscode)"
    sed -i -- "s/^plugins=.*/plugins=(docker git gitfast vscode)/g" $ZSHRC_FILE
  else
    echo "preferred plugins already installed!"
  fi
fi
