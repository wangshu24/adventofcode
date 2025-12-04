#!/bin/bash

mapfile -t input < example.txt

total=0
for line in "${input[@]}"; do
    line=${line%$'\r'}
    l=0
    tmp=0
    for (( r=1; r<${#line}; r++ )); do
        if [[ ${line:l:1}${line:r:1} -gt $tmp ]]; then
            tmp=${line:l:1}${line:r:1}
        fi  
        if [[ ${line:l:1} -lt ${line:r:1} ]]; then
            l=${r}
        fi
    done
    total=$(( total + $tmp ))
done

echo "total: $total"