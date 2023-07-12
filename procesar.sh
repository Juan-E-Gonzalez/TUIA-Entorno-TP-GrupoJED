#!/usr/bin/bash

cd imagenesGeneradas

for imagen in *; do
    echo "$imagen esta siendo procesada"
    if [[ "${imagen%.jpg}" =~ ^[A-Z][a-z]+$ ]]; then
        convert "$imagen" -gravity center -resize 512x512+0+0 \-extent 512x512 "$imagen"
    fi

done

echo "imagenes procesadas con exito"
cd ../
exit 0