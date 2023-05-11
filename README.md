# 🛠 toolman

## dev-setup

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/TonnyL/dev-setup/main/setup.sh)"
```

## rebase-all
When you try to rebase all local branches onto `origin/master`, you may do:

```bash
% git fetch -p
 + 0000000000...1111111111 fix    -> origin/fix  (forced update)
   2222222222..333333333   master -> origin/master
% git branch
  master
* branch-a
  branch-b

% git switch master
% git rebase origin/master
% git switch branch-b
% git rebase origin/master
% git switch branch-a
% git rebase origin/master
```

To avoid wasting your lifetime typing, please do:

```bash
rebase-all
```

## actions_for_all_repos
When your Git repository contains some submodules and you want to make some actions for all repositories(including main and submodules), you may do:

```bash
% git fetch -p
% git rebase origin/main
% cd submodule1
% git fetch -p
% git rebase origin/main
% cd ../submodule2
% git fetch -p
% git rebase origin/main
...
```

Life is short, don't waste your lifetime typing. Add the `rebase` action inside `actions-for-all-repos.sh` file and do:

```bash
sh actions-for-all-repos.sh
```
