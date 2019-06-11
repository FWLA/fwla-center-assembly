#!/bin/bash

set -e
set -u

source ./readenv.sh

sudo docker exec -t fwla-center-postgres pg_dump -b -c -d $POSTGRES_DB -U $POSTGRES_USERNAME > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
