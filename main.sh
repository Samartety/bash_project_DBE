#!/bin/bash 
echo "------------------------------hello from my DBMS------------------------------------"

select dbs in createdb listdb connectdb dropdb Exit
do 
case $dbs in 
	"createdb" )
	

	;;
	"listdb" )
		

	;;
	"connectdb" )
	
	;;
	"dropbd" ) 


		
	;;
	"Exit" )
	
	;;
	* )
esac 
done