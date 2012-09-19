require_library 'spectrum'

local pscolor="green"
if [ $UID -eq 0 ] ; then
	pscolor="red"
fi

PROMPT="%{$fg_bold[$pscolor]%}[%{$fg_no_bold[$pscolor]%}%~%{$fg_bold[$pscolor]%}] %{$reset_color%}"

#ZSHCONFIG_GIT_SUFFIX=""
#ZSHCONFIG_GIT_PREFIX=""
#ZSHCONFIG_GIT_DIRTY=""
#ZSHCONFIG_GIT_CLEAN=""