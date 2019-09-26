# ~/.bash_aliases
# Chad's dotfiles

# add my local bin to Path
export PATH="~/bin:/usr/local/bin:$PATH"

PATH_TO_DOTFILES=/Users/cmoore/dotfiles

# customize bash shell prompt
# for more, see https://www.howtogeek.com/307701/how-to-customize-and-colorize-your-bash-prompt/
#PS1="\u\$ "
PS1="\u@\h:\w\$ "
#PS1="\[\034[0;32m\]✔\[\033[0;0m\] \[\033[0;33m\]\w\[\033[0;0m\]  $ "

# Load my Scripts
. "$PATH_TO_DOTFILES/scripts/index.sh"

# Load Aliases
. "$PATH_TO_DOTFILES/aliases/index.sh"

if [ -f ~/.project_aliases ]; then
  source ~/.project_aliases
  echo ".project_aliases loaded.."
fi
