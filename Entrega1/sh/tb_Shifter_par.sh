#!/bin/bash
bin=$1
log=$2
NPROC=$(nproc)
NPROC_H=$(($(nproc)/2))
COMB=4294967296 #2^32
RANGE=$(($COMB/$NPROC)) 

QUANT=100000

STEP=$(($RANGE/$QUANT))

rm -f $log

echo +quant=$QUANT +step=$STEP
for (( i=$NPROC_H; i > 0; i-- ))
do
  echo +from=$(($i*$RANGE))
  vvp $bin +from=$((($i-1)*$RANGE)) +quant=$QUANT +step=$STEP >> $log &
done

for (( i=1; i <= NPROC_H; i++ ))
do
  echo +from=$((($i-1)*$RANGE))
  vvp $bin +from=$((($i-1)*$RANGE)) +quant=$QUANT +step=$STEP >> $log &
done

# sudolshw@gmail.com