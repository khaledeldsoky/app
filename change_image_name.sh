#!/bin/bash
set -x
COMMIT=`git rev-parse HEAD | cut -c -7`
echo $COMMIT
# sed -E -i'' "s/(.*nightwolf:).*/\1${COMMIT}/" $1
sed -i "s/khaledmohamedatia\/app:*/khaledmohamedatia\/app:${COMMIT}/g" $1