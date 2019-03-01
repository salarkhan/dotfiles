# DISPLAY CONFIG
#===============
export LSCOLORS=gxcxcxcxexfxfxAxAxAxAx

#PROMPT CONFIG
#===============
git_prompt () {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  if git diff --quiet 2>/dev/null >&2; then
    git_color="${c_git_clean}"
  else
    git_color=${c_git_dirty}
  fi
  echo " [$git_color$git_branch${c_reset}]"
}

c_reset='\[\e[0m\]'
c_path='\[\e[0;36m\]'
c_git_clean='\[\e[0;32m\]'
c_git_dirty='\[\e[0;31m\]'
PROMPT_COMMAND='PS1="${c_path}\W${c_reset}$(git_prompt) : "'

#ALIASES
#===============
alias ls="ls -Gh"
alias ll="ls -lv"
alias la="ll -A"
alias rebash='source ~/.profile'

# LANG CONFIG
#===============
# golang
export GOPATH=$HOME/code/gocode
export PATH=$GOPATH/bin:$PATH

# python
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
source /usr/local/bin/virtualenvwrapper.sh

# MISC CONFIG
#===============
# git completion
test -f ~/.git-completion.bash && . $_

