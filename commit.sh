#!/bin/bash

. config.sh

echo $REPO_PATH

FILENAME="amazing_code.txt" # The file that this script will be editing

check_git() {

  GIT_VERSION=`git --version | grep "git version"`

  # Check if Git is installed

  if [ "$GIT_VERSION" = "" ]
  then
    echo "Error: Git not found. Make sure to install it or add it to your path"
    exit
  fi
}

go_to_repo() {

  cd $REPO_PATH
  
  CURRENT_DIR=$(pwd)

  # Check if repo path exists
  if [ $REPO_PATH != $CURRENT_DIR ]
  then
    echo "Error: Repo Path: ${REPO_PATH} Not Found"
    exit
  fi
  
  # Check if directory is a repo
  if [ $(git rev-parse --is-inside-work-tree) != "true" ]
  then
    echo "Error: Directory Is Not A Git Repo"
    exit
  fi
}

create_editing_file() {

  # Create new file if file dosen't exist
  if [ ! -e $FILENAME ]
  then
    touch $FILENAME
  fi
}

append_file() {
  echo "I committed at $(date)" >> $FILENAME
}

add_and_commit() {
  git add .
  git commit -m "Adding commit at $(date)"

}

push() {
  git push origin master
}

main()
{ 
  randomNumber=$(shuf -i 1-6 -n 1)
  check_git
  go_to_repo
  create_editing_file
  until [ $randomNumber -eq 0 ]
  do
  append_file
  add_and_commit
  let "randomNumber-=1" 
  done
  push
}

main