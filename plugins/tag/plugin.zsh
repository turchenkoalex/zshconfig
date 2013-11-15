[[ "$zshconfig_plugin_tag_path" == "" ]] && zshconfig_plugin_tag_path=$ZSHCONFIG_DATA/tags

function tag {
  local tag_name=$1
  local dir_path=$2
  [[ "$dir_path" == "" ]] && dir_path=`pwd`
  eval "export $tag_name=$dir_path"
  mkdir -p $zshconfig_plugin_tag_path
  echo export $tag_name=$dir_path > $zshconfig_plugin_tag_path/$tag_name.tag
}

function untag {
  local tag_name=$1
  eval "unset $tag_name"
  rm -f $zshconfig_plugin_tag_path/$tag_name.tag
}

function zshconfig_plugin_tag_load() {
  if test -n "$(find $zshconfig_plugin_tag_path -maxdepth 1 -name '*.tag' -print -quit)"; then
    source $zshconfig_plugin_tag_path/*.tag
  fi
}

zshconfig_plugin_tag_load
unset -f zshconfig_plugin_tag_load

