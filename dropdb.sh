#!/bin/bash 

echo "-------------------drop table------------------------"

read -p "enter table you want to drop :" tb_name

if [[ -f $tb_name ]]; then

    rm -r $tb_name
    rm -r $metadata
    echo "table dropped"

else
    echo "table didn't exist before"

fi

. main.sh