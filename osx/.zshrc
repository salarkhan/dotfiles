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
export LSCOLORS="exgxfxdacxDaDaxbadacex"
export GOPATH=$HOME/go

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

# to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
