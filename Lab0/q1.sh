read -p "Enter date in date-day-year (31-Jan-2021) :- " a
echo "Your Entered Date is $a"
DAY=$(date -d "$a" '+%A')
echo "Happy $DAY"