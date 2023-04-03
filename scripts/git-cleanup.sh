# Get all branches and map them to local branches
git fetch --all
git pull --all
git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done

# change develop to default branch, or relative branch
git branch --merged develop
