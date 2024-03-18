#!/bin/bash

if [ -f /.dockerenv ]; then
    password(){
        password=
    }
else
    password(){
        if ! ${password+:} false
        then
            printf "password: "
            read -s password
        fi
    }
fi