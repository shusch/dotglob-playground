#!/usr/bin/env bash

set -euo pipefail

script_name=$(basename "$0")

old_files=$(ls -A | grep -v -e "^${script_name}$" -e "^\.git" -e "^LICENSE$" -e "^README.md$" || [[ $? == 1 ]])

if [[ -n "$old_files" ]]; then
  echo "$old_files" | xargs rm -rf
fi

mkdir from to
mkdir from/dir
touch from/file1.txt from/file2.txt from/.env from/.env.example from/dir/file_a.txt from/dir/.config
