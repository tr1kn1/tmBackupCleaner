#!/bin/bash
pathToLatest=$(tmutil latestbackup -m)
backupDir=`dirname $pathToLatest`
latestBackup=`basename $pathToLatest`
hardDriveMountPoint=`echo $backupDir | sed 's/\/Backups\.backupdb.*//g'`


echo -e "The mount point for the connected TimeMachine drive:\n$hardDriveMountPoint\n"
echo -e "Path to backups on the connected TimeMachine device:\n$backupDir\n"
echo -e "List of available backups:\n$(tmutil listbackups)\n"
echo -e "Latest backup, which is not deleted:\n$latestBackup\n"
echo -e "Start deleting older backups, this can take a lot of time."

tmutil listbackups | while read backup; do
    if [[ "$backup" != "$latestBackup" ]]; then
        # Remove 'echo' on the next line only, when the output of the dry run is correct!
        echo tmutil delete -d "$hardDriveMountPoint" -t "$backup"
    fi
done

echo -e "\nDone, exiting now."
