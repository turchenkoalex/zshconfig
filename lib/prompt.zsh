require_library 'spectrum'

local pscolor="green"
local rpscolor="238"
if [ $UID -eq 0 ] ; then
	pscolor="red"
	rpscolor="203"
fi

PROMPT="%{$fg_bold[$pscolor]%}[%{$fg_no_bold[$pscolor]%}%~%{$fg_bold[$pscolor]%}] %{$reset_color%}"
RPROMPT="$FG[$rpscolor]%n@%m%{$reset_color%}%"