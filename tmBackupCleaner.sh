#!/bin/bash
pathToLatest=$(tmutil latestbackup)
backupDir=`dirname $pathToLatest`
latestBackup=`basename $pathToLatest`
# code before Big Sur
#$(tmutil latestbackup)
tmutil listbackups | while read backup; do
    if [[ "$backup" != "$latestBackup" ]]; then
        # Big Sur workaroung
        #echo tmutil delete -d /Volumes/TimeMachineWD -t "$backup"
        echo tmutil delete "$backupDir/$backup"
    fi
done
