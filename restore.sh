#!/bin/bash

set -e
set -u

source ./readenv.sh

if [ -f $1 ]
then
    echo "Restoring $1"
    cat $1 | sudo docker exec -i fwla-center-postgres psql -U $POSTGRES_USER
else
    echo "File $1 does not exist."
fi
