#!/bin/zsh
# source ~/.zshrc;
set -e;

inputFile="$1"
inputFileName=$(basename "$inputFile")
inputFileNameWithoutExtension=${inputFileName%.*}
tmpFile="$inputFileNameWithoutExtension.tmp"
outputFile="transformed.$inputFileNameWithoutExtension.csv"

# trim first 3 lines of the IUCU transaction file
sed '1,3d' $inputFile > $tmpFile

# source & use nvm
. ~/.nvm/nvm.sh
nvm use

# parse the trimmed file & generate new csv file
zx ./iucu-data-parser.mjs $tmpFile  "./$outputFile"

rm $tmpFile