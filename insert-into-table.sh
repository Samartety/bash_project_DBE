#!/bin/bash

echo "---------------------insert into table---------------------------"

read -p "enter table you want to insert into : " tb_name
data=.$table_name@metadata

if [[ -f $db_name/$tb_name ]]; then

    colsNum=$(awk 'BEGIN{FS=":"}{if(NR == 1) print NF}' $db_name/$metadata)

    if [[ -s $db_name/$tb_name ]]; then
        ID=$(tail -1 $db_name/$tb_name | cut -d':' -f1)
        auto_incremnt=$(($ID + 1))
    
        echo -n "$auto_incremnt:" >>$db_name/$tb_name
    else
        echo -n "1:" >>$db_name/$tb_name

    fi

   
    for i in $(seq 2 $colsNum); do

        fieldName=$(awk 'BEGIN{FS=":"}{if(NR == 1) print $'$i'}' $dbname/$metadata)

        colType=$(awk 'BEGIN{FS=":"}{if(NR == 2) print $'$i'}' $dbname/$metadata)
        read -p "Enter $fieldName To Insert Into It : " column_value


        if [ $i -eq $colsNum ]; then
            echo -n "$column_value" >>$db_name/$tb_name
        else
            echo -n "$column_value:" >>$db_name/$tb_name
        fi

    done
    echo >>$db_name/$tb_name

else
    echo "File Doesn't exist"
fi
./ connect_table.sh