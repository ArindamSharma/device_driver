echo "This Script Will Tell Everything Related to Student name and Rollnumber "
read -p "Enter the your Name :- " name
read -p "Enter the your Roll Number :- " roll
echo Student $name with Roll Number $roll is from IIITDM Kancheepuram College
echo First Name :- $(echo $name | sed -n 's/ .*//p')
echo Last Name :- $(echo $name | sed -n 's/.* //p')
echo The Roll Number Consist of 
echo Branch ${roll:0:3} 
echo Batch 20${roll:3:2}
echo Roll Number ${roll:6:3}
if [ ${roll:0:1} == "C" ] || [ ${roll:0:1} == "c" ] ; 
then
    echo "This is Computer Science Branch"
elif [ ${roll:0:1}  == "M" ] || [ ${roll:0:1}  == "m" ] ;
then 
    echo "This is Machnical Branch"
elif [ ${roll:0:1}  == "E" ] || [ ${roll:0:1}  == "e" ];
then 
    echo "This is Electrical Branch"
else
    echo "Wrong Roll Call "
    exit
fi
pass=$(echo 20${roll:3:2})
if [ ${roll:5:1} == "I" ] || [ ${roll:5:1} == "i" ];
then
    echo "Its a Five year Intergrated Program Dual Degree Course"
    echo "Passing Year for this Batch is $(($pass + 5))"
elif [ ${roll:5:1} == "B" ] || [ ${roll:5:1} == "B" ] ;
then
    echo "Its a Four year B.Tech Course"
    echo "Passing Year for this Batch is $(($pass + 4))"
else
    echo "Wrong Roll Call "
    exit
fi
lucky=$(($RANDOM%10))
echo Your lucky Number for the day is $lucky
delay=0.1
for i in {0..10..1}
do
    printf " / Your Lucky number is $lucky  / \r "
    sleep $delay
    printf " - Your Lucky number is $lucky  - \r "
    sleep $delay
    printf " \ Your Lucky number is $lucky  \ \r "
    sleep $delay
    printf " | Your Lucky number is $lucky  | \r "
    sleep $delay
done