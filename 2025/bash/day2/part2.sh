read -a input < example.txt
# read -a input < input.txt
input="${input//,/-}"
IFS='-' read -r -a arr <<< "$input"

total=0

is_repeated() {
    local s="$1"
    local len=${#s}

    for ((n=1; n<=len/2; n++)); do
        if (( len % n == 0 )); then
            sub=${s:0:n}
            rep=""

            for ((i=0; i<len/n; i++)); do
                rep+="$sub"
            done

            [[ "$rep" == "$s" ]] && return 0
        fi
    done

    return 1
}


for (( i=0; i<${#arr[@]}; i+=2)); do
    start=${arr[i]}
    end=${arr[i+1]}
    for (( j=start; j<=end; j++ )); do
        if is_repeated "$j"; then
            echo "Repeated substring: $j"
            total=$(( total + j ))
        fi
    done
done

echo "Sum: ${total}"
