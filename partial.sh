#!/bin/bash

parametros="https://huggingface.co/Helsinki-NLP/opus-mt-en-es/resolve/main/config.json 
https://huggingface.co/Helsinki-NLP/opus-mt-en-es/resolve/main/tokenizer_config.json
https://huggingface.co/Helsinki-NLP/opus-mt-en-es/resolve/main/vocab.json"


chmod -R a+r .
chmod -R a+r ./donwlod-pieces.sh
chmod +x    ./donwlod-pieces.sh

# ./donwlod-pieces.sh $Ficheros

echo $Ficheros >datos.dat
echo -------------------------------------------
ls -la 
cat datos.dat
