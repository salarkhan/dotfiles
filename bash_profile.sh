# $VARIABLE will render before the rest of the command is executed
echo "logged in as $USER."

# ----------------------------
# PLACES TO LOOK FOR EXECUTABLES
# ----------------------------
function _look_for_executables_in {
  # Only adds the path to $PATH if it exists
  test -d $1 && export PATH="$1:$PATH"
}

# Prepend /usr/local/bin so that homebrew-installed executables override default OS ones
_look_for_executables_in "/usr/local/bin"

# Global NPM Executables
_look_for_executables_in "/usr/local/share/npm/bin" &&
  # Executables from the node modules in the current directory
  export PATH="./node_modules/.bin:$PATH"

# Clojure Executables
_look_for_executables_in "$HOME/.cljr/bin"

# Ruby Executables (via rbenv)
test -d "$HOME/.rbenv" && eval "$(rbenv init -)"

# Heroku Toolbelt
_look_for_executables_in "/usr/local/heroku/bin"

# Custom Executables
_look_for_executables_in "$HOME/bin"

# ----------------------------
# PROMPT CONFIG
# ----------------------------

# Determines if the git branch you are on is clean or dirty
git_prompt ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  git_branch=$(Git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  if git diff --quiet 2>/dev/null >&2; then
    git_color="${c_git_clean}"
  else
    git_color=${c_git_dirty}
  fi
  echo " [$git_color$git_branch${c_reset}]"
}

# A more colorful prompt
# \[\e[0m\] resets the color to default color
c_reset='\[\e[0m\]'
#  \e[0;31m\ sets the color to red
c_path='\[\e[0;31m\]'
# \e[0;32m\ sets the color to green
c_git_clean='\[\e[0;32m\]'
# \e[0;31m\ sets the color to red
c_git_dirty='\[\e[0;31m\]'

# PS1 is the variable for the prompt you see everytime you hit enter
PROMPT_COMMAND='PS1="${c_path}\W${c_reset}$(git_prompt) :> "'
export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=ExGxFxdxCxDxDxaccxaeex

# ----------------------------
# ALIASES
# ----------------------------

# Annotate file types : -F
# Colors              : -G
# Human file sizes    : -h
alias ls='ls -Gh'

# Set sublime to the default editor and alias it to `subl` if it is present
subl=`which sublime`
test $subl &&
  export EDITOR="$subl --wait" &&
  alias subl=sublime

# Git
alias ga='git add -p'
alias gv='git commit -v'
alias gpo='git push origin'
