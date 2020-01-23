#!/bin/bash

set -euC

cd `dirname $0`
readonly PWD=`pwd`

ln -s $PWD/bin/project_init_node.sh ~/bin/
ln -s $PWD/bin/project_init_riot.sh ~/bin/
