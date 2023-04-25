# custom env variables
export PATH=$HOME/.local/bin:$PATH \
    EDITOR="nvim" \
    XDG_CONFIG_HOME=$HOME/.config/ \
    DISTRO=$(grep "^ID=" /etc/os-release | cut -d = -f 2)

# rootless docker
export PATH=$HOME/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock

# some colour plz
alias ls='ls --color=auto'
alias grep='grep --color'

# Config history
HISTFILE=~/.local/share/zsh_history
SAVEHIST=50000
HISTFILESIZE=50000
HISTSIZE=50000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data betwenn sessions

# Enable zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load aliases
source ~/.zsh/aliases.zsh

# enable vim mode
bindkey -v

# asdf
. $HOME/.asdf/asdf.sh

. ~/.zsh/completion.zsh

# starship prompt
eval "$(starship init zsh)"

if [ "$DISTRO" = "ubuntu" ]; then
    # Get ubuntu suggestions on the package to install to provide a command which
    # was not found
    . /etc/zsh_command_not_found
fi

