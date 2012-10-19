# get the name of the branch we are on
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)(${ref#refs/heads/})%{$reset_color%} "
}

# Checks if working tree is dirty
function parse_git_dirty() {
	local STATUS
	STATUS="%{$fg[green]%}"
	if [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]]; then
		STATUS="%{$fg[red]%}"
	elif [[ $(git diff --cached --shortstat 2> /dev/null | tail -n1) != "" ]]; then
		STATUS="%{$fg[yellow]%}"
	fi
	echo $STATUS
}

function git_plugin_cleanup() {
	PROMPT=$PROMPT'$(git_prompt_info)'
}

oncleanup "git_plugin_cleanup"