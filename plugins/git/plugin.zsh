# get the name of the branch we are on
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)(${ref#refs/heads/})%{$reset_color%} "
}

# Checks if working tree is dirty
function parse_git_dirty() {
	local STATUS
	local INDEX
	STATUS="%{$fg[green]%}"
	INDEX=$(git status -s 2> /dev/null)
	if [[ $INDEX != "" ]]; then
		STATUS="%{$fg[yellow]%}"
		if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
			STATUS="%{$fg[red]%}"
		elif $(echo "$INDEX" | grep '^[^ ]M' &> /dev/null); then
			STATUS="%{$fg[red]%}"
		elif $(echo "$INDEX" | grep '^[^ ]D ' &> /dev/null); then
			STATUS="%{$fg[red]%}"
		fi
	fi
	echo $STATUS
}

function git_plugin_cleanup() {
	PROMPT=$PROMPT'$(git_prompt_info)'
}

oncleanup "git_plugin_cleanup"