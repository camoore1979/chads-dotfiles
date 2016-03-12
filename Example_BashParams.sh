#!/bin/bash


echo "Examples of Using Bash Positional Parameters"

if [ $# == 0 ]; then
  echo "No positional parameters provided on command line!"
  echo "Enter at least one parameter and execute this script again!"
  exit
fi



echo " "
echo "Parameter \$1: $1"
echo "Parameter \$2: $2"

echo " "
echo "Example of \$*: $*"
echo "Do NOT use \$*. This can cause bugs and security holes in your software, instead use the following \$@"

echo " "
echo "Use \$@ to output all positional parameters."
echo "Example \$@: $@"

echo " "
echo "\$# gives the total number of positional parameters: $#"

echo " "
echo "\$0 Name of the shell script: $0"


exit 0;
