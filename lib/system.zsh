# Get system

function is_osx() {
	[[ `uname` == "Darwin" ]]
}

function is_freebsd() {
	[[ `uname` == "FreeBSD" ]]
}

function is_linux() {
	[[ `uname` == "Linux" ]]
}

function system_lib_cleanup() {
	unset -f is_osx
	unset -f is_freebsd
	unset -f is_linux
}

oncleanup "system_lib_cleanup"