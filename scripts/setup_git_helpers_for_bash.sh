#!/bin/bash

# add git info to command line prompt

if [ -f ~/.bash_profile ];
then

  if [ -z "$(command -v brew)" ]; then 

    if [ -f ~/.bash-git-prompt/gitprompt.sh && "$SKIP_BASH_GIT_PROMPT" != "TRUE" ]; then
      GIT_PROMPT_ONLY_IN_REPO=1
      source ~/.bash-git-prompt/gitprompt.sh
      echo "bash-git-prompt loaded..."
    else
      echo "NOTE: you must have installed bash-git-prompt for this to work."
      echo "Brew is not available, use git to clone,"
      echo "See https://github.com/magicmonty/bash-git-prompt"
    fi

  else

    if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
        __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
        source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
        GIT_PROMPT_ONLY_IN_REPO=1
      echo "bash-git-prompt loaded..."
    else
      echo "NOTE: you must have installed bash-git-prompt for this to work."
      echo "Use brew to install, e.g. $ brew install bash-git-prompt"
      echo "See https://github.com/magicmonty/bash-git-prompt"
    fi
    
  fi
fi

# if [ -f ~/dotfiles/scripts/git-completion.bash ]; then
#   . ~/dotfiles/scripts/git-completion.bash
#   echo "git-completion.bash loaded"
# fi
