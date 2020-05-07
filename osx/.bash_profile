# MISC CONFIG
#-------------------
export PROMPT_COMMAND="history -a; history -n"
export BASH_SILENCE_DEPRECATION_WARNING=1 # make catalina shut up

# PROMPT CONFIG
#-------------------
export PS1='\[\033[0;31m\]local:\[\033[0;33m\]\w\[\033[0m\]: '

# DISPLAY CONFIG
#-------------------
export LSCOLORS=exbxcxdxfxegedabagacad

# ENV CONFIG
#-------------------
export TERM=xterm-256color
export EDITOR=vim
export GOPATH=$HOME/go
export PATH=/usr/local/sbin:$PATH # brew
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin # go

#ALIASES
#-------------------
alias ls="ls -Gh"
alias ll="ls -lv"
alias la="ll -A"
alias eb="vim ~/.bash_profile"
alias ev="vim ~/.vimrc"
alias et="vim ~/.tmux.conf"
alias rb="source ~/.bash_profile"
alias nt="open -n /Applications/Alacritty.app"

# COMPLETION CONFIG
#-------------------
. "$HOME/.complete_alias.sh"
. "/usr/local/etc/profile.d/bash_completion.sh"
# . "$HOME/google-cloud-sdk/path.bash.inc"
# . "$HOME/google-cloud-sdk/completion.bash.inc"
