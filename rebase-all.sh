#!/bin/bash

origin_master=$(git rev-parse --abbrev-ref origin/head)
current_branch=$(git symbolic-ref --short HEAD)

branches=$(git branch --format='%(refname:short)')

if [ $? == 1 ]; then
  echo "git rebase in progress"
  exit 1
fi

for i in $branches; do
  git switch $i
  git rebase $origin_master || exit $?
done

git switch $current_branch
