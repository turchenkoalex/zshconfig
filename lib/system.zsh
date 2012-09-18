# Get system

function is_osx() {
	[[ `uname` == "Darwin" ]]
}

is_freebsd() {
	[[ `uname` == "FreeBSD" ]]
}

function is_linux() {
	[[ `uname` == "Linux" ]]
}