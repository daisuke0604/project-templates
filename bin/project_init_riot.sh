#!/bin/bash

set -euC

readonly CONFIG_PATH=$(dirname $(realpath $0))/../config
readonly GIT_IGNORE_URI="https://raw.githubusercontent.com/github/gitignore/master/Node.gitignore"

read -p 'Project name: ' PROJECT_NAME

mkdir ${PROJECT_NAME}
cd ${PROJECT_NAME}

npm init -y

npm install -S \
  core-js \
  regenerator-runtime

npm install -D \
  riot \
  @riotjs/compiler \
  @riotjs/observable \
  @riotjs/webpack-loader \
  babel-loader \
  @babel/core \
  @babel/preset-env \
  webpack \
  webpack-cli \
  webpack-dev-server \
  node-sass \
  eslint \
  prettier \
  eslint-config-prettier \
  eslint-plugin-prettier \
  cypress \
  eslint-plugin-cypress

cp $CONFIG_PATH/web.eslintrc.json .eslintrc.json
cp $CONFIG_PATH/riot-scss.webpack.config.js webpack.config.js

curl ${GIT_IGNORE_URI} --output .gitignore

git init
