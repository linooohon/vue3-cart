#!/usr/bin/env sh

# when error haapens stop the script
set -e

# copy .git history
cp -r ./dist/.git .git_copy

# build
npm run build

# remove new .git folder & paste old .git_copy history to dist
rm -rf ./dist/.git && cp -r .git_copy ./dist/.git && rm -rf .git_copy

# cd dist
cd dist

# copy index.html content to 404.html
cp index.html 404.html

# deplot to custom doamin
# echo 'www.example.com' > CNAME

git add .
git commit -m "auto deploying"
# git commit -m "deploy to github pages"
# git branch -m gh-pages
# git remote add origin https://github.com/linooohon/vue3-cart.git
git push origin gh-pages