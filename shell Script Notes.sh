==========================================================
                shell script
==========================================================
Writing first bash script
>> vim shelltest.sh
echo Hello World!


here when we run shelltest.sh file
it will print Hello World! on the terminal
to run the shelltest.sh

>> bash shelltest.sh
Hello World!

here we are running the file in bash shell
you can verify using 
>> echo $SHELL
/bin/bash

you can run above file also like this
>> /bin/bash shelltest.sh
Hello World!

you can provide shell command in the start of bash
script, so that while running script our
script will use that bash shell to run the file.
this is also called shebang (#!<shell path>), need
to add in start of the file

>> vim shelltest.sh
#!/bin/bash
echo "Hello World!"

Now to run the file
>>./shelltest.sh

bash: ./shelltest.sh: Permission denied
if getting the above error, then need to change
file permission

>> ls -l
-rw-rw-r-- 1 gaditya gaditya 32 May 28 01:32 shelltest.sh

>> chmod u+x shelltest.sh 
>> ./shelltest.sh
Hello World!
=============================================================
                  Variable
=============================================================
No space between variable name and =

>> FIRST_NAME= Aditya
>> echo $FIRST_NAME
Aditya

same way we can use variable in shell script

>> vim hellovariable.sh
#!/bin/bash

FIST_NAME=Aditya
LAST_NAME=Gupta
echo hello $FIST_NAME $LAST_NAME

>> chmod u+x hellovariable.sh
>> ./hellovariable.sh
hello Aditya Gupta

-------------------------------
-------------------------------
We can also take input from user 
using read <variable_name>

>> vi interactiveshell.sh
#!/bin/bash

echo what is your first name?
read FIRST_NAME
echo what is your last name?
read LAST_NAME

echo hello $FIRST_NAME $LAST_NAME

when you will run
-----------
$ chmod u+x interactiveshell.sh 
$ ./interactiveshell.sh 
what is your first name?
aditya
what is your last name?
gupta
hello aditya gupta
==================================================
          POSITIONAL ARGUMENTS
==================================================
Arguments are a specific positions.
commands can take in arguments at a specific
position, counting from one ( 0 reserved for shell).

>> echo Hello there
     0    1    2

>> vi posiargs.sh
#!/bin/bash

echo Hello $1 $2

while running the file just give two argument
for 1 and 2 position, zero position is reserved for
shell.

>> chmod u+x posiargs.sh
>> ./posiargs.sh aditya gupta
Hello aditya gupta

so $1 -first positional argument
   $2 -second positional argument
   $3 -third positional argument
======================================================
                   PIPING
======================================================
send command output to other command

command one                pipe symbol                  command two
------------               ----------                   ------------
echo Hello world          echo hello |               echo hello | grep world


>> ls -l /usr/bin | grep bash
return all the file which have bash binary in the directory


===========================================================
                  INPUT/OUTPUT REDIRECTION
===========================================================
When we have to write something to a file or append we cannot use
pipe symbol. we need to use > or >> sysmbol.

>  symbol is write to a file (overwrite the file)
>> symbol for apppend to a file

>> echo Hello World! > hello.txt
>> echo Hey there ! >> hello.txt

>> cat hello.txt
Hello World!
Hey there !

UseCase of this:
  * Logging to a logfile (eg: using timestamps)
  * Dynamically creating (config) files.

Taking Input from the file
-----------------------
>> wc -w hello.txt
here wc command will take hello.txt as positional 
argument and print word count (-w) and also print hello.txt
out= 6 hell.txt

but i want to give file data as input not positional argument
so that it will count word and return only number of word and
not file name.

we can achieve that by using < operator

>> wc -w < hello.txt
6


Suppose you want to write something and when type EOF
it will stop
$ cat << EOF
> I will 
> wirte some
> text here
EOF
I will 
wirte some
text here


Suppose you want to feed string into a command
>> wc -w <<< "Hello there wordcount!"
3

========================================================
                  TEST OPERATOR
========================================================
>> [ 1 = 1 ]
>> echo $?
0
if true return 0

>> [ hello = hello ]
>> echo $?
0
if true return 0

>> [ 1 = 0 ]
>> echo $?
1
if false return 1

>> [ 1 -eq 1 ]
>> echo $?
0

===========================================================
                    IF/ELIF/ELSE
===========================================================
create a file
>> vi ifelifelse.sh
#!/bin/bash

if [ ${1,,} = aditya ]; then
      echo "Oh you are the boss here"
elif [ ${1,,} = help ]; then
      echo "Just enter your username, duh!"
else
      echo "I don't know who you are?"
fi

gaditya@lptl-gaditya:~$ vi ifelifelse.sh
gaditya@lptl-gaditya:~$ chmod u+x ifelifelse.sh 
gaditya@lptl-gaditya:~$ ./ifelifelse.sh aditya
Oh you are the boss here
gaditya@lptl-gaditya:~$ ./ifelifelse.sh help
Just enter your username, duh!
gaditya@lptl-gaditya:~$ ./ifelifelse.sh vijay
I do not know who you are?



Format
-----------------------------------------------------
if [ expression 1 ]
then
   Statement(s) to be executed if expression 1 is true
elif [ expression 2 ]
then
   Statement(s) to be executed if expression 2 is true
elif [ expression 3 ]
then
   Statement(s) to be executed if expression 3 is true
else
   Statement(s) to be executed if no expression is true
fi
--------------------------------------------------------

========================================================
                CASE STATEMENTS
========================================================
better than if/elif/else when
 * checking for multiple values
 * is easier to read


>> vi login_case.sh

#!/bin/bash

case ${1,,} in  
      herbert | aditya | administrator)
          echo "Hello your are the boss here"
          ;;
      help)
          echo "Just enter the username"
          ;;
      *)
          echo "I don't know you who are you"
  esac

  Note:
   * to close one statement use ;;
   * for new statement statement)
   * to close the case esac
   * for all other value *)
          

