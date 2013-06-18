#/bin/bash

function main() {
  revisions | while read revision
  do
    echo "OMG IT IS $revision"
    git diff $revision..$revision-1 --shortstat
  done
}

function revisions() {
  git rev-list --all
}

main
#calls main function to execute the file
