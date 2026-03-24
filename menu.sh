#!/bin/bash

if [ -z "$FILENAME" ]; then
    echo "Error: debe definir la variable de entorno FILENAME"
    exit 1
fi

mostrar_menu(){
    opcion=0
    while (( opcion != 6 )); do
        echo
        echo "Opcion 1) Crear entorno"
        echo "Opcion 2) Correr proceso"
        echo "Opcion 3) Mostrar el listado de alumnos ordenados por padron"
        echo "Opcion 4) Mostrar el listado de alumnos con las 10 notas mas altas"
        echo "Opcion 5) Buscar un alumno por padron y mostrar"
        echo "Opcion 6) Salir"
        echo 

        read -p "A continuacion ingrese una opcion: " opcion
        echo

        case $opcion in
            1)  
                echo "Creando entorno..."

                BASE="$HOME/EPNro1"

                if [ -d "$BASE" ]; then
                    echo "El entorno ya existe en $BASE"
                else
                    mkdir -p "$BASE/entrada" "$BASE/salida" "$BASE/procesado"

                    if [ $? -eq 0 ]; then
                        echo "Entorno creado correctamente en $BASE"
                    else
                        echo "Error al crear el entorno"
                    fi
                fi
                ;;

            2)
                echo "Corriendo proceso..."
                BASE="$HOME/EPNro1"
                if [ -d "$BASE" ] ; then
                    cp consolidar.sh "$BASE/"
                    chmod +x "$BASE/consolidar.sh"
                    "$BASE/consolidar.sh" &
                else
                    echo "error, primero debes seleccionar la opcion 1"
                fi
                ;;
    
            3)
                echo "Alumnos ordenados por padron:"
                archivo="$HOME/EPNro1/salida/$FILENAME.txt"
                if [ -f "$archivo" ] ; then 
                    echo "Lista de alumnos: "
                    sort -n "$archivo"
                else
                    echo "Error el archivo requerido no existe"
                fi
                ;;

            4)
                echo "Top 10 alumnos con notas mas altas:"
                ;;

            5)
                echo "Buscar un alumno por padron:"
                ;;

            6)
                echo "Saliendo..."
                ;;

            *)
                echo "Opción no válida"
                ;;
        esac
    done
}

mostrar_menu 
