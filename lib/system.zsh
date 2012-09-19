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