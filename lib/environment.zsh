fpath=($ZSHCONFIG/completions $completions $fpath)

## jobs
setopt long_list_jobs

## pager
export PAGER="less -R"
export LC_CTYPE=$LANG