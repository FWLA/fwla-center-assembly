#!/bin/bash

set -e
set -u

file="./.env"

if [ -a "$file" ]
then
    while IFS='=' read -r key value
    do
        key=$(echo $key | tr '.' '_')
        eval ${key}=\${value}
    done < "$file"
else
    echo "$file file does not exist."
fi
