#!/bin/zsh

analyze_code_files() {
    # see https://unix.stackexchange.com/questions/76617/passing-glob-expressions-to-functions-scripts
    # the $@ allows for the users shell to do the expansion, and the following includes all arguments to the func
    # which is the list of expanded filenames
    # ls -al -- "$@"

    TOTAL_FILES=$(ls -l $@ | wc -l);
    echo "Number of Files: $TOTAL_FILES";

    TOTAL_LINES=$(wc -l $@ | tail -n 1);
    echo "Number of Code Lines: $TOTAL_LINES";

    TOTAL_MEMORY=$(ls -FaGl $@ | awk '{ total += $5 }; END { print total }');
    MEMORY_KB=$((TOTAL_MEMORY/1000));
    echo "Memory: $TOTAL_MEMORY bytes ($MEMORY_KB KB)";
}

alias acf='my_analyze_code_files'
