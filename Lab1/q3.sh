read -p "Enter the URL :- " url
echo "Webpage :- "$url
run=9
time_to_sleep=0
for i in $(seq 0 $run);
do
    wget -o test.txt -E $url
    array[$i]=$( sed -n 's/\/s).*/\/s/p' test.txt | sed -n 's/.*(//p' )
    echo "Downloaded" $(($i+1))"st time with speed :- "${array[$i]}
    sleep $time_to_sleep
done 
rm *.html # to delete if not required
echo "Analysing ..."
for i in $(seq 0 $run);
do
    echo -E ${array[$i]}
done