# custom env variables
export PATH=$HOME/.local/bin:$PATH \
    EDITOR="nvim" \
    # add cargo binaries to path
    PATH=$HOME/.cargo/bin:$PATH

# rootless docker
export PATH=$HOME/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock

# Enale history
SAVEHIST=1000  # Save most-recent 1000 lines
HISTFILE=~/.local/share/.zsh_history

# Enable zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# set the prompt
setopt PROMPT_SUBST
autoload -U colors && colors
source ~/.zsh/prompt.zsh

# Load aliases
source ~/.zsh/aliases.zsh

# enable vim mode
bindkey -v

