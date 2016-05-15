#Setup variables from arguments
DROPBOX_DIR=$1
DIR=$2
DATABASE_FILENAME=$3
FILE_BACKUP_FILENAME=$4
DATABASE_BACKUP_SIZE=$5
FILE_BACKUP_SIZE=$6

cat <<- _EOF_
    <HTML>
    	<head></head>
    	<body>
    	<table>
  	<tr>
    		<td><strong>Dropbox Directory:</strong></td>
    		<td>$DROPBOX_DIR</td>
  	</tr>
 	<tr>
    		<td><strong>WordPress Directory:</strong></td>
    		<td>$DIR</td>
  	</tr>
	<tr>
		<td><strong>Database Backup Filename:</strong></td>
		<td>$DATABASE_FILENAME</td>
	</tr>
	<tr>
		<td><strong>Database Backup Size:</strong></td>
		<td>$DATABASE_BACKUP_SIZE</td>
	</tr>
	<tr>
		<td><strong>File Backup Filename:</strong></td>
		<td>$FILE_BACKUP_FILENAME</td>
	</tr>
	<tr>
		<td><strong>File Backup Filesize:</strong></td>
		<td>$FILE_BACKUP_SIZE</td>
	</tr>
	</table>
	</body>
    </html>
_EOF_


