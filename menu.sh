#!/usr/bin/bash

opcion=1
numero=1

while [[ $opcion =~ [1-9] ]]; do

    echo "1. Generar imagenes"
    echo "2. Descargar imagenes"
    echo "3. Procesar imagenes"
    echo "4. Comprimir imagenes"
    echo "5. Descomprimir imagenes"
    echo "9. Cerrar menu"

    read -p "ingrese una opcion: " opcion

            case $opcion in 
        1)
            read -p "ingrese la cantidad de imagenes que desea generar. 1 por defecto" numero
            bash generar.sh $numero
            ;;
        2)
            read "ingrese la ruta del archivo" $archivo
            read "ingrese la ruta del archivo de suma de verificacion" $suma_verificacion
            bash desacargar.sh $archivo $suma_verificacion
            ;;
        3)
            bash procesar.sh
            ;;
        4)
            bash comprimir.sh
            ;;
        5)  
            bash descomprimir.sh
            ;;
        9) 
            exit
            ;;
        *)
            echo -e "Opcion incorrecta, vuelva a seleccionar una opcion"
            ;;
        esac
    
done
exit 0