#!/bin/bash -v

mkdir -p $DATA_DIR

# Download commoncrawl data
wget -nc http://www.statmt.org/wmt13/training-parallel-commoncrawl.tgz -O $DATA_DIR/training-parallel-commoncrawl.tgz

# Extract commoncrawl data
tar -xf $DATA_DIR/training-parallel-commoncrawl.tgz -C $DATA_DIR --no-same-owner

# Clean up
rm $DATA_DIR/*.tgz
