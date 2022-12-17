#!/bin/zsh

function google-survey-parser {
  inputFile="$1"
  inputFileName=$(basename "$inputFile")
  inputFileNameWithoutExtension=${inputFileName%.*}
  tmpFile="$inputFileNameWithoutExtension.tmp"
  outputFile="$inputFileNameWithoutExtension.formatted.txt"

  # trim first 3 lines of the IUCU transaction file
  # sed '1,3d' $inputFile > $tmpFile

  # source & use nvm
  . ~/.nvm/nvm.sh
  nvm use 16.17.1

# parse the trimmed file & generate new csv file
  zx $PATH_TO_CHADS_DOTFILES/scripts/google-survey-parser/survey-parser.mjs $inputFile  "./$outputFile"

  # rm $tmpFile
}
alias cgparser='google-survey-parser';