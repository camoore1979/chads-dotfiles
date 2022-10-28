#!/bin/bash

function parse_iucu_exported_csv_data {
  FILE_NAME=$1

  if [ -f $FILE_NAME ]; then
    TEMP_FILE_1=$(mktemp)
    TEMP_FILE_2=$(mktemp)
    FILE_NAME_WITHOUT_PATH="${FILE_NAME##*/}"
    FILE_NAME_WITHOUT_EXT="${FILE_NAME_WITHOUT_PATH%.*}"
    OUTPUT_FILE="$FILE_NAME_WITHOUT_EXT.transformed.csv"
    sed -e '1,4d' $FILE_NAME > $TEMP_FILE_1
    sed 's/\"//g' $TEMP_FILE_1 > $TEMP_FILE_2
    awk -f $PATH_TO_CHADS_DOTFILES/scripts/iucu_data_parser/parse.awk $TEMP_FILE_2 > $OUTPUT_FILE
    rm $TEMP_FILE_1
    rm $TEMP_FILE_2
  else
    echo "$FILE_NAME does not exist. Exiting..."
  fi

}

# alias cparseiucu='parse_iucu_exported_csv_data';
