##fetch all remote branches

`for remote in git branch -r; do git branch --track $remote; done`
