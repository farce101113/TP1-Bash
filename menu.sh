#!/bin/bash


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

                ;;

            2)
                echo "Corriendo proceso..."

                ;;
    
            3)
                echo "Alumnos ordenados por padron:"

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

mostrar_menu $opcion
