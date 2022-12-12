#!/bin/bash

echo "--------------------list table------------------------"

echo "this is all table that exist here"
read -p "enter database you want to list in table :" db_name
    ls $db_name

. ./ connectdb.sh