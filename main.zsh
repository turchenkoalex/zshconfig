# Path
[[ ! -d $ZSHCONFIG ]] && ZSHCONFIG=$HOME/.zshconfig
[[ ! -d $ZSHCONFIG_DATA ]] && ZSHCONFIG_DATA=$ZSHCONFIG/work
[[ ! -d $ZSHCONFIG_LIB ]] && ZSHCONFIG_LIB=$ZSHCONFIG/lib
[[ ! -d $ZSHCONFIG_PLUGINS ]] && ZSHCONFIG_PLUGINS=$ZSHCONFIG/plugins

loaded_libraries=()

load_library() {
	if [[ $#loaded_libraries[(r)$1] == 0 ]]; then
		source $1
		loaded_libraries=($loaded_libraries $1)
	fi
}

require_library() {
	local lib=$ZSHCONFIG_LIB/$1.zsh
	if [ -f $lib ]; then
		load_library $lib
	fi
} 

# Loading libraries
for config_file ($ZSHCONFIG_LIB/*.zsh) load_library $config_file

unset config_file

# Init autocomplete
typeset -U fpath
autoload -U compinit
compinit -i -d $ZSHCONFIG_DATA/.zcompdump

# Cleanup variables
unset loaded_libraries
unset system
unset plugins
unset ZSHCONFIG_DATA
unset ZSHCONFIG_LIB
unset ZSHCONFIG_PLUGINS
unset ZSHCONFIG