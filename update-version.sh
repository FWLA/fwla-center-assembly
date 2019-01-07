#!/bin/bash

VERS=$1

# Update fwla-center
cd fwla-center
./mvnw versions:set -DnewVersion=$VERS -DgenerateBackupPoms=false
git add -A
git commit -m "Update version to $VERS"
git push
cd ..

# Update fwla-center-admin
cd fwla-center-admin
jq '.version = $newVers' --arg newVers $VERS package.json > package.tmp.json && mv package.tmp.json package.json && rm package.tmp.json
git add -A
git commit -m "Update version to $VERS"
git push
cd ..

# Update fwla-center-display
cd fwla-center-display
jq '.version = $newVers' --arg newVers $VERS package.json > package.tmp.json && mv package.tmp.json package.json && rm package.tmp.json
git add -A
git commit -m "Update version to $VERS"
git push
cd ..
