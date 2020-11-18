#!/bin/bash
latest=$(tmutil latestbackup)
tmutil listbackups | while read backup; do
    if [[ "$backup" != "$latest" ]]; then
        tmutil delete "$backup"
    fi
done
