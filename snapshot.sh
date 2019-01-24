#!/bin/bash

git submodule foreach git pull

cd fwla-center
./mvnw clean install
docker build -t ihrigb/fwla-center:latest .
cd ..

cd fwla-center-admin
npm install
npm run build
docker build -t ihrigb/fwla-center-admin:latest .
cd ..

cd fwla-center-display
npm install
ng build --prod --base-href=/display/
docker build -t ihrigb/fwla-center-display:latest .
cd ..

cd fwla-center-map
npm install
ng build --prod --base-href=/map/
docker build -t ihrigb/fwla-center-map:latest .
cd ..
