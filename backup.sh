#!/bin/bash

# Load config file
source config.sh


echo -e "Starting backup...\n"
START_TIME=$(date +%s)

echo -e "Exporting database...\n"

DB_BACKUP_START=$(date +%s)
DATABASE_FILENAME=$DIR.sql
wp db export --add-drop-table --path=../$DIR $DATABASE_FILENAME
mv $DATABASE_FILENAME ~/bdwp-backup/tmp/
DATABASE_BACKUP_SIZE=`du -h ~/bdwp-backup/tmp/$DATABASE_FILENAME | cut -f1`
DB_BACKUP_END=$(date +%s)

echo -e "DB Export Time: $(($DB_BACKUP_END - $DB_BACKUP_START))s\n"
echo -e "DB Backup Size: $DATABASE_BACKUP_SIZE \n"

echo -e "Compressing wp-content directory...\n"
FILE_BACKUP_START=$(date +%s)
FILE_BACKUP_FILENAME=$DIR.$(date -d today "+%m-%d-%Y").tar.gz

#Effectively limits CPU usage
#tar -czf $BACKUP_FILENAME $DIR/wp-content/ --checkpoint=200 --checkpoint-action=sleep=2

#Straight up verbose tar command 
#tar cvzf ~/bdwp-backup/tmp/$BACKUP_FILENAME ~/$DIR/wp-content/

#Straight up tar command
tar czf ~/bdwp-backup/tmp/$FILE_BACKUP_FILENAME ~/$DIR/wp-content/
FILE_BACKUP_SIZE=`du -h ~/bdwp-backup/tmp/$FILE_BACKUP_FILENAME | cut -f1`
FILE_BACKUP_END=$(date +%s)

echo -e "File Backup Time: $(($FILE_BACKUP_END - $FILE_BACKUP_START))s\n"
echo -e "File Backup Size: $FILE_BACKUP_SIZE \n"

echo -e "Uploading to Dropbox...\n"
DB_UPLOAD_START=$(date +%s)
./dropbox_uploader.sh upload ~/bdwp-backup/tmp/$DATABASE_FILENAME /$DROPBOX_DIR/$(date -d today "+%m-%d-%Y")/$DATABASE_FILENAME
DB_UPLOAD_END=$(date +%s)
echo -e "DB Upload Time: $(($DB_UPLOAD_END - $DB_UPLOAD_START))s\n"

FILE_UPLOAD_START=$(date +%s)
./dropbox_uploader.sh upload ~/bdwp-backup/tmp/$FILE_BACKUP_FILENAME /$DROPBOX_DIR/$(date -d today "+%m-%d-%Y")/$FILE_BACKUP_FILENAME
FILE_UPLOAD_END=$(date +%s)
echo -e "DB Upload Time: $(($FILE_UPLOAD_END - $FILE_UPLOAD_START))s\n"

END_TIME=$(date +%s)

echo -e "Backup Complete!\n"

#Generate email 
./make-email.sh $DROPBOX_DIR $DIR $DATABASE_FILENAME $DATABASE_BACKUP_SIZE $FILE_BACKUP_FILENAME $FILE_BACKUP_SIZE > ~/bdwp-backup/tmp/output.html

#Send email
cat ~/bdwp-backup/tmp/output.html | mail \
-a "From: noreply@blazdesign.com" \
-a "MIME-Version: 1.0" \
-a "Content-Type: text/html" \
-s "$DIR Backup" \
$EMAIL_ADDRESS

#echo -e "Removing files...\n"
rm ~/bdwp-backup/tmp/*
