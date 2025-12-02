psw=0
pos=50
echo "Initial position: $pos"
steps=$(cat day1-input.txt)
# steps=$(cat example.txt)

for step in ${steps}; do 
    slice=${step:1}
    slice=${slice//$'\r'/}
    slice="$(echo -n "$slice")"

    if [ "${step:0:1}" == "L" ]; then 
        pos=$(( pos - slice ))
    else
        pos=$(( pos + slice ))
    fi
    echo "pos after move: ${pos}"
    
    if [ ${pos} -gt 99 ]; then 
        # psw=$(( psw + (pos / 100) ))
        pos=$(( pos % 100 ))
        if [ $(( pos % 100)) -eq 0 ]; then
            pos=0
        fi
    fi
    
    if [ ${pos} -lt 0 ]; then
        # psw=$(( psw - (pos / 100)))
        pos=$(( 100 + (pos % 100) ))
        if [ $(( pos % 100 )) -eq 0 ]; then
            pos=0
        fi
    fi
    
    echo "Updated position:  ${pos}"

    if [ ${pos} -eq 0 ]; then
        psw=$(( psw + 1))
    fi
done


# while read -r line; do
#     echo "line: ${line}"
# done < day1-input.txt

echo "Password: ${psw}"
