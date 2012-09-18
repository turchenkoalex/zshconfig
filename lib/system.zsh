# Get system
system=`uname`

function is_osx() {
	[[ $system == "Darwin" ]]
}

is_freebsd() {
	[[ $system == "FreeBSD" ]]
}

function is_linux() {
	[[ $system == "Linux" ]]
}