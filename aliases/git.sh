#!/bin/bash

# in order to not conflict with ohmyzsh git plugin
# the following are prefixed with 'c'
# for zsh git plugin see: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git

# status
alias cgl='my_long_git_stat_func'

# branch management
alias cgbr='git branch -l | cat'

# cgit log aliases
alias cgg='my_git_graph'
alias cgitp='my_git_pretty'
alias cgg2='my_git_graph2'

alias cgfco='my_git_fetch_and_checkout'