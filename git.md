for remote in \`git branch -r\`; do git branch --track $remote; done
git fetch --all
git pull --all

## use sublime for git commit -v
git config --global core.editor "subl -n -w"
