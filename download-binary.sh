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
# sh "docker exec clamav clamscan -r /data >result.txt"
# sh "echo ============================================================"
# sh "cat result.txt"
# sh "echo ============================================================"

#  try{
#     sh "docker rm -f clamav "
# } catch(Exception e) {
#     echo "Error al eliminar el contenedor clamav: $e"
# }

# try{
#     sh "docker volume rm nombre-volumen"
# } catch(Exception e) {
#     echo "Error al eliminar el volumen: $e"
# }

