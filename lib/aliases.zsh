require_library 'system'

# List direcory contents
is_osx || is_freebsd && function {
	alias ls="ls -GkFh"
}
is_linux && alias ls="ls -kFh --color=auto"

alias la="ls -a"
alias ll="la -l"
alias l=ll
alias sl=ls

# Editor
if [[ "$EDITOR" != "" ]]; then
	alias ee=$EDITOR
	alias ee.="ee ."
fi

# Exit
alias e="exit"
alias q="exit"