#!/bin/sh
echo "Preparing the folders..."
mkdir ./static
mkdir ./static/fonts
mkdir ./static/images
mkdir ./static/styles
mkdir ./static/scripts
mkdir ./static/scripts/vendor
mkdir ./views
mkdir ./views/app
mkdir ./views/user
mkdir ./models
mkdir ./routes
mkdir ./test

echo "Copying code, markup and assets..."
cp ./templates/app/server.js ./server.js
cp ./templates/app/package.json ./package.json
cp ./templates/app/.gitignore ./.gitignore
cp ./templates/app/config.json ./config.json
cp ./templates/app/Makefile ./Makefile
cp ./templates/app/test/stub.js ./test/stub.js
cp ./templates/app/routes/index.js ./routes/index.js
cp ./templates/app/views/app/500.ejs ./views/app/500.ejs
cp ./templates/app/views/app/404.ejs ./views/app/404.ejs
cp ./templates/app/views/app/index.ejs ./views/app/index.ejs
cp ./templates/app/views/user/index.ejs ./views/user/index.ejs
cp ./templates/assets/fonts/fontawesome-webfont.eot ./static/fonts/fontawesome-webfont.eot
cp ./templates/assets/fonts/fontawesome-webfont.svg ./static/fonts/fontawesome-webfont.svg
cp ./templates/assets/fonts/fontawesome-webfont.ttf ./static/fonts/fontawesome-webfont.ttf
cp ./templates/assets/fonts/fontawesome-webfont.woff ./static/fonts/fontawesome-webfont.woff
cp ./templates/assets/fonts/FontAwesome.otf ./static/fonts/FontAwesome.otf
cp ./templates/assets/scripts/vendor/jquery.js ./static/scripts/vendor/jquery.js
cp ./templates/assets/scripts/vendor/modernizr.js ./static/scripts/vendor/modernizr.js
cp ./templates/assets/scripts/main.js ./static/scripts/main.js
cp ./templates/assets/scripts/plugins.js ./static/scripts/plugins.js
cp ./templates/assets/styles/font-awesome.min.css ./static/styles/font-awesome.min.css
cp ./templates/assets/styles/main.css ./static/styles/main.css
curl http://yui.yahooapis.com/pure/0.3.0/pure-min.css > ./static/styles/pure-min.css
# TODO copy over the models

echo "Cleaning up..."
rm README.md
cp ./templates/app/README.md ./README.md
rm init.bat
rm -rf .git
rm -rf templates

echo "Initializing empty git repository..."
git init
git add .

echo "Setting up dependencies from NPM..."
npm install