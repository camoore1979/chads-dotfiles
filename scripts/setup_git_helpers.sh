#!/bin/bash

# add git info to command line prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

GIT_PROMPT_ONLY_IN_REPO=1

if [ -f ~/dotfiles/git-completion.bash ]; then
  . ~/dotfiles/git-completion.bash
  echo "git-completion.bash loaded"
fi
