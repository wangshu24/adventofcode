psw=0
dig=(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99)
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
    echo "pos: ${pos}"
    
    if [ ${pos} -gt 99 ]; then 
        pos=$(( pos % 100 ))
        if [ $(( pos % 100)) -eq 0 ]; then
            pos=0
        fi
    fi
    
    if [ ${pos} -lt 0 ]; then
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

    # if [ "${step}" == "L"]; then pos=$(())