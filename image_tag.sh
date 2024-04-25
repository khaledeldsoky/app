#!/bin/bash
set -x

##COMMIT=`git rev-parse HEAD | cut -c -7`
##echo $COMMIT

#sed -E -i'' "s/(.*nightwolf:).*/\1${COMMIT}/" $1
# sed -E -i'' "s/(.*nightwolf:).*/\1${GIT_COMMIT_REV}/" $1
sed -i "s/khaledmohamedatia\/app:.*/khaledmohamedatia\/app:$2/g" $1