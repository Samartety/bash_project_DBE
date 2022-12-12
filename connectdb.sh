#!/bin/bash

echo "-------------------------------connect to database---------------------------"

read -p "enter db_name to connect :" db_name
	
    if [[ -d $db_name ]]; then
		cd $db_name 
		echo "you are connected $db_name" 
		
        select name in createtb listtb droptb insertintotb selectfromtb deletefromtb updatetb
		do
		    case $name in
            "createtb" ) 
                . ./ create_table.sh
            ;;    
            "listtb" )
                . ./ list_table.sh
            ;;    
            "droptb" )
                . ./ drop_table.sh
            ;;
            "insertintotb" )
                . ./ insert_into_table.sh

            ;;
            "selectfromtb" )
                . ./ select_from_table.sh
            ;;
            "deletefromtb" )
                . ./ delete_from_table.sh

            ;;
            "updatetb" )
                . ./ update_table.sh        
            ;;
            * )
            esac
        done
    else
		echo "disconnect database" 

    fi 
    . main.sh