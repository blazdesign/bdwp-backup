#!/bin/bash

rm /tmp/backup.log

# Pipe the results of the script to the mail file
~/bdwp-backup/backup.sh >> /tmp/backup.log
# Finish the mail file
echo "." >> /tmp/backup.log
echo >> /tmp/backup.log
# Mail it
cat /tmp/backup.log | mail \
-a "From: noreply@blazdesign.com" \
-a "MIME-Version: 1.0" \
-a "Content-Type: text/html" \
-s "Automated Backup" \
coreyblaz@gmail.com
