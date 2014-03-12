#!/bin/bash
bin=$1
log=$2
NPROC=$(nproc)
NPROC_H=$(($(nproc)/2))
COMB=4294967296 #2^32
RANGE=$(($COMB/$NPROC)) 

QUANT=2000

STEP=$(($RANGE/$QUANT))

rm -f $log

echo +quant=$QUANT +step=$STEP
for (( i=$NPROC_H; i > 0; i-- ))
do
  echo +from=$(($i*$RANGE))
  vvp $bin +fromA=$((($i-1)*$RANGE)) +quantA=$QUANT +stepA=$STEP +fromB=$((($i-1)*$RANGE)) +quantB=$QUANT +stepB=$STEP >> $log &
done

for (( i=1; i <= NPROC_H; i++ ))
do
  echo +from=$((($i-1)*$RANGE))
  vvp $bin +fromA=$((($i-1)*$RANGE)) +quantA=$QUANT +stepA=$STEP +fromB=$((($i-1)*$RANGE)) +quantB=$QUANT +stepB=$STEP >> $log &
done

# sudolshw@gmail.com