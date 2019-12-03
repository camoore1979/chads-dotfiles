#!/bin/bash

# in order to not conflict with ohmyzsh git plugin
# the following are prefixed with 'c'
# for zsh git plugin see: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git

# status
alias cgs='git status'
alias cgl='my_long_git_stat_func'

# branch management
alias cgcd='git checkout development'
alias cgco='my_git_checkout_branch_func'
alias cgbr='my_git_remote_branches_func'
alias cgb='git branch'

# adding / committing
alias gc='my_git_commit_func'
alias cga='my_git_add_func'
alias cgaa='git add -A'

# pushing / pulling
alias cgp='git push'
alias cget='git pull'
alias cgpush='my_git_push_origin_func'

# cgit log aliases
alias cgg='my_git_graph'
alias cgitp='my_git_pretty'
alias cgg2='my_git_graph2'
