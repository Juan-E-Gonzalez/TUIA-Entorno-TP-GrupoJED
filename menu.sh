opcion=0

while [[ $opcion =~ [1-9] ]]; do

    echo "1. Generar imagenes"
    echo "2. Descargar imagenes"
    echo "3. Procesar imagenes"
    echo "4. Comprimir imagenes"
    echo "9. Cerrar menu"

    read -p "ingrese una opcion: " opcion
    
done
exit 0