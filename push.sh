#!/bin/bash

git checkout master
if [[ `git diff --name-only` != '' ]]; then
	echo 'Has uncommit changes.'
	exit 0
fi

# push to oschina
read -p "Start set statics for oschina... (press any key to continue)" -n 1
git push osc master -f
sed -i 's/<br>//g' *.md
sed -i 's/<br>//g' readme/*.md
sed -i 's/raw.githubusercontent.com\/zam1024t\/LocalizedMenu/git.oschina.net\/zam1024t\/LocalizedMenu\/raw/g' *.md
sed -i 's/raw.githubusercontent.com\/zam1024t\/LocalizedMenu/git.oschina.net\/zam1024t\/LocalizedMenu\/raw/g' readme/*.md
read -p "set statics for oschina... (press any key to continue)" -n 1
git commit -m"set statics for oschina" .
read -p "commit statics for oschina... (press any key to continue)" -n 1
git push osc master
read -p "set statics for oschina, Done. (press any key to continue)" -n 1

# push to coding
git reset HEAD^
git checkout .
read -p "Start set statics for coding... (press any key to continue)" -n 1
git push osc master -f
sed -i 's/raw.githubusercontent.com\/zam1024t\/LocalizedMenu/coding.net\/u\/zam1024t\/p\/LocalizedMenu\/git\/raw/g' *.md
sed -i 's/raw.githubusercontent.com\/zam1024t\/LocalizedMenu/coding.net\/u\/zam1024t\/p\/LocalizedMenu\/git\/raw/g' readme/*.md
read -p "set statics for coding... (press any key to continue)" -n 1
git commit -m"set statics for coding" .
read -p "commit statics for coding... (press any key to continue)" -n 1
git push coding master
read -p "set statics for coding, Done. (press any key to continue)" -n 1
