require_library 'spectrum'

local pscolor="green"
if [ $UID -eq 0 ] ; then
	pscolor="red"
fi

PROMPT="%{$fg_bold[$pscolor]%}[%{$fg_no_bold[$pscolor]%}%~%{$fg_bold[$pscolor]%}] %{$reset_color%}"
RPROMPT="$FG[234]%n@%m%{$reset_color%}%"