#!/bin/bash -v

export DATA_DIR=$USER_DIR/europarl/v7

# Conditionally download corpora
if [ ! -e "$DATA_DIR/europarl-v7.sv-en.en" ]
then
    ./scripts/download_europarl.sh
fi
