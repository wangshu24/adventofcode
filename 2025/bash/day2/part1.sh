# read -a input < example.txt
read -a input < input.txt
input="${input//,/-}"
IFS='-' read -r -a arr <<< "$input"

total=0
for (( i=0; i<${#arr[@]}; i+=2)); do
    start=${arr[i]}
    end=${arr[i+1]}
    for (( j=start; j<=end; j++ )); do
        len=${#j}
        l=${j:0:len/2}
        r=${j:len/2:len/2}
        if [[ ${j:0:len/2} == ${j:len/2:len/2} && $(( len % 2 )) -eq 0 ]]; then
            echo "Invalid id: ${j}"
            total=$(( total + j ))
        fi
    done
done

echo "Sum: ${total}"