====================================================
        MULTILINE COMMENT IN SHELL SCRIPT
==================================================

<<comment
 "Code" or "Comments"
comment

The word “comment” can be anything but it should be the same for ending the comment block.

<<com
echo"This doesn't echo"
echo"Even this doesn't"
com

=======================================================
        ARRAYS IN SHELL SCRIPT
=======================================================

$ MY_FIRST_LIST=(ONE TWO THREE FOUR FIVE)
$ echo $MY_FIRST_LIST
>> ONE
printing only first element
To print all element

$ echo ${MY_FIRST_LIST[@]}
ONE TWO THREE FOUR FIVE

We can also define which element we want to print
$ echo ${MY_FIRST_LIST[0]}
ONE
$ echo ${MY_FIRST_LIST[1]}
TWO

======================================================
                   FOR LOOP
======================================================
write a shell script to count each element length 
using wc command

$ for item in ${MY_FIRST_LIST[@]}; do echo -n $item | wc -c; done
3
3
5
4
4


Printing all element in array using for loop
for item in ${MY_FIRST_LIST[@]}; do echo -n $item |echo $item; done
ONE
TWO
THREE
FOUR
FIVE

$ for item in ${MY_FIRST_LIST[@]}; do echo -n $item; done
ONETWOTHREEFOURFIVE

NOTE: here -n to ingore new line character

$for item in ${MY_FIRST_LIST[@]}; do echo $item; done
ONE
TWO
THREE
FOUR
FIVE

=========================================================
                    function
=========================================================
>> vi first_function.sh

#!/bin/bash
showuptime(){
        up=$(uptime -p | cut -c4-)
        since=$(uptime -s)
        cat << EOF
------------------
This machine has been up for ${up}
it has been running since ${since}
-------------------
EOF
}
showuptime

<<comment
gaditya@lptl-gaditya:~$ chmod u+x first_function.sh 
gaditya@lptl-gaditya:~$ ./first_function.sh 
------------------
This machine has been up for 1 hour, 9 minutes
it has been running since 2024-05-30 10:40:17
------------------
comment

Note: what ever variable defined in function is by default global variable

example:
===============
#!/bin/bash
up="before"
since="function"
echo $up
echo $since

showuptime(){
        up=$(uptime -p | cut -c4-)
        since=$(uptime -s)
        cat << EOF
------------------
This machine has been up for ${up}
it has been running since ${since}
-------------------
EOF
}
showuptime
echo $up
echo $since

<<output
gaditya@lptl-gaditya:~$ ./first_function.sh 
before
function
------------------
This machine has been up for 1 hour, 17 minutes
it has been running since 2024-05-30 10:40:17
-------------------
1 hour, 17 minutes
2024-05-30 10:40:17
output

Note: to define local variable put local before defining variable

#!/bin/bash
up="before"
since="function"
echo $up
echo $since

showuptime(){
        local up=$(uptime -p | cut -c4-)
        local since=$(uptime -s)
        cat << EOF
------------------
This machine has been up for ${up}
it has been running since ${since}
-------------------
EOF
}
showuptime
echo $up
echo $since

