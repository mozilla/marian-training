#!/bin/bash -v

mkdir -p $DATA_DIR

# Download europarl data
wget -nc http://www.statmt.org/europarl/v7/bg-en.tgz -O $DATA_DIR/bg-en.tgz
wget -nc http://www.statmt.org/europarl/v7/cs-en.tgz -O $DATA_DIR/cs-en.tgz
wget -nc http://www.statmt.org/europarl/v7/da-en.tgz -O $DATA_DIR/da-en.tgz
wget -nc http://www.statmt.org/europarl/v7/de-en.tgz -O $DATA_DIR/de-en.tgz
wget -nc http://www.statmt.org/europarl/v7/el-en.tgz -O $DATA_DIR/el-en.tgz
wget -nc http://www.statmt.org/europarl/v7/es-en.tgz -O $DATA_DIR/es-en.tgz
wget -nc http://www.statmt.org/europarl/v7/et-en.tgz -O $DATA_DIR/et-en.tgz
wget -nc http://www.statmt.org/europarl/v7/fi-en.tgz -O $DATA_DIR/fi-en.tgz
wget -nc http://www.statmt.org/europarl/v7/fr-en.tgz -O $DATA_DIR/fr-en.tgz
wget -nc http://www.statmt.org/europarl/v7/hu-en.tgz -O $DATA_DIR/hu-en.tgz
wget -nc http://www.statmt.org/europarl/v7/it-en.tgz -O $DATA_DIR/it-en.tgz
wget -nc http://www.statmt.org/europarl/v7/lt-en.tgz -O $DATA_DIR/lt-en.tgz
wget -nc http://www.statmt.org/europarl/v7/lv-en.tgz -O $DATA_DIR/lv-en.tgz
wget -nc http://www.statmt.org/europarl/v7/nl-en.tgz -O $DATA_DIR/nl-en.tgz
wget -nc http://www.statmt.org/europarl/v7/pl-en.tgz -O $DATA_DIR/pl-en.tgz
wget -nc http://www.statmt.org/europarl/v7/pt-en.tgz -O $DATA_DIR/pt-en.tgz
wget -nc http://www.statmt.org/europarl/v7/ro-en.tgz -O $DATA_DIR/ro-en.tgz
wget -nc http://www.statmt.org/europarl/v7/sk-en.tgz -O $DATA_DIR/sk-en.tgz
wget -nc http://www.statmt.org/europarl/v7/sl-en.tgz -O $DATA_DIR/sl-en.tgz
wget -nc http://www.statmt.org/europarl/v7/sv-en.tgz -O $DATA_DIR/sv-en.tgz

# Extract europarl data
tar -xf $DATA_DIR/bg-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/cs-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/da-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/de-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/el-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/es-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/et-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/fi-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/fr-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/hu-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/it-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/lt-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/lv-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/nl-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/pl-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/pt-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/ro-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/sk-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/sl-en.tgz -C $DATA_DIR --no-same-owner
tar -xf $DATA_DIR/sv-en.tgz -C $DATA_DIR --no-same-owner

# Clean up
rm $DATA_DIR/*.tgz
