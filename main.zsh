# Pathes
[[ ! -d $ZSHCONFIG ]] && ZSHCONFIG=$HOME/.zshconfig
[[ ! -d $ZSHCONFIG_DATA ]] && ZSHCONFIG_DATA=$ZSHCONFIG/work
[[ ! -d $ZSHCONFIG_LIB ]] && ZSHCONFIG_LIB=$ZSHCONFIG/lib
[[ ! -d $ZSHCONFIG_PLUGINS ]] && ZSHCONFIG_PLUGINS=$ZSHCONFIG/plugins

# Update zshconfig
if [ -f $ZSHCONFIG/update.zsh ]; then
	source $ZSHCONFIG/update.zsh
fi

# Cleanup
cleanup_functions=()

function oncleanup() {
	cleanup_functions=($1 $cleanup_functions)
}

function docleanup_function() {
	local func=$1
	$func
	unset -f $func
}

function docleanup_full() {
	for cleanup_function ($cleanup_functions) docleanup_function $cleanup_function
	unset cleanup_function
	unset cleanup_functions

	unset -f oncleanup
	unset -f docleanup_function
	unset -f docleanup_full
}

# Loading libraries
loaded_libraries=()

function load_library() {
	if [[ $#loaded_libraries[(r)$1] == 0 ]]; then
		source $1
		loaded_libraries=($loaded_libraries $1)
	fi
}

function require_library() {
	local lib=$ZSHCONFIG_LIB/$1.zsh
	if [ -f $lib ]; then
		load_library $lib
	fi
}

function loading_libraries() {
	for config_file ($ZSHCONFIG_LIB/*.zsh) load_library $config_file
	unset config_file
	unset loaded_libraries
}

# Cleanup main func
function cleanup_main_lib() {
	unset ZSHCONFIG_DATA
	unset ZSHCONFIG_LIB
	unset ZSHCONFIG_PLUGINS
}
oncleanup "cleanup_main_lib"

loading_libraries

# Init autocomplete
typeset -U fpath
autoload -U compinit
compinit -i -d $ZSHCONFIG_DATA/.zcompdump	

docleanup_full