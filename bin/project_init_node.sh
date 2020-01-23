#!/bin/bash

set -euC

readonly CONFIG_PATH=$(dirname $(realpath $0))/../config
readonly GIT_IGNORE_URI="https://raw.githubusercontent.com/github/gitignore/master/Node.gitignore"

read -p 'Project name: ' PROJECT_NAME

mkdir ${PROJECT_NAME}
cd ${PROJECT_NAME}

npm init -y

npm install -D \
  eslint \
  prettier \
  jest \
  eslint-config-prettier \
  eslint-plugin-prettier \
  eslint-plugin-jest

cp $CONFIG_PATH/node.eslintrc.json .eslintrc.json

curl ${GIT_IGNORE_URI} --output .gitignore

git init
