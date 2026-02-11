#Raul Romero Mayoral
#10/02/26

#!/bin/bash

clear

SALIDA=$1
DIRECTORIO=$2
CONTADOR=0


comprobar_parametros() {

    if [ $# -ne 2 ]; then
        echo "Error: Debes indicar exactamente 2 parámetros."
        exit 1
    fi

    if [ -e $SALIDA ]; then
        echo "Error: El fichero de salida ya existe."
        exit 1
    fi

    if [ ! -d $DIRECTORIO ]; then
        echo "Error: El directorio no existe."
        exit 1
    fi

    if [ -z $(ls -A $DIRECTORIO) ]; then
        echo "Error: El directorio está vacío."
        exit 1
    fi
}


mostrar_autor() {
    echo "Autor: Raúl Romero"
    echo
}


crear_fichero_q() {

    FICHERO=$1

    PALABRAS=$(wc -w < $FICHERO)

    NUEVO=$FICHERO.q

    echo "El fichero original tiene $PALABRAS palabras" > $NUEVO
    cat $FICHERO >> $NUEVO
}


procesar_ficheros() {

    > $SALIDA

    for FICHERO in $DIRECTORIO/*.txt
    do
        if [ ! -f $FICHERO ]; then
            continue
        fi

        LINEAS=$(wc -l < $FICHERO)

        if [ $LINEAS -ge 5 ]; then

            NOMBRE=$(basename $FICHERO)

            echo $NOMBRE
            echo $NOMBRE >> $SALIDA

            ((CONTADOR++))

            crear_fichero_q $FICHERO

        fi
    done
}


escribir_total() {
    echo "Total de ficheros: $CONTADOR" >> $SALIDA
}



comprobar_parametros $@
mostrar_autor
procesar_ficheros
escribir_total

