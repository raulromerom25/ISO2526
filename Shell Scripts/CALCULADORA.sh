#Raul Romero Mayoral
#05/02/2026
#Entregable calculadora

#!/bin/bash


clear


echo "Autor: Raúl Romero"
echo

read -p "Número máximo de operaciones: " MAX

if ! [[ "$MAX" =~ ^[0-9]+$ ]]; then
    echo "Error: Debe ser un número."
    exit 1
fi

CONT=0

echo
echo "S = Sumar"
echo "R = Restar"
echo "M = Multiplicar"
echo "D = Dividir"
echo "X = Salir"
echo

while [ $CONT -lt $MAX ]; do

    echo -n "Operación (S/R/M/D/X): "
    read OP

    if [ "$OP" = "X" ]; then
        echo "Fin del programa."
        break
    fi

    if [[ "$OP" != "S" && "$OP" != "R" && "$OP" != "M" && "$OP" != "D" ]]; then
        echo "Operación no válida."
        continue
    fi

    read -p "Primer número: " A
    read -p "Segundo número: " B

    if ! [ "$A" -eq "$A" ] 2>/dev/null || ! [ "$B" -eq "$B" ] 2>/dev/null; then

        echo "Error: Deben ser números enteros."
        continue
    fi

    case $OP in
        S)
            RES=$((A + B))
            ;;
        R)
            RES=$((A - B))
            ;;
        M)
            RES=$((A * B))
            ;;
        D)
            if [ $B -eq 0 ]; then
                echo "Error: División entre 0"
                continue
            fi
            RES=$((A / B))
            ;;
    esac

    echo "Resultado: $RES"

    CONT=$((CONT + 1))

    echo "Operaciones usadas: $CONT / $MAX"

done

echo
echo "Programa finalizado."



