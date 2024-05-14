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

# PATH config
# ------------------------------
export PATH="$HOME/Go/bin:$PATH"

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


# ALIAS config
# ------------------------------
alias eb="hx ~/.bashrc"
alias et="hx ~/.config/helix/config.toml"
alias rb="source ~/.bashrc"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# HELPERS
# ------------------------------
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
