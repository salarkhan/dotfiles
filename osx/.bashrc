# DISPLAY CONFIG
#===============
export LSCOLORS=exbxcxdxfxegedabagacad

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
export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '

#ALIASES
#===============
alias ls="ls -Gh"
alias ll="ls -lv"
alias la="ll -A"
alias rebash='source ~/.profile'

# MISC CONFIG
#===============
test -f ~/.git-completion.bash && . $_
