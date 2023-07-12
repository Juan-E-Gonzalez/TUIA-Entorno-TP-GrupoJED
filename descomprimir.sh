#!/usr/bin/bash

if [[ -e ./"imagenes_Generadas.zip" ]]; then
	unzip ./"imagenes_Generadas.zip"
    rm  ./imagenes_Generadas.zip
	echo "El archivo se descomprimio con exito"
	exit 0
else
	echo "No se pudo descomprimir el archivo imagenes_Generadas.zip"
	exit 1
fi