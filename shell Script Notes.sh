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
           COMMENT IN SHELL SCRIPT
==================================================

<<comment
 "Code" or "Comments"
comment

The word “comment” can be anything but it should be the same for ending the comment block.

<<com
echo"This doesn't echo"
echo"Even this doesn't"
com







