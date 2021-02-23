#!/bin/sh
for var in "$@"
do
    result=$(supervisorctl status | grep "$var" | awk '{print $2}')
    if [[ $result == "EXITED" ]]; then
        exit 1
    fi
done
exit 0