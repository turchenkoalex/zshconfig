# Configure
ZSHCONFIG=$HOME/.zshconfig

export NODE_PATH="/usr/local/lib/node_modules"
export EDITOR="nano"

# Plugins: history extract bundler grep tag rvm brew edit-command-line update | all
plugins=(history extract grep git)

# Auto completions paths
completions=()

# Start zsh config
[[ -e $ZSHCONFIG/main.zsh ]] && source $ZSHCONFIG/main.zsh