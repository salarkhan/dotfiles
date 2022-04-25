# PLUGINS
#-------------------
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "romkatv/powerlevel10k, as:theme, depth:1"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zplug load

# ENV
#-------------------
export GOPATH=$HOME/go
export REPO=$GOPATH/src/github.com/muxinc/mux

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
alias json="python -mjson.tool"
alias k="kubectl"

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

# MUX ALIASES
#-------------------
alias gomux="cd ~/go/src/github.com/muxinc/mux"
alias gocf="cd ~/go/src/github.com/muxinc/mux/ops/cloudflare"
alias kaw2="kubectx aws-us-west-2-vos1-admin@aws-us-west-2-vos1"
alias kpw1="kubectx gcp-us-west1-vos1-admin@gcp-us-west1-vos1"
alias kgw1="kubectx us-west1.gce.k8s.mux.io"
alias kge1="kubectx us-east1.gce.k8s.mux.io"
alias kge4="kubectx us-east4.gce.k8s.mux.io"

# MUX HELPERS
#-------------------
function link23 () {
  ln -sf /usr/local/bin/kubectl1.23 /usr/local/bin/kubectl
}

function link13 () {
  ln -sf /usr/local/bin/kubectl1.13 /usr/local/bin/kubectl
}

function link8 () {
  ln -sf /usr/local/bin/kubectl1.8 /usr/local/bin/kubectl
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
