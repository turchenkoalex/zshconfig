# Changing/making/removing directory
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups

alias ..='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd/='cd /'
alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'

# mkdir & cd to it
function mcd() { 
  mkdir -p "$1" && cd "$1"; 
}
