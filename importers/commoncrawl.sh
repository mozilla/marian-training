#!/bin/bash -v

export DATA_DIR=$USER_DIR/commoncrawl/wmt13

# Conditionally download corpora
if [ ! -e "$DATA_DIR/commoncrawl.de-en.de" ]
then
    ./scripts/download_commoncrawl.sh
fi
