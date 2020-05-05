#!/bin/bash -v

export DATA_DIR=$USER_DIR/setimes/v2

# Conditionally download corpora
if [ ! -e "$DATA_DIR/SETIMES2.en-ro.en" ]
then
    ./scripts/download_setimes.sh
fi
