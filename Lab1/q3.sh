read -p "Enter the URL :- " url
echo "Webpage :- "$url
declare -A matrix
run=2
time_to_sleep=0
for i in $(seq 0 $run);
do
    start=$(($(date +'%s * 1000 + %-N / 1000000')))
    # start=$(date +%s.%N)
    wget -o test.txt -E $url
    # array[$i][0]=$( sed -n 's/\/s).*/\/s/p' test.txt | sed -n 's/.*(//p' )
    end=$(($(date +'%s * 1000 + %-N / 1000000')))
    # end=$(date +%s.%N)
    matrix[$i,0]=$( sed -n 's/\/s).*/\/s/p' test.txt | sed -n 's/.*(//p' )
    matrix[$i,1]=$start
    matrix[$i,2]=$end
    matrix[$i,3]=$(($end-$start))
    echo "Downloaded" $(($i+1))"st time"
    sleep $time_to_sleep
done 
rm *.html # to delete if not required
echo "Analysing ..."
echo "Speed    StartTime     EndTime       Difference"
for i in $(seq 0 $run);
do
    # echo ${array[$i][0]} ${array[$i][1]} ${array[$i][1]}
    echo ${matrix[$i,0]} ${matrix[$i,1]} ${matrix[$i,2]} ${matrix[$i,3]}
done