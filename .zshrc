# custom env variables
export PATH=$HOME/.local/bin:$PATH \
    EDITOR="nvim" \

# rootless docker
export PATH=$HOME/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock

# some colour plz
alias ls='ls --color=auto'
alias grep='grep --color'

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

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

