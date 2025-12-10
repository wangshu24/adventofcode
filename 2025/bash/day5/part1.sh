# mapfile -t fresh <  <(awk '{ sub(/\r$/, "") } NF == 0 { exit } { print }' example.txt)

arr=($(awk '{ sub(/\r$/, "") } NF==0 { exit } { split($0, x, "-"); printf "%s %s ", x[1], x[2] } END { print "" }' input.txt))
mapfile -t ings < <(awk  '{ sub(/\r$/, "") } NF == 0 { start=1; next } start' input.txt)

# echo "list of fresh ids ranges: ${fresh[@]}"
# echo "list of ingredients ids: ${ings[@]}"
# printf "%s\n" "${arr[@]}"

fresh=0
for (( j=0; j < ${#ings[@]}; j++ )); do
    for (( i=0; i < ${#arr[@]}; i+=2 )); do
        # echo "inspecting ${ings[j]} against range ${arr[$(( i + 1 ))]} to ${arr[$i]}"
        if [[ ${ings[j]} -le ${arr[$(( i+1 ))]} && ${ings[j]} -ge ${arr[$i]} ]]; then
            fresh=$(( fresh + 1 ))
            echo "found fresh ${ings[j]}"
            break
        fi
    done
done

echo $fresh