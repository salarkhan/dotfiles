# uncomment to debug speed issues
# zmodload zsh/zprof


# HELPERS
#-------------------
curl-resp-status() {
  curl -s -o /dev/null -w "\n%{http_code}\n" $1
}

add_to_path() {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

# CONFIG
#-------------------
setopt histignorealldups

export EDITOR="hx"
export VISUAL="hx"

export HISTFILE=~/.zsh_history
export SAVEHIST=20000 
export HISTSIZE=10000

# path config
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export NVM_DIR="$HOME/.nvm"
export FZF_DEFAULT_COMMAND="rg --files --hidden"

# ALIAS
#-------------------
alias ls="ls -aGhF"
alias ll="ls -alvF"
alias la="ll -A"
alias vi="nvim"

alias ev="hx ~/.config/nvim"
alias eb="hx ~/.zshrc"
alias ek="hx ~/.config/kitty/kitty.conf"
alias ex="hx ~/.config/helix/config.toml"

alias rb="exec zsh"
alias k="/usr/local/bin/kubectl"
alias json="python -mjson.tool"
alias nvm-start=". $NVM_DIR/nvm.sh"
alias rg="rg --hidden"

# PATH
# ------------------------------
add_to_path "$HOME/.local/bin"
add_to_path "$HOME/go/bin"
. "$HOME/.cargo/env"
. "/opt/homebrew/opt/asdf/libexec/asdf.sh"

# PROMPT
# ------------------------------
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
. ~/.local/bin/git-prompt.sh
precmd () { __git_ps1 "λ:" "%~ ❯ " "[%s] " }

# uncomment to debug speed issues
# zprof
