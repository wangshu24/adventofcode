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
        incre=0

        for (( i=0; i<${slice}; i++)); do
            pos=$(( pos - 1))
            if [ ${pos} -eq 0 ]; then
                incre=$(( incre + 1 ))
                pos+=100
            fi
        done

        # while [ ${slice} -gt 0 ]; do

        #     if [ $(( slice % 100 )) -gt 0 ]; then
        #         move=$(( - (slice % 100)))
        #         pos=$(( pos + move ))   
        #         if [[ ${pos} -lt  0 ]]; then
        #             psw=$(( psw + 1 ))
        #             pos=$(( 100 + pos ))
        #         fi
        #         slice=$(( slice + move))
        #     fi
        #     echo "pos is now ${pos}"
        #     if [ $(( slice / 100 )) -gt 0 ]; then
        #         psw=$(( psw + (slice / 100)))
        #         slice=0
        #     fi
        # done

        # move=$(( 0 - (slice % 100) ))
        # if [ $(( pos + move )) -lt 0 ]; then
        #     psw=$(( psw + 1))
        #     pos=$(( pos + move ))
        #     slice=$(( slice + move))
        # fi

        # if [ $(( slice / 100 )) -gt 0 ]; then
        #     psw=$(( psw + (slice / 100)))
        # fi 

        # pos=$(( pos - slice))
        # if [ ${pos} -lt 0 ]; then
        #     pos=$(( 100 + (pos%100) ))
        # fi

        # if [ ${pos} -eq 0 ]; then
        #     psw=$(( psw + 1))
        # fi
    
        if [ ${incre} -gt 0 ]; then
            psw=$(( psw + incre ))
        fi 

    else
        incre=0

        for (( i=0; i < ${slice}; i++ )); do
            pos=$(( pos + 1 ))
            if [ ${pos} -eq 100 ]; then
                incre=$(( incre + 1 ))
                pos=08
            fi
        done

        # while [ ${slice} -gt 0 ]; do

        #     if [ $(( slice % 100 )) -gt 0 ]; then
        #         move=$(( 100 - ( slice % 100 ) ))
        #         pos=$(( pos + move ))
        #         if [[ ${pos} -gt 99 ]]; then
        #             psw=$(( psw + 1 ))
        #             pos=$(( pos % 100 ))
        #             slice=$(( slice - move ))
        #         fi
        #     fi
        #     echo "pos is now ${pos}"
        #     if [ $(( slice / 100 )) -gt 0 ]; then
        #         psw=$(( psw + (slice / 100) ))
        #         slice=0
        #     fi
        # done    

        # move=$(( slice % 100))
        # if [ $(( pos + move )) -gt 99 ]; then
        #     psw=$(( psw + 1))
        #     pos=$(( pos + move ))
        #     slice=$(( slice - move))
        # fi

        # if [ $(( slice / 100 )) -gt 0 ]; then
        #     psw=$(( psw + (slice / 100)))
        # fi

        # pos=$(( pos + slice))
        # if [ ${pos} -gt 99 ]; then
        #     pos=$(( pos % 100))
        # fi

        # if [ ${pos} -eq 100 ]; then
        #     psw=$(( psw + 1))
        #     pos=0
        # fi

        if [ ${incre} -gt 0 ]; then
            psw=$(( psw + incre ))
        fi 

    fi
    
    echo "Updated position:  ${pos}"

    # if [ ${pos} -eq 0 ]; then
    #     psw=$(( psw + 1))
    # fi

done


# while read -r line; do
#     echo "line: ${line}"
# done < day1-input.txt

echo "Password: ${psw}"