<<output
gaditya@lptl-gaditya:~$ ./first_function.sh 
before
function
------------------
This machine has been up for 1 hour, 18 minutes
it has been running since 2024-05-30 10:40:17
-------------------
before
function
output

=========================================================
                function with Arguments
=========================================================
#!/bin/bash

showname(){
        echo hello $1
        if [ ${1,,} = aditya ]; then
                return 0
        else
                return 1
        fi
}
showname $1
if [ $? = 1 ]; then
        echo "who you are I don't know you"
fi

<<comments
Note: while calling the function what ever we give in front of 
him, will be argument for that function

gaditya@lptl-gaditya:~/instances$ ./function_with_args.sh aditya
hello aditya
gaditya@lptl-gaditya:~/instances$ ./function_with_args.sh Mohan
hello Mohan
who you are I don't know you
-----------
comments

==============================================================
                         AWK
==============================================================
(a) Scans a file line by line 
(b) Splits each input line into fields 
(c) Compares input line/fields to pattern 
(d) Performs action(s) on matched lines 

By default Awk prints every line of data from the specified file
------------------------------------------------------
>> cat > employee.txt
ajay manager account 45000
sunil clerk account 25000
varun manager sales 50000

>> awk '{print}' employee.txt
It will print by default all the lines of the file employee.txt

Printing Specific word
---------------------
>> awk '{print $1}' employee.txt
print first word before whitespace or first coloumn
>> awk '{print $2}' employee.txt
print 2nd word after whitespace or 2nd coloumn

Print the lines which match the given pattern
------------------------------------
>> awk '/manager/ {print}' employee.txt
print all the lines which contains manager
ajay manager account 45000
varun manager sales 50000

Splitting a Line Into Fields
--------------------------
Note: the awk command splits the record delimited by whitespace
character by default and stores it in the $n variables.
If the line has 4 words, it will be stored in $1, $2, $3 and $4 respectively.
Also, $0 represents the whole line.  

>> awk '{print $1,$4}' employee.txt
it will print first and 4rth coloum

ajay 45000
sunil 25000
varun 50000

>> vi csvtest.csv
one,two,three

>> awk -F, '{print $1}' csvtest.csv
one

Note: Use F (here comma) for the input field separator

-----------------------------------------------------
          PIPING WITH AWK
-----------------------------------------------------
>> echo "Just get this word: Hello" | awk '{print $5}'
Hello

>> echo "Just get this word: Hello" | awk -F: '{print $2}' | cut -c2-
Hello
Note:
 -F:  will seperate base on (:)
 
=======================================================
             SED Commands
=======================================================
SED command in UNIX stands for stream editor and it can perform
lots of functions on file like searching, find and replace,
insertion or deletion. Though most common use of SED command 
in UNIX is for substitution or for find and replace. 

>> vi hello.txt
unix is great os. unix is opensource. unix is free os.
learn operating system.
unix linux which one you choose.
unix is easy to learn.unix is a multiuser os.Learn unix .unix is a powerful.

substitution
------------
>> sed 's/unix/linux/' hell.txt

linux is great os. unix is opensource. unix is free os.
learn operating system.
linux linux which one you choose.
linux is easy to learn.unix is a multiuser os.Learn unix .unix is a powerful.

Note: By default it will find and substitute first occurance
      Here 's' specifies substitution operation.

Replacing nth occurance
--------------------
>> sed 's/unix/linux/2' hell.txt
unix is great os. linux is opensource. unix is free os.
learn operating system.
unix linux which one you choose.
unix is easy to learn.linux is a multiuser os.Learn unix .unix is a powerful.

Replacing all occurances
------------------------
>> sed 's/unix/linux/g' hell.txt
linux is great os. linux is opensource. linux is free os.
learn operating system.
linux linux which one you choose.
linux is easy to learn.linux is a multiuser os.Learn linux .linux is a powerful.

Replacing from nth occurance to all occurance in line
---------------------------------------------------
>> sed 's/unix/linux/2g' hell.txt
Replacing on specific line number
>> sed '3 s/unix/linux/2g' hell.txt

Deleting lines from a particular file
-----------------------------------
>> sed 'nd' <file_name>
>> sed '2d' hell.txt

To Delete line from range x to y
-----------------------------
>> sed '3, 5d' hell.txt

If you want to create a backup file for your original file
------------------------------
>> sed -i.ORIGINAL 's/unix/linux/g' hell.txt

it will create a backup file of hell.txt
hell.txt.ORIGINAL

















