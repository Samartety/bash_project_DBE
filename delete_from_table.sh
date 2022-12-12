#!/bin/bash
echo "------------------delete from table-----------------------"


read -p "enter table you want to delete from :" tb_name

if [[ -f $db_name/$tb_name ]]; then
    echo "table Existed"
    echo "choose from delete ways: "
    select choice in "Delete All" "Delete using PK" "Exit"; do
        case $choice in
        "Delete All")
            echo "" >$db_name/$tb_name
            echo "File Content Deleted Successfully"
            ;;

        "Delete using PK")
            read -p "Enter the primary key: " pk
            Record_no=$(awk -F ":" '{if($1=="'$pk'") print "Primary_key_exist" }' $db_name/$tb_name)

            
            if [[ "$Record_no" = "Primary_key_exist" ]]; then
                Record_no=$(awk -F ":" '{if($1=="'$pk'") print NR}' $db_name/$tb_name)
                sed -i ''$Record_no'd' $db_name/$tb_name
                echo "File Record Deleted Successfully"

            else
                echo "Primary key doesn't exist !! "
            fi
            ;;
        "Exit")
            echo "Switched To Connect Database Menu"
            . ./.connectToBD.sh
            ;;

        *) echo "not in the choice" ;;

        esac
    done

  
else
    echo "Table is not Existed !!"
fi
. ./ main.sh