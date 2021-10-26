#!/bin/bash

# list all of my defined functions
function my_print_my_functions {
  echo "List of All My User Defined Shell Functions"
  compgen -A function | grep '^my_'
}
alias claf='my_print_my_functions'

# list all of my defined aliases
function my_print_my_alias {
  echo "List of All My User Defined Shell Aliases"
  alias | grep "^c"
}
alias claa='my_print_my_alias'
