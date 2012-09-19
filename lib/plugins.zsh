require_library 'system'
require_library 'environment'

is_osx && plugins=($plugins osx)
is_linux && plugins=($plugins linux)
is_freebsd && plugins=($plugins freebsd)

function is_plugin() {
	local plugin_dir=$1/$2
	test -d $plugin_dir && (test -f $plugin_dir/plugin.zsh || test -f $plugin_dir/_*)
}

for plugin ($plugins); do
	if is_plugin $ZSHCONFIG_PLUGINS $plugin; then
		fpath=($ZSHCONFIG_PLUGINS/$plugin $fpath)
		if [ -f $ZSHCONFIG_PLUGINS/$plugin/plugin.zsh ]; then
			source $ZSHCONFIG_PLUGINS/$plugin/plugin.zsh
	  fi
	fi
done