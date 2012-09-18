function quick-look() {
  (( $# > 0 )) && qlmanage -p $* &>/dev/null &
}

function help() {
  man -t "$@" | open -f -a Preview
}