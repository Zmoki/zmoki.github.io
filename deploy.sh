#!/bin/bash

rev=$(git rev-parse --short HEAD)

mkdir dist
cd dist

git init
git config user.name "Zarema Khalilova"
git config user.email "zarema.khalilova@gmail.com"

git remote add upstream "https://$GH_TOKEN@github.com/Zmoki/zarema.git"
git fetch upstream && git reset upstream/gh-pages

touch index.html

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages
