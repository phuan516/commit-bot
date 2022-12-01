#!/bin/bash

FILENAME="amazing_code.txt" # The file that this script will be editing
REPO_PATH="/home/peterhuang/commit-bot" # Make sure it's complete

check_git() {

  GIT_VERSION=`git --version | grep "git version"`

  if [ "$GIT_VERSION" != "" ]
  then
    : # Do nothing as git is found
  else
    echo "Error: Git not found. Make sure to install it or add it to your path"
    exit
  fi
}

go_to_repo() {
  # Check if repo path is found and if it's a repo

  cd $REPO_PATH
  
  CURRENT_DIR=$(pwd)

  echo $REPO_PATH
  echo $CURRENT_DIR

  if [ $REPO_PATH = $CURRENT_DIR ]
  then
    : # Do nothing as path already exists
  else
    echo "Error: Repo Path: ${REPO_PATH} Not Found"
    exit
  fi
  
  if [ $(git rev-parse --is-inside-work-tree) = "true" ]
  then
    : # Do nothing as directory is a git repo
  else
    echo "Error: Directory Is Not A Git Repo"
    exit
  fi
}

create_editing_file() {
  if [ -e $FILENAME ]
  then
    : # Do nothing as file already exist
  else
    touch $FILENAME
  fi 
}

append_file() {
  echo -e "I committed at $(date)" >> $FILENAME
}

commit_and_push() {
  # Ensure that your git credentials are set correctly or else these commands will fail
  git add .
  git commit -m "Adding commit at $(date)"
  git push
}

main()
{
  check_git
  go_to_repo
  create_editing_file
  append_file
  commit_and_push

}

main