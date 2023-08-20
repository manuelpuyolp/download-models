#!/bin/bash

rm -rf data 2>/dev/null
docker rm -f clamav 2>/dev/null
docker volume rm clamav-volumen 2>/dev/null

mkdir data
cd data
curl --remote-name $1

# see https://docs.docker.com/engine/security/trust/
export DOCKER_CONTENT_TRUST=1

chmod -R a+r .
docker volume create clamav-volumen
docker run --name clamav -d -v clamav-volumen:/data clamav/clamav
docker cp * clamav:/data
rm * -rf
docker exec clamav clamscan -r /data >result.txt
echo ============================================================
cat result.txt
echo ============================================================

docker rm -f clamav
docker volume rm clamav-volumen

# see https://docs.docker.com/engine/security/trust/
export DOCKER_CONTENT_TRUST=0

cd ..
cd ..
rm -rf download-models 2>/dev/null


