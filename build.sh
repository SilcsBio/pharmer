#!/bin/bash

#docker build -t pharmer .

cmd="cd /pharmer/Release && make clean && make all"
# cmd="ls -trhal /pharmer/"
# cmd="ls -trhal /pharmer/Release; du -sh /pharmer"


docker run --volume=$(pwd):/pharmer -e LOCAL_USER_ID=$(id -u $USER) pharmer /bin/bash -c "$(echo $cmd)"
#cp -pr molcal/src/build/programs .
