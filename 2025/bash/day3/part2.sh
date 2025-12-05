#!/bin/bash

mapfile -t input < input.txt

total=0
for line in "${input[@]}"; do
    line=${line%$'\r'}
    prev=-1
    tmp=0
    for (( pos=12; pos > 0; pos-- )); do
        most=$(( prev + 1 ))
        for (( i=$(( prev + 1 )); i <= $(( ${#line} - pos )); i++ )); do
            if [[ ${line:$most:1} -lt ${line:$i:1} ]]; then
                most=$i
            fi
        done
        tmp=$(( tmp * 10 + ${line:$most:1} ))
        echo "new tmp: $tmp"
        prev=$most
    done
    total=$(( total + tmp ))
done

echo "total: $total"