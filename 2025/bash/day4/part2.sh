# mapfile -t input < input.txt
mapfile -t input < example.txt # expected 

# remove carriage return
for line in "${input[@]}";do
    line="${line%$'\r'}"
done

total=0
marked=0
prev=""
cur=${input[0]}
nex=${input[1]}
row=${#input[@]}
col=${#cur}

# make prev, cur and nex local
# assess then access x:y coordinate
# to replace cur line indices "@" with "X"
 
# for (( l=0; l < $row; l++ )); do
#     echo "inspecting line $cur"
         
#         for ((j=0; j < $col; j++ )); do
#             if [[ ${cur:j:1} == "." ]]; then
#                 continue
#             fi 
#             adj=0
        
#             if [[ ${cur:$(( j-1 )):1} == "@" && $(( j-1 )) -ge 0 ]]; then
#                 adj=$(( adj + 1 ))
#             fi
#             if [[ ${cur:$(( j+1 )):1} == "@" && $(( j+1 )) -lt $col ]]; then
#                 adj=$(( adj + 1 ))
#             fi

#             if [[ $prev != "" ]]; then
#                 lcur=$(( j-1 ))
#                 rcur=$(( j+1 ))
#                 if [[ ${prev:lcur:1} == "@" && $lcur -ge 0 ]]; then
#                     adj=$(( adj + 1 ))
#                 fi
#                 if [[ ${prev:$j:1} == "@" ]]; then
#                     adj=$(( adj + 1 ))
#                 fi
#                 if [[ ${prev:rcur:1} == "@" && $rcur -lt $col ]]; then
#                     adj=$(( adj + 1 ))
#                 fi
#             fi
#             if [[ $nex != "" ]]; then
#                 lnex=$(( j-1 ))
#                 rnex=$(( j+1 ))
#                 if [[ ${nex:lnex:1} == "@" && $(( j-1 )) -ge 0 ]]; then
#                     adj=$(( adj + 1 ))
#                 fi
#                 if [[ ${nex:$j:1} == "@" ]]; then
#                     adj=$(( adj + 1 ))
#                 fi
#                 if [[ ${nex:rnex:1} == "@" && $(( j+1 )) -lt $col ]]; then
#                     adj=$(( adj + 1 ))
#                 fi
#             fi
#             if [[ $adj -lt 4 ]]; then
#                 total=$(( total + 1 ));
#             fi
#         done

#     # fi

#     echo "found total so far: $total"
#     # reset prev, cur and nex line   
#     prev="${cur%$'\r'}"
#     cur="${nex%$'\r'}"
#     nex="${input[l+2]%$'\r'}"
# done

# while [[ $marked -lt 0 ]]; do
#     # aggregate total then reset marked
#     total=$(( total + marked))
#     echo "new total: $total"
#     prev=""
#     cur="${input[0]%$'\r'}"
#     nex="${input[1]%$'\r'}"
#     marked=0

#     for (( l=0; l < $row; l++ )); do
#         echo "inspecting line $cur"
            
#             for ((j=0; j < $col; j++ )); do
#                 if [[ ${cur:j:1} == "." ]]; then
#                     continue
#                 fi 
#                 adj=0
            
#                 if [[ ${cur:$(( j-1 )):1} == "@" && $(( j-1 )) -ge 0 ]]; then
#                     adj=$(( adj + 1 ))
#                 fi
#                 if [[ ${cur:$(( j+1 )):1} == "@" && $(( j+1 )) -lt $col ]]; then
#                     adj=$(( adj + 1 ))
#                 fi

#                 if [[ $prev != "" ]]; then
#                     lcur=$(( j-1 ))
#                     rcur=$(( j+1 ))
#                     if [[ ${prev:lcur:1} == "@" && $lcur -ge 0 ]]; then
#                         adj=$(( adj + 1 ))
#                     fi
#                     if [[ ${prev:$j:1} == "@" ]]; then
#                         adj=$(( adj + 1 ))
#                     fi
#                     if [[ ${prev:rcur:1} == "@" && $rcur -lt $col ]]; then
#                         adj=$(( adj + 1 ))
#                     fi
#                 fi
#                 if [[ $nex != "" ]]; then
#                     lnex=$(( j-1 ))
#                     rnex=$(( j+1 ))
#                     if [[ ${nex:lnex:1} == "@" && $(( j-1 )) -ge 0 ]]; then
#                         adj=$(( adj + 1 ))
#                     fi
#                     if [[ ${nex:$j:1} == "@" ]]; then
#                         adj=$(( adj + 1 ))
#                     fi
#                     if [[ ${nex:rnex:1} == "@" && $(( j+1 )) -lt $col ]]; then
#                         adj=$(( adj + 1 ))
#                     fi
#                 fi
#                 if [[ $adj -lt 4 ]]; then
#                     total=$(( total + 1 ));
#                 fi
#             done

#         # fi

#         echo "found total so far: $total"
#         # reset prev, cur and nex line   
#         prev="${cur%$'\r'}"
#         cur="${nex%$'\r'}"
#         nex="${input[l+2]%$'\r'}"
#     done
     
# done

echo "total: $total"


