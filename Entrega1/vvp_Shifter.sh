#!/bin/bash
NPROC=$(nproc)
NPROC_H=$(($(nproc)/2))
COMB=4294967296 #2^32
STEP=16384 #2^14
RANGE=$(($COMB/$NPROC)) 

for (( i=$NPROC_H; i > 0; i-- ))
do
  echo +from=$(($i*$RANGE)) +to=$((($i-1)*$RANGE))
  vvp bin/Shifter +from=$((($i-1)*$RANGE)) +to=$(($i*$RANGE)) +step=$STEP > log/Shifter_$i &
done

for (( i=1; i <= NPROC_H; i++ ))
do
  echo +from=$((($i-1)*$RANGE)) +to=$(($i*$RANGE))
  vvp bin/Shifter +from=$((($i-1)*$RANGE)) +to=$(($i*$RANGE)) +step=$STEP > log/Shifter_$(($i+NPROC_H)) &
done