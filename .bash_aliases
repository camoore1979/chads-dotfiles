# ~/.bash_aliases
# loaded by .bashrc if this file exists
# Chad A. Moore, April 25, 2014

# add my local bin to Path
export PATH="~/bin:/usr/local/bin:$PATH"

# load my scripts
. "$HOME/dotfiles/my_grep_scripts.sh"
. "$HOME/dotfiles/my_git_scripts.sh"
. "$HOME/dotfiles/my_curl_scripts.sh"
. "$HOME/dotfiles/my_misc_scripts.sh"


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

# create aliases for common commands
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lh='ls -hF --color=tty'
alias c='clear'
alias gh='cd ~'
alias gr='my_grep_function'
alias t='my_tail_func'
alias s='source ~/.bash_profile;source ~/.profile;source ~/.bashrc'
alias hk='print_my_aliases'

# vim aliases
alias v='vim'

# create aliases for git stuff
alias gb='my_git_branches_func'
alias gbr='my_git_remote_branches_func'
alias gc='my_git_commit_func'
alias ga='my_git_add_func'
alias gs='my_git_stat_func'
alias gl='my_long_git_stat_func'
alias gg='my_git_graph'
alias gitp='my_git_pretty'
alias gg2='my_git_graph2'

alias pa='print_my_aliases'
alias p='my_cov_mp_ps_func'

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

#project specific aliases
alias gts='cd ~/tribescribe/code/tribescribe-mvp'
alias gpn='cd ~/project_ninja/code/project_ninja'
alias gmp='cd ~/covance/marketplace'
alias gst='cd ~/stonetracker'


#configure command line prompt
PS1="\n\[\e[0;32m\]\u\[\e[0m\]\[\e[0;35m\]@\[\e[0m\]\[\e[0;32m\]\h\[\e[0m\]\[\e[0;35m\]:\[\e[0m\]\w \[\e[0;31m\]\\[\e[0m\] ~\n\$  "

#PS1="\n\[\e[0;32m\]\u\[\e[0m\]\[\e[0;35m\]@\[\e[0m\]\[\e[0;32m\]\h\[\e[0m\]\[\e[0;35m\]:\[\e[0m\]\w \[\e[0;31m\]\$(vcprompt -f '%b%m%a%u') \[\e[0m\] ~\n\$  "
