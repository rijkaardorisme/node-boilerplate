REM @echo off
echo "Preparing the folders..."
mkdir .\static
mkdir .\static\fonts
mkdir .\static\images
mkdir .\static\styles
mkdir .\static\scripts
mkdir .\static\scripts\vendor
mkdir .\views
mkdir .\views\app
mkdir .\views\user
mkdir .\models
mkdir .\routes
mkdir .\test

echo "Copying code, markup and assets..."
copy .\templates\app\server.js .\server.js
copy .\templates\app\package.json .\package.json
copy .\templates\app\.gitignore .\.gitignore
copy .\templates\app\config.json .\config.json
copy .\templates\app\Makefile .\Makefile
copy .\templates\app\test\stub.js .\test\stub.js
copy .\templates\app\routes\index.js .\routes\index.js
copy .\templates\app\views\app\500.ejs .\views\app\500.ejs
copy .\templates\app\views\app\404.ejs .\views\app\404.ejs
copy .\templates\app\views\app\index.ejs .\views\app\index.ejs
copy .\templates\app\views\user\index.ejs .\views\user\index.ejs
copy .\templates\assets\fonts\fontawesome-webfont.eot .\static\fonts\fontawesome-webfont.eot
copy .\templates\assets\fonts\fontawesome-webfont.svg .\static\fonts\fontawesome-webfont.svg
copy .\templates\assets\fonts\fontawesome-webfont.ttf .\static\fonts\fontawesome-webfont.ttf
copy .\templates\assets\fonts\fontawesome-webfont.woff .\static\fonts\fontawesome-webfont.woff
copy .\templates\assets\fonts\FontAwesome.otf .\static\fonts\FontAwesome.otf
copy .\templates\assets\scripts\vendor\jquery.js .\static\scripts\vendor\jquery.js
copy .\templates\assets\scripts\vendor\modernizr.js .\static\scripts\vendor\modernizr.js
copy .\templates\assets\scripts\main.js .\static\scripts\main.js
copy .\templates\assets\scripts\plugins.js .\static\scripts\plugins.js
copy .\templates\assets\styles\font-awesome.min.css .\static\styles\font-awesome.min.css
copy .\templates\assets\styles\main.css .\static\styles\main.css
curl http://yui.yahooapis.com/pure/0.3.0/pure-min.css > .\static\styles\pure-min.css
REM TODO copy over the models

echo "Cleaning up..."
del README.md
copy .\templates\app\README.md .\README.md
del init.sh
rmdir /S /Q .git
rmdir /S /Q templates

echo "Initializing empty git repository..."
git init
git add .

echo "Install dependencies and remove setup file..."
npm install && del init.bat