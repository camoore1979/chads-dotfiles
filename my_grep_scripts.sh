#!/bin/bash
#Chad A. Moore
#Created April 24, 2014
# Various command line scripts, see .bash_alias for aliases for these funcs

my_grep_function() {

  grep -rn --include "$1" "$2" .
}

grep_mp_js_code() {

  pwd=`pwd`

  cd ~/covance/marketplace/client/marketplace

  grep -rn --include "*.js" "$1" .

  cd $pwd

}

grep_mp_hbs_code() {

  pwd=`pwd`

  cd ~/covance/marketplace/client/templates

  grep -rn --include "*.hbs" "$1" .

  cd ~/covance/marketplace/client/marketplace

  grep -rn --include "*.hbs" "$1" .

  cd $pwd

}

grep_mp_css_code() {

  pwd=`pwd`

  cd ~/covance/marketplace/client/css/less

  grep -rn --include "*.less" "$1" .

  grep -rn --include "*.css"  "$1" .

  cd $pwd

}

grep_mp_node_code() {

  pwd=`pwd`

  cd ~/covance/marketplace/server

  grep -rn --include "*.js" "$1"

  cd $pwd

}


