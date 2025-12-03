read -a input < input.txt
input="${input//,/-}"
IFS='-' read -r -a arr <<< "$input"

total=0
for (( i=0; i<${#arr[@]}; i+=2)); do
    echo ${arr[@]:i:2}
    
done

echo "Sum: ${total}"
