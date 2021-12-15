#!/usr/bin/env sh

# when error haapens stop the script
set -e

# build
npm run build

# cd dist
cd dist

# copy index.html content to 404.html
cp index.html 404.html

# deplot to custom doamin
# echo 'www.example.com' > CNAME

git init
git add .
git commit -m "deploy to github pages"
git branch -m main
git remote add origin https://github.com/linooohon/vue3-cart.git
git push -u origin main -f