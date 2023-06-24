#!/bin/bash

source_my_dotfiles() {
  source "$PATH_TO_CHADS_DOTFILES/.bash_aliases"
}

# LOAD ALL DOTFILE SCRIPTS
. "$PATH_TO_CHADS_DOTFILES/scripts/iucu-data-parser/iucu-data-parser.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/google-survey-parser/index.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/code_helpers.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/configure_cl_colors.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/load_nvm.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/maven.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/my_grep_scripts.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/my_git_scripts.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/my_curl_scripts.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/my_misc_scripts.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/my_nav_scripts.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/setup_git_helpers_for_bash.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/vscode.sh"

. "$PATH_TO_CHADS_DOTFILES/scripts/alias_helpers.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/curl.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/docker.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/linux_cl.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/nav.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/node.sh"
. "$PATH_TO_CHADS_DOTFILES/scripts/vscode.sh"

alias pa='print_my_aliases'
alias s='source_my_dotfiles'
