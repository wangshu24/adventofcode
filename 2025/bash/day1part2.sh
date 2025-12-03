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
        for (( i=0; i<${slice}; i++)); do
            pos=$(( pos - 1))
            if [ ${pos} -eq 0 ]; then
                psw=$(( psw + 1 ))
            fi
            if [ ${pos} -lt 0 ]; then
                pos=$(( pos + 100 ))
            fi
        done
    else
        for (( i=0; i < ${slice}; i++ )); do
            pos=$(( pos + 1 ))
            if [ ${pos} -ge 100 ]; then
                pos=$(( pos - 100 ))
            if [ ${pos} -eq 0 ]; then
                psw=$(( psw + 1 ))
            fi
            fi
        done
    fi
    echo "Updated position:  ${pos}"
done

echo "Password: ${psw}"

