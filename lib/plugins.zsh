require_library 'system'
require_library 'environment'

is_osx && plugins=($plugins osx)
is_linux && plugins=($plugins linux)
is_freebsd && plugins=($plugins freebsd)

is_plugin() {
	local base_dir=$1
	local name=$2
	test -d $base_dir/$name && (test -f $base_dir/$name/plugin.zsh || test -f $base_dir/$name/_*)
}

for plugin ($plugins); do
	if is_plugin $ZSHCONFIG_PLUGINS $plugin; then
		fpath=($ZSHCONFIG_PLUGINS/$plugin $fpath)
		if [ -f $ZSHCONFIG_PLUGINS/$plugin/plugin.zsh ]; then
			source $ZSHCONFIG_PLUGINS/$plugin/plugin.zsh
	  fi
	fi
done