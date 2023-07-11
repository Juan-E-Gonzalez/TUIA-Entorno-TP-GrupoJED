#!/usr/bin/bash

[ ! $# -eq 2 ] && exit 1

IMAGENES="$1"
SUMAVERIFICACION="$2"
SUMAIMAGENES="$(sha256sum "$IMAGENES" | cut -d " " -f 1)"

if [ "$SUMAIMAGENES" == "$(cat $SUMAVERIFICACION)" ]; then
    unzip "$IMAGENES"
    echo "Las imagenes se descomprimido con exito"
    exit 0
else
    echo "La suma de verificacion es incorrecta"
    exit 2
fi