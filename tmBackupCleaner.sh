#!/bin/bash
pathToLatest=$(tmutil latestbackup)
backupDir=`dirname $pathToLatest`
latestBackup=`basename $pathToLatest`

echo -e "Path to backups on the connected TimeMachine device:\n$backupDir\n"
echo -e "List of available backups:\n$(tmutil listbackups)\n"
echo -e "Latest backup, which is not deleted:\n$latestBackup\n"
echo -e "Start deleting older backups, this can take a lot of time."

tmutil listbackups | while read backup; do
    if [[ "$backup" != "$latestBackup" ]]; then
        echo tmutil delete "$backupDir/$backup"
    fi
done

echo -e "\nDone, exiting now."
