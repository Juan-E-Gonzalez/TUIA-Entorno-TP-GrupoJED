#!/usr/bin/bash

cd imagenesGeneradas

for imagen in *; do

    
    if [[ "${imagen%.jpg}" =~ ^[A-Z][a-z]+$ ]]; then
        convert "$imagen" -gravity center -resize 512x512+0+0 \-extent 512x512 "$imagen"
        echo "$imagen fue procesada con exito"
    else
        echo "$imagen no fue procesada"
    fi

done

echo "imagenes procesadas con exito"
cd ../
exit 0