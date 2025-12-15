#!/bin/bash

mapfile -t arr < <(sort -n -t '-' -k1,1 example2.txt) # expected 16
# mapfile -t arr < <(sort -n -t '-' -k1,1 input2.txt)

# The //[^0-9-] is a regex that matches any character that is not a digit or a dash
IFS="-" read -r min max <<< "${arr[0]//[^0-9-]/}"

printf "%s\n" "min: $min and max: $max"

freshcount=$(( max - min + 1 ))
for (( i=1; i < ${#arr[@]}; i++ )); do
    IFS="-" read -r nmin nmax <<< "${arr[i]//[^0-9-]/}"

    if [[ ${nmin} -lt ${max} ]]; then
        if [[ ${nmax} -gt ${max} ]]; then
            freshcount=$(( ${freshcount} + ( ${nmax} - ${max} ) ))
            max=${nmax}
        fi
    fi
    if [[ ${nmin} -gt ${max} ]]; then
        max=${nmax}
        min=${nmin}
        freshcount=$(( ${freshcount} + (${max} - ${min}) + 1 ))
    fi
    if [[ ${nmin} -eq ${max} ]]; then
        max=${nmax}
        freshcount=$(( ${freshcount} + (${nmax} - ${nmin}) ))
    fi      
done

echo $freshcount