

#################################################
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
##################################################










