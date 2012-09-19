[[ "$zshconfig_path" == "" ]] && zshconfig_path=$ZSHCONFIG
[[ "$zshconfig_update_file" == "" ]] && zshconfig_update_file=$ZSHCONFIG_DATA/.zshconfig_update

zshconfig_git_version() {
	local current_path=`pwd`
	cd $zshconfig_path
	print `git rev-parse HEAD`
	cd $current_path
}

zshconfig_version="1.0 $(zshconfig_git_version)"

function zshconfig_current_epoch() {
	echo $(($(date +%s) / 60 / 60 / 24))
}

function zshconfig_save_update_file() {
	echo "LAST_EPOCH=$(zshconfig_current_epoch)" > $zshconfig_update_file
}

function zshconfig_update() {
	echo "$fg_bold[green]Update config: current version $zshconfig_version$reset_color"
	local current_path=`pwd`
	cd $zshconfig_path
	if git pull --quiet origin master
	then
		zshconfig_save_update_file
		local prev_version=$(print $zshconfig_version)
		source $zshconfig_path/update.zsh
		if [[ $prev_version == $zshconfig_version ]]; then
			echo "$fg_bold[green]Already up to date$reset_color"
		else
			echo "$fg_bold[green]ZSH Config updated success: installed version $zshconfig_version$reset_color"
		fi
	else
		echo "$fg_bold[red]Error occured while update ZSH Config$reset_color"
	fi
	cd $current_path
}

function zshconfig_check_update() {
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

zshconfig_check_update