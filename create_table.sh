#!/bin/bash
echo "----------------------create table-----------------------------"

read -p "enter database you want to create table : " db_name

if [[ -d "$db_name/$tb_name" ]]; then
    echo "table existed before"

else
    touch $db_name/$tb_name
    touch $db_name/$metadata
    echo "table created"

   
    echo -n "@PK.id:" >> $db_name/$metadata

    read -p "How many fields do you want in table? " fields_no 

    for ((c = 1; c <= $fields_no; ((c++)))); do

        echo "Enter Field no.$c Name: "

        read field

        if [[ $c = $fields_no ]]; then
            echo -n "$field" >>$db_name/$metadata
        else
            echo -n "$field:" >>$db_name/$metadata
        fi
    done
    
    echo >>$db_name/$metadata

    echo -n "int:" >>$db_name/$metadata

    for ((i = 1; i <= $fields_no; ((i++)))); do
        echo "enter Field no.$i Datatype: "

        if [ $i = $fields_no ]; then
            select datatype in "int" "varchar" "Exit";
             do
                case $datatype in
                "int" | "varchar" )
                    echo -n "$datatype" >>$db_name/$metadata
                    break
                    ;;
                "Exit")  
                    ;; 
                    * )
                esac
            done
       
        fi
    done

fi
. ./ connect_table.sh
. ./main.sh 