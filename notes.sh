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
We can also take input from user
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









