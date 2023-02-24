#!/bin/bash

source_my_dotfiles() {
  source "$PATH_TO_CHADS_DOTFILES/.bash_aliases"
}

alias pa='print_my_aliases'
alias s='source_my_dotfiles'


. "$PATH_TO_CHADS_DOTFILES/aliases/alias_helpers.sh"
. "$PATH_TO_CHADS_DOTFILES/aliases/curl.sh"
. "$PATH_TO_CHADS_DOTFILES/aliases/docker.sh"
. "$PATH_TO_CHADS_DOTFILES/aliases/linux_cl.sh"
. "$PATH_TO_CHADS_DOTFILES/aliases/nav.sh"
. "$PATH_TO_CHADS_DOTFILES/aliases/node.sh"
. "$PATH_TO_CHADS_DOTFILES/aliases/vscode.sh"
