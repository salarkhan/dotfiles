# uncomment to debug speed issues
# zmodload zsh/zprof

# PLUGINS
#-------------------
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "romkatv/powerlevel10k, as:theme, depth:1"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zplug load

# CONFIG
#-------------------
# path config
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export NVM_DIR="$HOME/.nvm"
export KUBECONFIG=$HOME/.kube/config
export FZF_DEFAULT_COMMAND="rg --files --hidden"
eval "$(rbenv init - zsh)"

# shim me baby
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=/Applications/Racket\ v8.7/bin:$PATH
export PATH=/opt/homebrew/:$PATH
export PATH=/opt/local/bin/:$PATH
export PATH=$GOPATH/bin:$HOME/bin:$PATH

# ALIASES
#-------------------
alias ls="ls -aGh"
alias ll="ls -alv"
alias la="ll -A"
alias vi="nvim"
alias ev="hx ~/.config/nvim"
alias eb="hx ~/.zshrc"
alias ea="hx ~/.config/alacritty"
alias et="hx ~/.config/tmux/tmux.conf"
alias ek="hx ~/.config/kitty/kitty.conf"
alias ex="hx ~/.config/helix/config.toml"
alias rb="exec zsh"
alias k="/usr/local/bin/kubectl"
alias json="python -mjson.tool"
alias nvm-start=". $NVM_DIR/nvm.sh"
alias vault-login="vault login -method=oidc role=oidc-dev-only"
alias devbox-status="gcloud compute instances list | grep $USER"
alias rg="rg --hidden"

# HELPERS
#-------------------
curl-resp-status() {
  curl -s -o /dev/null -w "\n%{http_code}\n" $1
}


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# uncomment to debug speed issues
# zprof
