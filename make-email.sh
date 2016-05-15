#!/bin/bash

cat <<- _EOF_
    <HTML>
    	<head></head>
    	<body>
    	<table>
  	<tr>
    	<td><strong>Dropbox Directory:</strong></td>
    	<td>$1</td>
  	</tr>
 	<tr>
    	<td><strong>WordPress Directory:</strong></td>
    	<td>$2</td>
  	</tr>
	<tr>
		<td><strong>Database Backup Filename:</strong></td>
		<td>$3</td>
	</tr>
	<tr>
		<td><strong>Database Backup Size:</strong></td>
		<td>$4</td>
	</tr>
	<tr>
		<td><strong>File Backup Filename:</strong></td>
		<td>$5</td>
	</tr>
	<tr>
		<td><strong>File Backup Filesize:</strong></td>
		<td>$6</td>
	</tr>
	</table>
	</body>
    </html>
_EOF_


