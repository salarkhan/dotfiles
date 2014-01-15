# track && fetch && pull all remote branches
for remote in \`git branch -r\`; do git branch --track $remote; done
git fetch --all
git pull --all

# use sublime for git commit -v
`git config --global core.editor "subl -n -w"`

# setting up sublime symlink
`https://gist.github.com/artero/1236170`

# git filter to change email addresses globally
# can also replace with GIT_AUTHOR_EMAIL -- use `git log` to check
git filter-branch --commit-filter '
if [ "$GIT_AUTHOR_NAME" = "Salar Khan" ];
  then
  GIT_AUTHOR_NAME="salar khan";
  GIT_AUTHOR_EMAIL="salar.k3@gmail.com";
  git commit-tree "$@";
else
  git commit-tree "$@";
fi' HEAD
