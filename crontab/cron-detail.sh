###########################################
#* * * * * <script>
#| | | | |    \-Scrip duoc su dung khi cron kich hoat
#| | | | \Ngay trong tuan: 0-7
#| | | \Thang trong nam: 1-12
#| | \Ngay trong thang: 1-31
#| \Gio trong ngay: 1-24
#\Phut trong gio: 1-59
#Script nay duoc day vao "crontab -e"
#
#Bat dau 1 backup script:
#! /bin/bash
# Copyright (C)QWERTY: tinhcx@gmail.com
# Version 01| LastUpdated: 8:55 12/01/2015
###########################################
#nano /opt/script/bk-web+db/bk-web-manga247.com.sh
#chmod +x /opt/script/bk-web+db/bk-web-manga247.com.sh
#echo "">/opt/script/bk-web+db/bk-web-manga247.com.sh
#/opt/script/bk-web+db/bk-web-manga247.com.sh &>output
###########################################
STARTED_BACKUP_TIME="$(date +'%Y.%m.%d-%H.%M.%S')"

#DATA_TYPE=web|db|file|folder|lamp|...
DATA_TYPE=web

DATA_SOURCE_NAME=manga247.com
DATA_ON_SERVER=$DATA_SOURCE_NAME

DATA_FILE_FULL_NAME=$DATA_SOURCE_NAME-$DATA_TYPE-${STARTED_BACKUP_TIME}.tar.gz

STORAGE_DEST=/opt/bk-data
STORAGE_SOURCE=/opt/www
echo "------------------------------------------------------------------[$DATA_TYPE: $DATA_SOURCE_NAME]"
echo "#Backup at [$STARTED_BACKUP_TIME] | Starting...."
cd $STORAGE_SOURCE
tar -cf $DATA_FILE_FULL_NAME $DATA_ON_SERVER
mv $DATA_FILE_FULL_NAME $STORAGE_DEST
cd $STORAGE_DEST
FINISHED_BACKUP_TIME="$(date +'%Y.%m.%d-%H.%M.%S')"
echo "#Backup at [$FINISHED_BACKUP_TIME] | Done"
echo "Result: " "$(pwd)"
echo "$(ls -lh $DATA_FILE_FULL_NAME)"
echo "------------------------------------------------------------------"
