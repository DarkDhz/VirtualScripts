#!/bin/bash
echo "Realizando copia de seguridad"
folder=$1
dir_name=${folder##/}
if [  ! -d "/home/virtual/backup/$dir_name" ]
then
	mkdir "/home/virtual/backup/$dir_name"
fi
day=$(date | awk '{print $3}' )
month=$(date | awk '{print $2}' )
year=$(date | awk '{print $6}' )
tar cf - $folder | pigz > /home/virtual/backup/$dir_name/$dir_name-$day-$month-$year.tar.gz

