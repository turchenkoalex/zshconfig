[[ "$zshconfig_tag_file" == "" ]] && zshconfig_tag_file=$ZSHCONFIG_DATA/.zshconfig_tags

function tag {
	local tag_name=$1
	local dir_path=$2
	[[ "$dir_path" == "" ]] && dir_path=`pwd`
	echo "$tag_name=$dir_path" >> $zshconfig_tag_file
	eval "alias cd$tag_name=$dir_path"
}

function untag {
	unalias $1
}