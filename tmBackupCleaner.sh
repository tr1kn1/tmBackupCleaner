#!/bin/bash
latest=$(tmutil latestbackup)
year="2020"
tmutil listbackups | while read backup; do
    if [[ "$backup" != "$latest" ]] && [[ "$backup" != *"${year}-08"* ]] && [[ "$backup" != *"$year"-06* ]] && [[ "$backup" != *"$year"-03* ]] && [[ "$backup" != *"$year"-02* ]]; then
        echo tmutil delete "$backup"
    fi
done
