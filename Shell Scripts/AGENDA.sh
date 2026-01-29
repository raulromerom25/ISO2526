#Raul Romero Mayoral
#29/01/2026
#Agenda funcional ejercicio entregable ISO
#!/bin/bash




FICHERO="agenda.txt"

touch $FICHERO

clear

while true; do
    echo "=============================================="
    echo "==============  MENU AGENDA  ================="
    echo "="
    echo "=          a) Añadir entrada                 ="
    echo "=          b) Buscar por DNI                 ="
    echo "=        c) Ver la agenda completa           ="
    echo "=      d) Eliminar todas las entradas        ="
    echo "=            e) Finalizar                    ="
    echo "=                                            ="
    echo "=============================================="
    echo "=============================================="
    echo -n "Elige una opción: "
    read opt

    case $opt in

        a)
            echo -n "Introduce DNI: "
            read dni

            if grep -q "^$dni:" $FICHERO; then
                echo "El DNI ya existe en la agenda"
            else
                echo -n "Introduce nombre: "
                read nombre
                echo -n "Introduce apellidos: "
                read apellidos
                echo -n "Introduce localidad: "
                read localidad

                echo "$dni:$nombre:$apellidos:$localidad" >> $FICHERO
                echo "Entrada añadida correctamente"
            fi
            ;;
        
        b)
            echo -n "Introduce DNI a buscar: "
            read dni

            linea=$(grep "^$dni:" $FICHERO)

            if [ -z $linea ]; then
                echo "DNI no encontrado"
            else
                nombre=$(echo $linea | cut -d: -f2)
                apellidos=$(echo $linea | cut -d: -f3)
                localidad=$(echo $linea | cut -d: -f4)

                echo "La persona con DNI número $dni es: $nombre $apellidos, y vive en $localidad"
            fi
            ;;
        
        c)
            if [ ! -s $FICHERO ]; then
                echo "Agenda vacía"
            else
                cat $FICHERO
            fi
            ;;
        
        d)
            > $FICHERO
            echo "Agenda eliminada"
            ;;
        
        e)
            break
            ;;
        
        *)
            echo "Opción no válida"
            ;;
    esac

    echo
    read -p "Pulsa ENTER para continuar..."
    clear
done
