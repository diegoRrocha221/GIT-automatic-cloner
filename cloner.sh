#!/bin/bash

clone_dir="/path/to/clone"

url_repo="git@github.com:git-user/repository.git"

if [ ! -d "$clone_dir" ]; then
  mkdir -p "$clone_dir"
fi

cd "$clone_dir"

if [ -f "last_clone.txt" ] && [ "$(date +%F)" = "$(cat last_clone.txt)" ]; then
  echo "clone start"
  exit 0
fi

git clone "$url_repo"

date +%F > last_clone.txt

echo "Get repo complete"
