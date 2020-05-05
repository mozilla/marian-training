#!/bin/bash -v

mkdir -p $DATA_DIR

# Download SETIMES data
for src in bg  bs  el  en  hr  mk  ro  sq  sr  tr
do
    for trg in bg  bs  el  en  hr  mk  ro  sq  sr  tr
    do
        if [ "$src" != "$trg" ]; then
            wget -nc http://opus.lingfil.uu.se/download.php?f=SETIMES2/$src-$trg.txt.zip -O $DATA_DIR/SETIMES2.$src-$trg.txt.zip
        fi
    done
done

# Extract SETIMES data
for src in bg  bs  el  en  hr  mk  ro  sq  sr  tr
do
    for trg in bg  bs  el  en  hr  mk  ro  sq  sr  tr
    do
        if [ "$src" != "$trg" ]; then
            unzip $DATA_DIR/SETIMES2.$src-$trg.txt.zip
        fi
    done
done

# Clean up
rm $DATA_DIR/*.zip
