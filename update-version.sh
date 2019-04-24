#!/bin/bash

set -u
set -e

VERS=$1

git submodule foreach git pull

# Update fwla-center
cd fwla-center
./mvnw versions:set -DnewVersion=$VERS -DgenerateBackupPoms=false
sed -i -E "s/^(ARG JAR_FILE=target\/fwla-center-).*(.jar).*$/\1$VERS\2/" Dockerfile
cd ..

# Update fwla-center-admin
cd fwla-center-admin
jq '.version = $newVers' --arg newVers $VERS package.json > package.tmp.json && mv package.tmp.json package.json
cd ..

# Update fwla-center-display
cd fwla-center-display
jq '.version = $newVers' --arg newVers $VERS package.json > package.tmp.json && mv package.tmp.json package.json
cd ..

# Update fwla-center-map
cd fwla-center-map
jq '.version = $newVers' --arg newVers $VERS package.json > package.tmp.json && mv package.tmp.json package.json
cd ..

git submodule foreach git add -A
git submodule foreach git commit -m "Update version to $VERS"
git submodule foreach git push
