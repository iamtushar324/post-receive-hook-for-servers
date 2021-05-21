#!/bin/bash

while read oldrev newrev ref
do
    if [[ $ref =~ .*/development$ ]];
    then
            echo "development ref received.  Deploying development branch to development ( website )..."
        git --work-tree=/home/dev/iic-dcrust/web checkout -f development || echo "Sorry Failed to checkout development"
        cd /home/dev/iic-dcrust/web && npm ci && echo "Npm Clean Installed Successfull" && echo "Running Npm Build..." && npm run build && echo "Build Successfull & App deployed to Website https://dev.com"|| echo "Failed npm "
    else
        echo "Ref $ref successfully received.  Doing nothing"
    fi
done
