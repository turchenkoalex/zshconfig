if [[ -d $HOME/.rvm ]]; then
	export PATH=$PATH:$HOME/.rvm/bin
	[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
else
	if [[ -d /usr/local/rvm ]]; then
		export PATH=$PATH:$HOME/usr/local/rvm/bin
		[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm"
	fi
fi