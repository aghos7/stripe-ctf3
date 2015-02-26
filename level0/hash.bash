#!/bin/sh
i=1
while [ 1 ]
do
    sha1=$(
    if (( i % 100000 == 0 )); then  # pause every 10 iterations
        echo $i
    fi
    let "i++"
done
