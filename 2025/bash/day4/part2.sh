# mapfile -t input < input.txt
mapfile -t input < example.txt # expected 43

# remove carriage return
for line in "${input[@]}";do
    line="${line%$'\r'}"
done

total=0
marked=0
prev=""
cur="${input[0]%$'\r'}"
nex="${input[1]%$'\r'}"
row=${#input[@]}
col=${#cur}

# make prev, cur and nex local
# assess then access x:y coordinate
# to replace cur line indices "@" with "X" 43

for (( l=0; l < $row; l++ )); do
    tmp=$cur
    for ((j=0; j < $col; j++ )); do
        if [[ ${cur:j:1} == "." ]]; then
            continue
        fi 
        adj=0
    
        if [[ ${cur:$(( j-1 )):1} == "@" && $(( j-1 )) -ge 0 ]]; then
            adj=$(( adj + 1 ))
        fi
        if [[ ${cur:$(( j+1 )):1} == "@" && $(( j+1 )) -lt $col ]]; then
            adj=$(( adj + 1 ))
        fi

        if [[ $prev != "" ]]; then
            lcur=$(( j-1 ))
            rcur=$(( j+1 ))
            if [[ ${prev:lcur:1} == "@" && $lcur -ge 0 ]]; then
                adj=$(( adj + 1 ))
            fi
            if [[ ${prev:$j:1} == "@" ]]; then
                adj=$(( adj + 1 ))
            fi
            if [[ ${prev:rcur:1} == "@" && $rcur -lt $col ]]; then
                adj=$(( adj + 1 ))
            fi
        fi
        if [[ $nex != "" ]]; then
            lnex=$(( j-1 ))
            rnex=$(( j+1 ))
            if [[ ${nex:lnex:1} == "@" && $(( j-1 )) -ge 0 ]]; then
                adj=$(( adj + 1 ))
            fi
            if [[ ${nex:$j:1} == "@" ]]; then
                adj=$(( adj + 1 ))
            fi
            if [[ ${nex:rnex:1} == "@" && $(( j+1 )) -lt $col ]]; then
                adj=$(( adj + 1 ))
            fi
        fi
        if [[ $adj -lt 4 ]]; then
            marked=$(( marked + 1 ));
            tmp="${tmp:0:j}X${tmp:j+1}"
        fi
    done

    # reset prev, cur and nex line   
    prev="${cur%$'\r'}"
    cur="${nex%$'\r'}"
    nex="${input[l+2]%$'\r'}"
    input[l]="$tmp"
done

times=5
while [[ $marked -gt 0 ]]; do
    # aggregate total then reset marked
    total=$(( total + marked))
    prev=""
    cur="${input[0]%$'\r'}"
    nex="${input[1]%$'\r'}"
    marked=0
    tmpa=("${input[@]}")

    for (( l=0; l < $row; l++ )); do
        # echo "inspecting line $cur"
        for ((j=0; j < $col; j++ )); do
            if [[ ${cur:j:1} == "."  || ${cur:j:1} == "X" ]]; then
                continue
            fi 
            adj=0
            if [[ ${cur:$(( j-1 )):1} == "@" && $(( j-1 )) -ge 0 ]]; then
                adj=$(( adj + 1 ))
            fi
            if [[ ${cur:$(( j+1 )):1} == "@" && $(( j+1 )) -lt $col ]]; then
                adj=$(( adj + 1 ))
            fi

            if [[ $prev != "" ]]; then
                lcur=$(( j-1 ))
                rcur=$(( j+1 ))
                if [[ ${prev:lcur:1} == "@" && $lcur -ge 0 ]]; then
                    adj=$(( adj + 1 ))
                fi
                if [[ ${prev:$j:1} == "@" ]]; then
                    adj=$(( adj + 1 ))
                fi
                if [[ ${prev:rcur:1} == "@" && $rcur -lt $col ]]; then
                    adj=$(( adj + 1 ))
                fi
            fi
            if [[ $nex != "" ]]; then
                lnex=$(( j-1 ))
                rnex=$(( j+1 ))
                if [[ ${nex:lnex:1} == "@" && $(( j-1 )) -ge 0 ]]; then
                    adj=$(( adj + 1 ))
                fi
                if [[ ${nex:$j:1} == "@" ]]; then
                    adj=$(( adj + 1 ))
                fi
                if [[ ${nex:rnex:1} == "@" && $(( j+1 )) -lt $col ]]; then
                    adj=$(( adj + 1 ))
                fi
            fi
            if [[ $adj -lt 4 ]]; then
                marked=$(( marked + 1 ));
                tmpa[l]="${tmpa[l]:0:j}X${tmpa[l]:j+1}"
            fi
        done
        
        # echo "marked another $marked for removal"
        # reset prev, cur and nex line   
        prev="${cur%$'\r'}"
        cur="${nex%$'\r'}"
        nex="${input[l+2]%$'\r'}"
    done
    input=("${tmpa[@]}")
done

echo "total: $total"


