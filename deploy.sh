#!/bin/bash

echo -e "\033[0;32mDeploying updates to Github...\033[0m"

# Build the project.
../lipi/exec/hugo

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push skulsky:amsDhl987lhd@github.com/skulsky/skulsky.github.io.git origin master
git subtree push --prefix=public skulsky:amsDhl987lhd@github.com/skulsky/skulsky.github.io.git gh-pages