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


<<comments
gaditya@lptl-gaditya:~/instances$ chmod u+x shell_function.sh
gaditya@lptl-gaditya:~/instances$ ./shell_function.sh 
------------------
This machine has been up for 2 hours, 7 minutes
it has been running since 2024-05-31 11:06:11
-------------------
comments
