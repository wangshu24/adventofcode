mapfile -t input < input.txt
# mapfile -t input < example.txt # expected 13
total=0
prev=""
cur="${input[0]%$'\r'}"
nex="${input[1]%$'\r'}"
row=${#input[@]}
col=${#cur}

# did not used this, though good draft for initial idea
find_adjacent() {
    local anchor=$1
    local adj=0
    if [[ $cur == "" ]]; then
        return 1
    fi

    if [[ $prev -ne "" ]]; then
        if [[ ${prev:$anchor-1:1} == "@" ]]; then
            adj=$(( adj + 1 ))
        fi 
        if [[ ${prev:$anchor:1} == "@" ]]; then
            adj=$(( adj + 1 ))
        fi
        if [[ ${prev:$anchor+1:1} == "@" ]]; then
            adj=$(( adj + 1 ))
        fi
    fi
    if [[ $nex -ne "" ]]; then
        if [[ ${nex:$anchor-1:1} == "@" ]]; then
            adj=$(( adj + 1 ))
        fi 
        if [[ ${nex:$anchor:1} == "@" ]]; then
            adj=$(( adj + 1 ))
        fi
        if [[ ${nex:$anchor+1:1} == "@" ]]; then
            adj=$(( adj + 1 ))
        fi
        if [[ $adj -gt 3 ]]; then
            return 1
        fi
    fi
    
    if [[ ${cur:$anchor-1:1} == "@" ]]; then
        adj=$(( adj + 1 ))
    fi
    if [[ $adj -gt 3 ]]; then
        return 1
    fi
    if [[ ${cur:$anchor+1:1} == "@" ]]; then
        adj=$(( adj + 1 ))
    fi

    echo "adjacent: $adj"
    return $adj
}

for (( l=0; l < $row; l++ )); do
    echo "inspecting line $cur"
         
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
                total=$(( total + 1 ));
            fi
        done

    # fi

    echo "found total so far: $total"
    # reset prev, cur and nex line   
    prev="${cur%$'\r'}"
    cur="${nex%$'\r'}"
    nex="${input[l+2]%$'\r'}"
done

echo "total: $total"

