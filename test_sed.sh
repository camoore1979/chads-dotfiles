#!/bin/bash

# for help, see http://www.grymoire.com/Unix/Sed.html

comment_out_line_that_starts_with() {
  FILE_NAME=$1
  STARTS_WITH=$2
  LINE_NUMBER=$(grep -c -n -m 1 "^$STARTS_WITH" $FILE_NAME)
  LINE_VALUE=$(grep -m 1 "^$STARTS_WITH" $FILE_NAME)
  echo "LINE_NUMBER: $LINE_NUMBER"
  echo "LINE_VALUE: $LINE_VALUE"

  if [ -n "$LINE_VALUE" ];
  then
    # sed -i -- 's/^asdf=.*/replace=me/g' $FILE_NAME
    NEW_LINE_VALUE="#$LINE_VALUE"
    sed -i -- "s/^$LINE_VALUE/$NEW_LINE_VALUE/g" $FILE_NAME
  fi
}

comment_out_line_that_starts_with ./testfile.txt replace

insert_after_line_that_starts_with() {
  FILE_NAME=$1
  STARTS_WITH=$2
  NEW_VALUE=$3
  LINE_NUMBER=$(grep -c -n -m 1 "^$STARTS_WITH" $FILE_NAME)
  LINE_VALUE=$(grep -m 1 "^$STARTS_WITH" $FILE_NAME)
  echo "LINE_NUMBER: $LINE_NUMBER"
  echo "LINE_VALUE: $LINE_VALUE"

  if [ -n "$LINE_VALUE" ];
  then
    # sed -i -- '
    # /^anothervalue=.*/ a\
    # after=me' ./testfile.txt
    sed -i -- '/^'"$STARTS_WITH"'/ a\ 
    '"$NEW_VALUE"'\
     ' $FILE_NAME
  fi
}

insert_after_line_that_starts_with ./testfile.txt anothervalue= "inserted line after the other one"
