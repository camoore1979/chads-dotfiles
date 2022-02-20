#!/bin/bash

function parse_iucu_exported_csv_data {
  FILE_NAME=$1
  FILE_NAME_TEMP="$1.tmp"
  sed -e '1,4d' $FILE_NAME > $FILE_NAME_TEMP
  awk -f $PATH_TO_CHADS_DOTFILES/scripts/iucu_data_parser/parse.awk $FILE_NAME_TEMP > $FILE_NAME.transformed
}

alias cparseiucu='parse_iucu_exported_csv_data';
