#!/usr/bin/bash

if [[ ! $1 =~ ^[0-9]+$ ]]; then
    echo $1
    echo "No se indico un numero valido";
    exit 1;
fi;

mkdir -p imagenesGeneradas
IMAGENES=0
while [[ $IMAGENES < $1 ]]; do
    ((IMAGENES++))
    NOMBRE=$(sort -R listaNombres.csv |  tail -n 1 | cut -d "," -f "1" | cut -d " " -f "1")
    NOMBREARCHIVO="${NOMBRE^}.jpg"
    wget -O "$NOMBREARCHIVO" https://source.unsplash.com/random/900%C3%97700/?person
    mv "$NOMBREARCHIVO" ./imagenesGeneradas
    echo "Imagen $NOMBREARCHIVO generada!"
    sleep 1
done
zip imagenes_Generadas imagenesGeneradas/*.jpg
echo $(sha256sum imagenes_Generadas.zip)>sumimagenesGeneradas
rm -r imagenesGeneradas
exit 0

