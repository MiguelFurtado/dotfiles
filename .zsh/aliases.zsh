alias ll='ls -lh'
alias la='ls -lAh'
alias dbox="distrobox"

if [ $DISTRO = "ubuntu" ]; then
    alias bat="batcat"
fi

if [ $TERM = "xterm-kitty" ] && [ -z "${DISTROBOX_ENTER_PATH}" ]; then
    alias ssh="kitty +kitten ssh"
fi

command -v flashfetch > /dev/null
if [ $? -eq 0 ]; then
    alias neofetch="flashfetch"
fi

