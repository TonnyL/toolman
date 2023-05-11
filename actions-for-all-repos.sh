#!/bin/bash

gitRepositories=($(git config --file .gitmodules --name-only --get-regexp path | sed 's/^submodule\.//;s/\.path$//'))
rootRepo=""
gitRepositories+=("$rootRepo")

function actions_for_all_repos() {
  for i in "${gitRepositories[@]}"; do
    action "./${i}" $1
  done
}

# --- Replace with your actions ---
function action() {
  echo "fetch updates for $1"
  # Keep -C as the first parameter
  git -C $1 fetch -p
  git -C $1 checkout "${2}"
}

actions_for_all_repos origin/main
