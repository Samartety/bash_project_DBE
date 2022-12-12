#!/bin/bash

echo "-------------------select from table--------------------------"

read -p "enter table to select from : " table_name
select choice in "select all" "select using PK" "Exit"; do
    case $choice in

    "Select All")
        output=$(cat "$db_name/$tb_name")
        for line in $output; do
            echo $line
        done
        echo "All Records Are Selected Successfully In $tb_name "

        ;;
    

    
        "Select using PK")
        read -p "Enter the primary key: " pk
        ID_exist=$(awk -F ":" '{if($1=="'$pk'") print "Primary_key_exist" }' $db_name/$tb_name)

    
        if [ "$ID_exist" = "Primary_key_exist" ]; then

            Record_no=$(awk -F ":" '{if($1=="'$pk'") print $0}' $db_name/$tb_name)
            echo $Record_no
            echo " Record Is Selected Successfully from $tb_name "

        else
            echo "Primary key doesn't exist !! "
        fi
        ;;

    "Exit")
        echo "Switched To Connect Database Menu"
        . connect_table.sh
        ;;
    *) echo "not in the choice" ;;
    esac
done