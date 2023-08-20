#!/bin/bash

rm -rf data 2>/dev/null
docker rm -f clamav 2>/dev/null
docker volume rm clamav-volumen 2>/dev/null

mkdir data
cd data
curl --remote-name $1

chmod -R a+r .
# sh "chmod -R a+r \$(pwd)/datos.dat"
docker volume create clamav-volumen
docker run --name clamav -d -v clamav-volumen:/data clamav/clamav
docker cp * clamav:/data
rm * -rf
docker exec clamav clamscan -r /data >result.txt
echo ============================================================
cat result.txt
echo ============================================================

docker rm -f clamav
docker volume rm nombre-volumen

cd ..
cd ..
rm -rf download-models 2>/dev/null