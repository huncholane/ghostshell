#!/bin/bash

project=$HOME/$1

git init --bare $project
cp post-receive $project/hooks/post-receive
sed -i 's/PROJECT_NAME/'$1'/' $project/hooks/post-receive 
chmod +x $project/hooks/post-receive
