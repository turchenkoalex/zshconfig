if [[ -d $HOME/.rvm ]]; then
	export PATH=$PATH:$HOME/.rvm/bin
	[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
	fpath=($HOME/.rvm/scripts/zsh/Completion $fpath)
else
	if [[ -d /usr/local/rvm ]]; then
		export PATH=$PATH:/usr/local/rvm/bin
		[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm"
		fpath=(/usr/local/rvm/scripts/zsh/Completion $fpath)
	fi
fi