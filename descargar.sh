#!/usr/bin/bash

[ ! $# -eq 2 ] && exit 1
wget "$1" -O ./"imagenes_Generadas.zip"
SUMAVERIFICACION=$(wget "$2" -O ./sumaVerificacion && cat sumaVerificacion | cut -d " " -f "1")
SUMAIMAGENES=$(sha256sum ./"imagenes_Generadas.zip" | cut -d " " -f "1")

if [ "$SUMAIMAGENES" == "$SUMAVERIFICACION" ]; then
    echo "La suma verificacion es correcta"
    exit 0
else
    echo "Imagen: $SUMAIMAGENES"
    echo "SumaV: $SUMAVERIFICACION"
    echo "La suma verificacion es incorrecta"
    exit 2
fi