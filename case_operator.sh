#!/bin/bash

echo "What is your Name?"

read NAME
case $NAME in
        Aditya)
                echo "Your are the person i am looking for"
                ;;
        Help)
                echo "Enter you name, nothing else"
                ;;
        *)
                echo "Sorry! who are you?"
                ;;
        esac

<<comment
gaditya@lptl-gaditya:~/instances$ vi log_in.sh
gaditya@lptl-gaditya:~/instances$ chmod u+x log_in.sh 
gaditya@lptl-gaditya:~/instances$ ./log_in.sh aditya
What is your Name?
aditya
Sorry! who are you?
gaditya@lptl-gaditya:~/instances$ ./log_in.sh
What is your Name?
Aditya
Your are the person i am looking for

comment
