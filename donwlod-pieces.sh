#!/bin/bash


rm data -rf 2>/dev/null
mkdir data
cd data
# curl --remote-name $1



# Utiliza un bucle for para recorrer cada línea de los parámetros
#!/bin/bash

archivo="datos.dat" # Nombre del archivo

while IFS= read -r linea; do
    # Realiza aquí la acción que desees con la línea
    echo "Línea leída: $linea"
    curl --remote-name $linea
done < "../$archivo"

cd ..