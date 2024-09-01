# CONFIG
# ------------------------------
# wtf does history -a/-n do?!
export PROMPT_COMMAND="history -a; history -n"
export PS1="\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# config asdf shims etc
. "$HOME/.asdf/asdf.sh"

# HELPERS
# ------------------------------
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

add_to_path() {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

# COMPLETION config
# ------------------------------
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# asdf
. "$HOME/.asdf/completions/asdf.bash"

# LS config
# ------------------------------
alias ll='ls -valF --color=never'
alias ls='ls --color=never'

# ALIAS config
# ------------------------------
alias eb="hx ~/dotfiles/.bashrc"
alias ek="hx ~/dotfiles/.config/kitty/kitty.conf"
alias ex="hx ~/dotfiles/.config/helix/config.toml"
alias rb="source ~/.bashrc"
alias iv="cd ~/code/interviewing/2024"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# PATH config
# ------------------------------
add_to_path "$HOME/.local/bin"
add_to_path "$HOME/go/bin"
