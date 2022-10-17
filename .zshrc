# custom env variables
export PATH=$HOME/.local/bin:$PATH \
    EDITOR="vim" \
    # add cargo binaries to path
    PATH=$HOME/.cargo/bin:$PATH

# rootless docker
export PATH=$HOME/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock

# Manual Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="eastwood"
#ZSH_THEME="gallois"
ZSH_THEME="nicoulaj"

# Auto correction
ENABLE_CORRECTION="true"
# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# oh-my-zsh plugins
plugins=(
    git
)

source $ZSH/oh-my-zsh.sh

# enable vim mode
bindkey -v
