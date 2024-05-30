MY_FIRST_LIST=(ONE TWO THREE FOUR FIVE)

echo ${MY_FIRST_LIST[@]}
echo ${MY_FIRST_LIST[0]}
echo ${MY_FIRST_LIST[1]}

# to print number of character in each word
for item in ${MY_FIRST_LIST[@]}; do echo -n $item | wc -c; done

# -n to ingore new line character

#printing all the element in array
for item in ${MY_FIRST_LIST[@]}; do echo $item; done
