#!/bin/bash -v

# suffix of source language files
SRC=en

# suffix of target language files
TRG=de

# number of merge operations
bpe_operations=32000

# path to moses decoder: https://github.com/moses-smt/mosesdecoder
mosesdecoder=../tools/moses-scripts

# path to subword segmentation scripts: https://github.com/rsennrich/subword-nmt
subword_nmt=../tools/subword-nmt

# tokenize
for prefix in corpus valid test2014 test2015 test2016 test2017
do
    cat data/$prefix.$SRC \
        | $mosesdecoder/scripts/tokenizer/normalize-punctuation.perl -l $SRC \
        | $mosesdecoder/scripts/tokenizer/tokenizer.perl -a -l $SRC > data/$prefix.tok.$SRC

    test -f data/$prefix.$TRG || continue

    cat data/$prefix.$TRG \
        | $mosesdecoder/scripts/tokenizer/normalize-punctuation.perl -l $TRG \
        | $mosesdecoder/scripts/tokenizer/tokenizer.perl -a -l $TRG > data/$prefix.tok.$TRG
done

# clean empty and long sentences, and sentences with high source-target ratio (training corpus only)
mv data/corpus.tok.$SRC data/corpus.tok.uncleaned.$SRC
mv data/corpus.tok.$TRG data/corpus.tok.uncleaned.$TRG
$mosesdecoder/scripts/training/clean-corpus-n.perl data/corpus.tok.uncleaned $SRC $TRG data/corpus.tok 1 100

# train truecaser
$mosesdecoder/scripts/recaser/train-truecaser.perl -corpus data/corpus.tok.$SRC -model $MODEL/tc.$SRC
$mosesdecoder/scripts/recaser/train-truecaser.perl -corpus data/corpus.tok.$TRG -model $MODEL/tc.$TRG

# apply truecaser (cleaned training corpus)
for prefix in corpus valid test2014 test2015 test2016 test2017
do
    $mosesdecoder/scripts/recaser/truecase.perl -model $MODEL/tc.$SRC < data/$prefix.tok.$SRC > data/$prefix.tc.$SRC
    test -f data/$prefix.tok.$TRG || continue
    $mosesdecoder/scripts/recaser/truecase.perl -model $MODEL/tc.$TRG < data/$prefix.tok.$TRG > data/$prefix.tc.$TRG
done

# train BPE
cat data/corpus.tc.$SRC data/corpus.tc.$TRG | $subword_nmt/learn_bpe.py -s $bpe_operations > $MODEL/$SRC$TRG.bpe

# apply BPE
for prefix in corpus valid test2014 test2015 test2016 test2017
do
    $subword_nmt/apply_bpe.py -c $MODEL/$SRC$TRG.bpe < data/$prefix.tc.$SRC > data/$prefix.bpe.$SRC
    test -f data/$prefix.tc.$TRG || continue
    $subword_nmt/apply_bpe.py -c $MODEL/$SRC$TRG.bpe < data/$prefix.tc.$TRG > data/$prefix.bpe.$TRG
done
