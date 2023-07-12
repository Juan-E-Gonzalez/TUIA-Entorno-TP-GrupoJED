#!/bin/bash

mkdir salida

cd ./salida

nombre_femenino=0
total_nombres_femeninos="total_nombres_femeninos.txt"
lista_personas="lista_personas.txt"
lista_personas_validas="lista_personas_validas.txt"

for imagen in ../imagenesGeneradas/*; do

    nombre="$(echo $imagen | rev | cut -d'/' -f1 | rev | sed 's/\.jpg$//')"
    primer_letra=${nombre:0:1}
    ultima_letra=${nombre: -1}  

    echo "$nombre" >> "$lista_personas"

    if [[ $primer_letra =~ [A-Z] ]]; then
            echo "$nombre" >> "$lista_personas_validas"
    fi
    
    if [[ $ultima_letra == "a" ]]; then
        echo "$nombre" >> "$archivo_personas"
        ((nombre_femenino++))
    fi

done

echo "Total de personas femeninas: $nombre_femenino" >> "$total_nombres_femeninos"

cd ..
mv ./imagenesGeneradas/* ./salida
zip salida salida/*

mv -f ./salida.zip ./comprimido
rm -r salida
echo "El archivo se comprimio con exito"