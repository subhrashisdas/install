export NVM_DIR="$HOME/.nvm"
export SDKMAN_DIR="$HOME/.sdkman"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source "$NVM_DIR/nvm.sh"
source "$SDKMAN_DIR/bin/sdkman-init.sh"
source $ZSH/oh-my-zsh.sh
