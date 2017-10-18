# ~/.bash_aliases
# Chad's dotfiles

# add my local bin to Path
export PATH="~/bin:/usr/local/bin:$PATH"

#customize bash shell prompt
# for more, see https://www.howtogeek.com/307701/how-to-customize-and-colorize-your-bash-prompt/
#PS1="\u\$ "
PS1="\u@\h:\w\$ "
#PS1="\[\034[0;32m\]✔\[\033[0;0m\] \[\033[0;33m\]\w\[\033[0;0m\]  $ "

# load my scripts
#TODO: move this to it's own script
. "$HOME/dotfiles/my_grep_scripts.sh"
. "$HOME/dotfiles/my_git_scripts.sh"
. "$HOME/dotfiles/my_curl_scripts.sh"
. "$HOME/dotfiles/my_misc_scripts.sh"


# add git info to command line prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

GIT_PROMPT_ONLY_IN_REPO=1

if [ -f ~/.project_aliases ]; then
  source ~/.project_aliases
  echo ".project_aliases loaded.."
fi

if [ -f ~/git-completion.bash ]; then
  . ~/git-completion.bash
  echo "git-completion.bash loaded"
fi

#TODO: move this to it's own script
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias pa='print_my_aliases'
alias s='source ~/.bash_profile'
alias ts='echo "hello"'

# create aliases for common commands
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lh='ls -hF --color=tty'
alias ld='ls -d */'
alias c='clear'
alias gh='cd ~'
alias gr='my_grep_function'
alias t='my_tail_func'

# vim aliases
alias v='vim'

# create aliases for git stuff
alias gb='git branch'
alias gs='git status'
alias gbr='my_git_remote_branches_func'
alias gc='my_git_commit_func'
alias ga='my_git_add_func'
alias gaa='git add -A'
alias gl='my_long_git_stat_func'
alias gg='my_git_graph'
alias gitp='my_git_pretty'
alias gg2='my_git_graph2'


# create aliases for my curl commands
alias curlG='curlGetTest'
alias curlP='curlPostTest'
alias curlPu='curlPutTest'
alias curlD='curlDeleteTest'

alias curlGH='curlGetTestwAuth'
alias curlPH='curlPostTestwAuth'
alias curlPuH='curlPutTestwAuth'
alias curlDH='curlDeleteTestwAuth'

alias getWAuth='curlGetWAuth'
alias postWAuth='curlPostWAuth'
alias putWAuth='curlPutWAuth'
alias deleteWAuth='curlDeleteWAuth'

alias loginChad='curlPostLogin'
