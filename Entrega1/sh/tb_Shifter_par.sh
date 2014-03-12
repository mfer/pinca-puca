#!/bin/bash
bin=$1
log=$2
NPROC=$(nproc)
NPROC_H=$(($(nproc)/2))
COMB=4294967296 #2^32
RANGE=$(($COMB/$NPROC)) 
STEP=$(($RANGE/100)) #um centesimo do universo total de testes

for (( i=$NPROC_H; i > 0; i-- ))
do
#  echo +from=$(($i*$RANGE)) +step=$STEP
  vvp $bin +from=$((($i-1)*$RANGE)) +step=$STEP >> $log &
done

for (( i=1; i <= NPROC_H; i++ ))
do
#  echo +from=$((($i-1)*$RANGE)) +step=$STEP
  vvp $bin +from=$((($i-1)*$RANGE)) make +step=$STEP >> $log &
done

# sudolshw@gmail.com