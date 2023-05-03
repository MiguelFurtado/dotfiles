alias ll='ls -lh'
alias la='ls -lAh'

alias v='vim'
alias ..='cd ..'

if [ "$DISTRO" = "ubuntu" ]; then
    alias bat='batcat'
fi

command -v flashfetch > /dev/null
if [ $? -eq 0 ]; then
    alias neofetch="flashfetch"
fi

