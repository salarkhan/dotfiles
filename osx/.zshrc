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
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export NVM_DIR="$HOME/.nvm"
export KUBECONFIG=$HOME/.kube/config

# path config
export PATH=$GOPATH/bin:$PATH

# ALIASES
#-------------------
alias ls="ls -Gh"
alias ll="ls -lv"
alias la="ll -A"
alias vi="nvim"
alias ev="vi ~/.config/nvim/init.vim"
alias eb="vi ~/.zshrc"
alias ea="vi ~/.config/alacritty"
alias et="vi ~/.config/tmux/tmux.conf"
alias rb="exec zsh"
alias k="kubectl"
alias json="python -mjson.tool"
alias nvm-start=". $NVM_DIR/nvm.sh"

# HELPERS
#-------------------

color-vim() {
  echo $1 > ~/.config/nvim/color.vim
}

color-alacritty() {
  cat ~/.config/alacritty/base.yml ~/.config/alacritty/$1.yml > ~/.config/alacritty/alacritty.yml
}

colorscheme() {
  case $1 in
    papercolor)
      color-alacritty $1
      color-vim 'colorscheme papercolor\nset background=light'
      ;;
    gruvbox)
      color-alacritty $1
      color-vim 'colorscheme gruvbox\nset background=dark'
      ;;
    *)
      echo "supported colorschemes: gruvbox, papercolor"
      ;;
  esac
}

# MUX CONFIG
#-------------------
export REPO=$GOPATH/src/github.com/muxinc/mux
# google cloud sdk PATH & completion
if [ -f '/Users/skhan/lib/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/skhan/lib/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/skhan/lib/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/skhan/lib/google-cloud-sdk/completion.zsh.inc'; fi

# MUX ALIASES
#-------------------
alias gomux="cd ~/go/src/github.com/muxinc/mux"
alias gocf="cd ~/go/src/github.com/muxinc/mux/ops/cloudflare"
alias kaw2="kubectx aws-us-west-2-vos1-admin@aws-us-west-2-vos1"
alias kgcpw1="kubectx gcp-us-west1-vos1-admin@gcp-us-west1-vos1"
alias kgcew1="kubectx us-west1.gce.k8s.mux.io"
alias kge1="kubectx us-east1.gce.k8s.mux.io"
alias kge4="kubectx us-east4.gce.k8s.mux.io"
alias k8="/usr/local/bin/kubectl1.8"
alias k23="/usr/local/bin/kubectl1.23"

# MUX HELPERS
#-------------------
function thing () {
  echo "hi"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# uncomment to debug speed issues
# zprof
