# ~/.bash_aliases
# Chad's dotfiles

# add my local bin to Path
export PATH="~/bin:/usr/local/bin:$PATH"

# customize bash shell prompt
# for more, see https://www.howtogeek.com/307701/how-to-customize-and-colorize-your-bash-prompt/
#PS1="\u\$ "
PS1="\u@\h:\w\$ "
#PS1="\[\034[0;32m\]✔\[\033[0;0m\] \[\033[0;33m\]\w\[\033[0;0m\]  $ "

# Load my Scripts
#TODO: move this to it's own script
. "$HOME/dotfiles/scripts/my_grep_scripts.sh"
. "$HOME/dotfiles/scripts/my_git_scripts.sh"
. "$HOME/dotfiles/scripts/my_curl_scripts.sh"
. "$HOME/dotfiles/scripts/my_misc_scripts.sh"
. "$HOME/dotfiles/scripts/setup_git_helpers.sh"
. "$HOME/dotfiles/scripts/configure_cl_colors.sh"

# Load Aliases
alias pa='print_my_aliases'
alias s='source ~/.bash_profile'
alias ts='echo "hello"'
. "$HOME/dotfiles/aliases/curl.sh"
. "$HOME/dotfiles/aliases/git.sh"
. "$HOME/dotfiles/aliases/linux_cl.sh"
if [ -f ~/.project_aliases ]; then
  source ~/.project_aliases
  echo ".project_aliases loaded.."
fi
