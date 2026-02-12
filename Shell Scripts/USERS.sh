#Raul Romero Mayoral
#12/02/2026

#!/bin/bash

clear

BASE_UID=1000

if [ -n $1 ]; then
    BASE_UID=$1
fi

FECHA=$(date "+%d-%m-%Y")
HORA=$(date "+%H:%M")
USUARIO=$(whoami)

CONTADOR=0

echo "======================================================="
echo "Informe de usuarios el día $FECHA a las $HORA"

while IFS=: read -r usuario pass uid gid desc home shell
do
    if [ $uid -gt $BASE_UID ]; then
        echo "$usuario – $uid"
        CONTADOR=$((CONTADOR + 1))
    fi
done < /etc/passwd

echo "Total: $CONTADOR usuarios"
echo "======================================================="

echo "$FECHA – $HORA – El usuario $USUARIO ha solicitado un informe de usuarios" >> /tmp/logeventos
