# tmBackupCleaner

A simple script to delete all Time Machine Backups, except the latest.

## How does it work?
Time Machine is macOS' built-in backup utility. Normally it just works out of the box, but in some cases it refuses to delete old backups in order to make place for a new one.

If this should happen, this script can help: It deletes all backups except the latest one. To achieve this, it uses the tmutil command provided by Apple.

This script can also be used when just the latest backup and not a whole history is needed.

## Usage
Perform a run of this script and if the output is correct!
Only then: Remove the `echo` from the corresponding line. The deletion can take up to several days, depending on the number and size of the backups.

## Disclaimer

This script is provided with the exclusion of any liability. Each user is responsible for erroneously deleted backups.
