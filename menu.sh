#!/bin/bash

PROCESO_PID=""
BASE="$HOME/EPNro1"
PID_FILE="$BASE/proceso.pid"
BORRAR_ENTORNO=false

for arg in "$@"; do
    if [ "$arg" == "-d" ]; then
        BORRAR_ENTORNO=true
    else
        FILENAME="$arg"
    fi
done

if [ -z "$FILENAME" ]; then
    echo "Error: debe pasar el nombre del archivo como parámetro"
    echo "Uso: ./menu.sh <nombre_archivo> [-d]"
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

                if [ ! -d "$BASE" ]; then
                    echo "Error: primero debe crear el entorno (opción 1)"
                else
                    if [ -f "$PID_FILE" ]; then
                        PID=$(cat "$PID_FILE")

                        if ps -p $PID > /dev/null 2>&1; then
                            echo "Ya hay un proceso en ejecución (PID $PID)."
                        else
                            echo "El PID guardado no está activo. Se iniciará uno nuevo."
                            rm -f "$PID_FILE"
                        fi
                    fi

                    if [ ! -f "$PID_FILE" ]; then
                        cp consolidar.sh "$BASE/"
                        chmod +x "$BASE/consolidar.sh"

                        FILENAME="$FILENAME" "$BASE/consolidar.sh" &
                        PROCESO_PID=$!

                        echo $PROCESO_PID > "$PID_FILE"

                        echo "Proceso iniciado con PID $PROCESO_PID"
                    fi
                fi
                ;;
    
            3)
                echo "Alumnos ordenados por padron:"
                archivo="$HOME/EPNro1/salida/$FILENAME.txt"

                if [ -d "$BASE" ]; then
                    if [ -f "$archivo" ] ; then 
                        echo "Lista de alumnos: "
                        sort -n "$archivo"
                    else
                        echo "Error: el archivo no existe. Ejecute la opción 2 primero."
                    fi
                else
                    echo "No existe el entorno, ejecute la opción 1 primero."
                fi
                ;;

            4)
                echo "Top 10 alumnos con mejores notas:"
                archivo="$BASE/salida/$FILENAME.txt"

                if [ -d "$BASE" ]; then
                    if [ -f "$archivo" ]; then
                        sort -t',' -k4,4nr "$archivo" | head -n 10
                    else
                        echo "No existe el archivo, ejecute la opción 2 primero."
                    fi
                else
                    echo "No existe el entorno, ejecute la opción 1 primero."
                fi
                ;;

            5)
                echo "Buscar alumno por padrón:"
                archivo="$BASE/salida/$FILENAME.txt"

                if [ -d "$BASE" ]; then
                    if [ -f "$archivo" ]; then
                        read -p "Ingrese padrón: " padron
                        resultado=$(grep "^$padron," "$archivo")

                        if [ -n "$resultado" ]; then
                            echo
                            echo "Alumno encontrado:"
                            echo "$resultado"
                        else
                            echo "No se encontró ningún alumno con ese padrón."
                        fi
                    else
                        echo "No existe el archivo, ejecute la opción 2 primero."
                    fi
                else
                    echo "No existe el entorno, ejecute la opción 1 primero."
                fi
                ;;

            6)
                echo "Saliendo..."

                if [ "$BORRAR_ENTORNO" = true ]; then
                    echo "Borrando entorno..."

                    if [ -d "$BASE" ]; then

                        if [ -f "$PID_FILE" ]; then
                            PID=$(cat "$PID_FILE")

                            if ps -p $PID > /dev/null 2>&1; then
                                kill -TERM $PID
                                echo "Proceso detenido (PID $PID)."
                            else
                                echo "El proceso ya no estaba en ejecución."
                            fi

                            rm -f "$PID_FILE"
                        else
                            echo "No hay PID registrado."
                        fi

                        rm -rf "$BASE"
                        echo "Entorno borrado."

                    else
                        echo "No existe entorno para borrar."
                    fi
                fi

                exit 0
                ;;

            *)
                echo "Opción no válida"
                ;;
        esac
    done
}

mostrar_menu 
