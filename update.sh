#!/bin/bash

sed "s/ARG NODE_VER/ARG NODE_VER=$NODE_VER/g" Dockerfile.template > node/Dockerfile

git add node/Dockerfile
git commit -m "New node version $NODE_VER"
git tag -f $NODE_VER
git push origin master
git push -f origin $NODE_VER