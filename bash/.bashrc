# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

###
# PATH
###
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

###
# Settings
###
# echo "bypass clobber" >| file.txt
set -o noclobber
# Disable Ctrl+S (Ctrl+Q restores it)
stty -ixon
# Alt+h to get the manpage for the command
run-help() { help "$READLINE_LINE" 2>/dev/null || man -P most "$READLINE_LINE"; }
bind -m emacs -x     '"\eh": run-help'

# Color man pages
# https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
# man() {
#     env \
#     LESS_TERMCAP_mb="$(printf "\e[1;31m")" \
#     LESS_TERMCAP_md="$(printf "\e[1;31m")" \
#     LESS_TERMCAP_me="$(printf "\e[0m")" \
#     LESS_TERMCAP_se="$(printf "\e[0m")" \
#     LESS_TERMCAP_so="$(printf "\e[1;44;33m")" \
#     LESS_TERMCAP_ue="$(printf "\e[0m")" \
#     LESS_TERMCAP_us="$(printf "\e[1;32m")" \
#     man "${@}"
# }
export MANPAGER="less -R --use-color -Dd+r -Du+b"


###
# History
###
# Ignore duplicates and commands that start with a space
export HISTCONTROL=$HISTCONTROL:ignorespace:ignoredups

###
# Aliases & ENV
###
alias ls='ls -hF --group-directories-first --color=auto'
alias la='ls -ahF --color=auto'
alias grep='grep --color=auto'
alias backup='borgmatic create --verbosity 1 --list --stats'
alias pysesh='PYTHONSTARTUP=debug.txt python -i'
alias vim='nvim'

export TZ="/usr/share/zoneinfo/America/New_York"
export MOZ_ENABLE_WAYLAND=1
export PAGER="less --use-color"
export PYTHONSTARTUP="$HOME/.config/pystartup"
export GNUPGHOME="$HOME/.config/gnupg"
export MPV_HOME="$HOME/.config/mpv"
export GOPATH="$HOME/.local/go"
export XCOMPOSEFILE="$HOME/.config/XCompose"
