#!/bin/bash

figlet ipechoCheck

curl https://ipecho.net/plain
echo ""
if [ ! -z "$1" ]
then
        while true
        do
                sleep $1s
                data=$(date +"%d/%m/%y %T - ")
                ip=$(curl https://ipecho.net/plain -s)
                echo $data$ip
        done
fi
