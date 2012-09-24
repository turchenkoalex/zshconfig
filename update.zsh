[[ "$zshconfig_path" == "" ]] && zshconfig_path=$ZSHCONFIG
[[ "$zshconfig_update_file" == "" ]] && zshconfig_update_file=$ZSHCONFIG_DATA/.zshconfig_update

function zshconfig_git_version() {
	local prev_path=`pwd`
	cd $zshconfig_path
	print `git rev-parse HEAD`
	cd $prev_path
}

zshconfig_version="1.1 (`zshconfig_git_version`)"

function zshconfig_current_epoch() {
	echo $(($(date +%s) / 60 / 60 / 24))
}

function zshconfig_save_update_file() {
	echo "LAST_EPOCH=$(zshconfig_current_epoch)" > $zshconfig_update_file
}

function zshconfig_update() {
	echo "\033[1;32mUpdate zshconfig: current version $zshconfig_version\033[0m"
	local current_path=`pwd`
	cd $zshconfig_path
	if git pull --quiet origin master
	then
		zshconfig_save_update_file
		zshconfig_prev_version=$(print $zshconfig_version)
		source $zshconfig_path/update.zsh
		if [[ "$zshconfig_prev_version" == "$zshconfig_version" ]]; then
			echo "\033[1;32mAlready up to date\033[0m"
		else
			echo "\033[1;32mZshconfig updated success: installed version $zshconfig_version\033[0m"
		fi
		unset zshconfig_prev_version
	else
		echo "\033[1;31mError occured while updating zshconfig\033[0m"
	fi
	cd $current_path
}

function zshconfig_update_check() {
	if [ -f $zshconfig_update_file ]; then
		source $zshconfig_update_file
		if [[ -z "$LAST_EPOCH" ]]; then
			zshconfig_save_update_file && return 0;
		else
			local epoch_diff=$(($(zshconfig_current_epoch) - $LAST_EPOCH))
			if [ $epoch_diff -gt 13 ]; then
				zshconfig_update
			fi
		fi
	else
		zshconfig_save_update_file
	fi
}

zshconfig_update_check