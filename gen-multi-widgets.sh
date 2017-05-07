#!/usr/bin/env bash

# create multiple widget files, 100 documents in each

STATES=9
WIDGETS=10
# increase to 10000 to make 1,000,000 widget states
TOTAL=10000

N=1


while [  $N -lt $TOTAL ]
do
    START=`expr $N \* 100`
    echo $START
    php gen-widgets.php $WIDGETS $STATES $START > widgets/widgets-$N.txt
    let N=N+1
done