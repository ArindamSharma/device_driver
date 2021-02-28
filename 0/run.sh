if [ $1 ]
then
    if gcc $1.c -o $1.out;then
        echo "File "$1
        ./$1.out
        rm $1.out
    fi
else
    echo "Please run again with the name of file after ./$0 ( CLA without extention )"
    echo "example:-  ./$0 <filename>"
    exit 1
fi