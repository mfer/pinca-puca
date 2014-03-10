#!/bin/bash
NPROC=$(nproc)
NPROC_H=$(($(nproc)/2))
COMB=1048576 #2^20
#COMB=4294967296 #2^32
RANGE=$(($COMB/$NPROC)) 

for (( i=1; i < NPROC_H; i++ ))
do
  echo +from=$((($i-1)*$RANGE)) +to=$(($i*$RANGE))
  vvp bin/Shifter +from=$((($i-1)*$RANGE)) +to=$(($i*$RANGE)) > log/Shifter_$i &
done

echo +from=$((($i-1)*$RANGE)) +to=$(($COMB/2-1))
vvp bin/Shifter +from=$((($i-1)*$RANGE)) +to=$(($COMB/2-1)) > log/Shifter_$i &

for (( i=NPROC_H+1; i <= NPROC; i++ ))
do
  echo +from=$((($i-1)*$RANGE)) +to=$(($i*$RANGE))
  vvp bin/Shifter +from=$((($i-1)*$RANGE)) +to=$(($i*$RANGE)) > log/Shifter_$i &
done