nt() {
  tmux new -s "$1"
}

# Git Branching Commands
create_branch() {
  if [ -z "$1" ]; then
    echo "Usage: nf <branch-type> <branch-name>"
    return 1
  fi

  branch_type=$1
  branch_name=$2

  case $branch_type in
    feature) git checkout -b "feature/$branch_name" ;;
    bugfix)  git checkout -b "bugfix/$branch_name" ;;
    release) git checkout -b "release/$branch_name" ;;
    hotfix)  git checkout -b "hotfix/$branch_name" ;;
    *) echo "Invalid branch type. Use feature, bugfix, release, or hotfix."
       return 1 ;;
  esac
}

merge_branch() {
  if [ -z "$1" ]; then
    echo "Usage: mb <source-branch> <target-branch>"
    return 1
  fi

  source_branch=$1
  target_branch=$2

  git checkout $target_branch
  git pull origin $target_branch
  git merge $source_branch
  git push origin $target_branch
}