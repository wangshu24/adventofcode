#!/bin/bash

awk '{
    sub(/\r$/,"")
    for (i = 1; i <= NF; i++) {
        data[i, NR] = $i
        if (i > maxc) maxc = i
    }
}
END {
    for (c = 1; c <= maxc; c++) {
        op = data[c, NR]          
        expr = data[c, 1]         
        for (r = 2; r < NR; r++)  
            expr = expr " " op " " data[c, r]
        print expr
    }
}' input.txt | bc | awk '{ sum += $1 } END { print sum }'

 