#!/bin/bash

figlet ipechoCheck
echo "By Morryk - rev. 1.0"

curl https://ipecho.net/plain
echo ""
if [ ! -z "$1" ]
then
        while true
        do
                sleep $1s
                data=$(date +"%D %T - ")
                ip=$(curl https://ipecho.net/plain -s)
                echo $data$ip
        done
fi
