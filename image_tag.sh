#!/bin/bash
set -x

##COMMIT=`git rev-parse HEAD | cut -c -7`
##echo $COMMIT
echo $GIT_COMMIT_REV
#sed -E -i'' "s/(.*nightwolf:).*/\1${COMMIT}/" $1
# sed -E -i'' "s/(.*nightwolf:).*/\1${GIT_COMMIT_REV}/" $1
sed -i "s/khaledmohamedatia\/app:.*/khaledmohamedatia\/app:${GIT_COMMIT_REV}/g" $1