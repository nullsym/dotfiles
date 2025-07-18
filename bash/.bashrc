# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

###
# PATH
###
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

###
# Prompt
###
export PS1='\[\e[38;5;22m\][\[\e[38;5;35m\]\w\[\e[38;5;22m\]]\[\e[0m\] \[\e[94;1m\]»\[\e[0m\] '
export PROMPT_DIRTRIM=2

###
# Settings
###
# echo "bypass clobber" >| file.txt
set -o noclobber
# Disable Ctrl+S (Ctrl+Q restores it)
stty -ixon

# Man Pages (Ansi escape colors)
# Alt+h to get the manpage for the command
run-help() { help "$READLINE_LINE" 2>/dev/null || MANWIDTH=999 nvim "+hide Man $(echo $READLINE_LINE | awk '{print $1}')"; }
bind -m emacs -x '"\eh": run-help'
export MANROFFOPT="-c"              # Tells groff to include ANSI escape sequences for colors
export LESS_TERMCAP_mb=$'\e[1;32m'  # Blinking text
export LESS_TERMCAP_md=$'\e[1;31m'  # Bold text
export LESS_TERMCAP_us=$'\e[1;32m'  # Underline
export LESS_TERMCAP_so=$'\e[40;35m' # Standout mode (search hilite)
export LESS_TERMCAP_ue=$'\e[0m'     # End underline
export LESS_TERMCAP_me=$'\e[0m'     # End all attributes
export LESS_TERMCAP_se=$'\e[0m'     # End standout mode
export MANPAGER="less -X -r -+C"
export MANLESS="Man for \$MAN_PN "
export PAGER="less --use-color"

###
# Aliases
###
alias backup='borgmatic create --verbosity 1 --list --stats'
alias pysesh='PYTHONSTARTUP=debug.txt python -i'

alias ls='ls -hF --group-directories-first --color=auto'
alias la='ls -ahF --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color'
alias du='du -h'
alias df='df -h'
alias free='free -h'
alias vim='nvim'
alias v='nvim'
alias t='tmux'
alias music='mpv --script=/etc/mpv/scripts/mpris.so --no-video --shuffle --loop-playlist --playlist=<(find "$PWD" -type f)'
alias videos='mpv --shuffle --loop-playlist --playlist=<(find "$PWD" -type f -iname *mp4 -o -iname *mkv -o -iname *avi -o -iname *mpg -o -iname *flv -o -iname *webm -o -iname *wmv -o -iname *m4v)'
alias leetcode='nvim leetcode.nvim'

###
# ENV
###
export XDG_CONFIG_HOME="$HOME/.config"
export TZ="/usr/share/zoneinfo/America/New_York"
export MOZ_ENABLE_WAYLAND=1
export PYTHONSTARTUP="$HOME/.config/pystartup"
export GNUPGHOME="$HOME/.config/gnupg"
export MPV_HOME="$HOME/.config/mpv"
export GOPATH="$HOME/.local/go"
export XCOMPOSEFILE="$HOME/.config/XCompose"

###
# Setup
###
eval "$(direnv hook bash)"

####
# Autocomplete
####
_ssh_autocomplete() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD - 1]}"
  opts=$(grep -i '^host ' ~/.ssh/config | grep -v '[*?]' | awk '{print $2}')

  if [[ ${cur} == * ]]; then
    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
    return 0
  fi
}
complete -F _ssh_autocomplete ssh

###
# History
###
# Ignore duplicates and commands that start with a space
export HISTCONTROL=$HISTCONTROL:ignorespace:ignoredups
# Requires perl. Taken from: /usr/share/fzf/shell/key-bindings.bash
if [[ -f /usr/bin/fzf ]]; then
  __fzfcmd() {
    [[ -n "${TMUX_PANE-}" ]] && { [[ "${FZF_TMUX:-0}" != 0 ]] || [[ -n "${FZF_TMUX_OPTS-}" ]]; } &&
      echo "fzf-tmux ${FZF_TMUX_OPTS:--d${FZF_TMUX_HEIGHT:-40%}} -- " || echo "fzf"
  }
  __fzf_history__() {
    local output script
    script='BEGIN { getc; $/ = "\n\t"; $HISTCOUNT = $ENV{last_hist} + 1 } s/^[ *]//; s/\n/\n\t/gm; print $HISTCOUNT - $. . "\t$_" if !$seen{$_}++'
    output=$(
      set +o pipefail
      builtin fc -lnr -2147483648 |
        last_hist=$(HISTTIMEFORMAT='' builtin history 1) command perl -n -l0 -e "$script" |
        FZF_DEFAULT_OPTS=$(__fzf_defaults "" "-n2..,.. --scheme=history --bind=ctrl-r:toggle-sort --wrap-sign '"$'\t'"↳ ' --highlight-line ${FZF_CTRL_R_OPTS-} +m --read0") \
        FZF_DEFAULT_OPTS_FILE='' $(__fzfcmd) --query "$READLINE_LINE"
    ) || return
    READLINE_LINE=$(command perl -pe 's/^\d*\t//' <<<"$output")
    if [[ -z "$READLINE_POINT" ]]; then
      echo "$READLINE_LINE"
    else
      READLINE_POINT=0x7fffffff
    fi
  }
  bind -m emacs-standard -x '"\C-r": __fzf_history__'
  bind -m vi-command -x '"\C-r": __fzf_history__'
  bind -m vi-insert -x '"\C-r": __fzf_history__'
fi
