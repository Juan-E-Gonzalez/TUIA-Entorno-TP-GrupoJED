#!/usr/bin/bash


mkdir -p imagenesGeneradas
IMAGENES=0
while [[ $IMAGENES < $@ ]]; do
    NOMBRE=$(sort -R listaNombres.csv |  tail -n 1 | cut -d "," -f "1" | cut -d " " -f "1")
    NOMBREARCHIVO="${NOMBRE^}"
    wget https://source.unsplash.com/random/900%C3%97700/?person -O ./imagenesGeneradas/$NOMBREARCHIVO
    sleep 1s
    ((i++))
done
zip -r imagenesGeneradas.zip imagenesGeneradas
echo $(sha256sum imagenesGeneradas.zip)>sumimagenesGeneradas
rm -r imagenesGeneradas
exit 0

