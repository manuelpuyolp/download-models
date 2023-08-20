#!/bin/bash



# mkdir data
# cd data
# curl --remote-name $1

# Verifica si se proporcionó al menos un argumento
if [ $# -lt 1 ]; then
    echo "Uso: $0 <parametros>"
    exit 1
fi


# Utiliza un bucle for para recorrer cada línea de los parámetros
while IFS= read -r comando; do
    # Ejecuta el comando
    echo "Ejecutando comando: $comando"
    # eval "$comando"
done <<< "$1"


cd ..