#!/bin/bash

if [ ${1,,} = aditya ]; then
        echo "Oh you are the boss here"
elif [ ${1,,} = help ]; then
        echo "Just enter your username, duh!"
else
        echo "I don't know who you are?"
fi
