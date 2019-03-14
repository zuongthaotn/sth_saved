#!/bin/bash
# ================================================================== #
# Backup a website script
# ================================================================== #
# Copyright (c) 2019 Zuongthao
# This script is a private licensed version
# ================================================================== #
#
#
#
# ================================================================== #
#          Define system specific details in this section            #
# ================================================================== #
#
#	Tao thu muc backup
#	Backup database
#	Copy cac thu muc code
#	Zip thu backup
# ================================================================== #
# 
echo "------------------------------------------------------------------"
#
#
CODEFOLDER='ivalue.local/'
BACKUPFOLDER='magnus_backup'
HOSTNAME='localhost'
MYSQLUSER='magento'
MYSQLPW='magento'
DB='magento'
# ================================================================== #
# ----Tao thu muc backup-----#
#
echo "...Start copying magento source code"
mkdir $BACKUPFOLDER
cp -a $CODEFOLDER"/app" $BACKUPFOLDER
cp -a $CODEFOLDER"/bin" $BACKUPFOLDER
cp -a $CODEFOLDER"/dev" $BACKUPFOLDER
cp -a $CODEFOLDER"/lib" $BACKUPFOLDER
cp -a $CODEFOLDER"/phpserver" $BACKUPFOLDER
cp -a $CODEFOLDER"/setup" $BACKUPFOLDER
cp -a $CODEFOLDER"/update" $BACKUPFOLDER
cp -a $CODEFOLDER"/vendor" $BACKUPFOLDER
echo "...Done copying magento source code"
#
cd $BACKUPFOLDER
#
echo "...Start backup mysql database"
if ( mysqldump --user="$MYSQLUSER" --password="$MYSQLPW" $DB > $DB"_backup.sql" ) ; then
echo "...Done backup database"
fi
#
cd ..
#
echo "Starting compressing folder"
zip -r $BACKUPFOLDER".zip" $BACKUPFOLDER
echo "--------------------Everything is Done!!!!---------------------------"

