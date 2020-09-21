#!/usr/bin/env bash

gh_user=$1

if [[ "$gh_user" = "" ]]; then
  echo "error: Missing username"
  exit 1
fi

curl -s https://api.github.com/users/$gh_user/repos \
  | grep full_name \
  | awk '{ print $2 }' \
  | sed 's/[",]//g' \
  | while read repo; do git clone https://github.com/$repo.git; done

