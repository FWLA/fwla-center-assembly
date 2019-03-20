#!/bin/bash

relVers=$1
nextVers=$2

/bin/bash ./update-version.sh $relVers

cd fwla-center
./mvnw clean install
docker build -t ihrigb/fwla-center:latest -t ihrigb/fwla-center:$relVers --build-arg JAR_FILE=target/fwla-center-$relVers.jar .
cd ..

cd fwla-center-admin
npm install
npm run build
docker build -t ihrigb/fwla-center-admin:latest -t ihrigb/fwla-center-admin:$relVers .
cd ..

cd fwla-center-display
npm install
ng build --prod --base-href=/display/
docker build -t ihrigb/fwla-center-display:latest -t ihrigb/fwla-center-display:$relVers .
cd ..

cd fwla-center-map
npm install
ng build --prod --base-href=/map/
docker build -t ihrigb/fwla-center-map:latest -t ihrigb/fwla-center-map:$relVers .
cd ..

if [ -f .githubapikey ]; then
    API_KEY="`cat .githubapikey`"
    API_JSON=$(printf '{"tag_name": "v%s","target_commitish": "master","name": "v%s","body": "Release of version %s","draft": false,"prerelease": true}' $relVers $relVers $relVers)
    curl --data "$API_JSON" https://api.github.com/repos/FWLA/fwla-center/releases?access_token=$API_KEY
    curl --data "$API_JSON" https://api.github.com/repos/FWLA/fwla-center-admin/releases?access_token=$API_KEY
    curl --data "$API_JSON" https://api.github.com/repos/FWLA/fwla-center-display/releases?access_token=$API_KEY
    curl --data "$API_JSON" https://api.github.com/repos/FWLA/fwla-center-map/releases?access_token=$API_KEY
fi

docker push ihrigb/fwla-center:latest
docker push ihrigb/fwla-center-admin:latest
docker push ihrigb/fwla-center-display:latest
docker push ihrigb/fwla-center-map:latest
docker push ihrigb/fwla-center:$relVers
docker push ihrigb/fwla-center-admin:$relVers
docker push ihrigb/fwla-center-display:$relVers
docker push ihrigb/fwla-center-map:$relVers

/bin/bash ./update-version.sh $nextVers

git add -A
git commit -m "Released $relVers."
git push
