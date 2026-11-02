#!/usr/bin/env bash

set -Eeuo pipefail

FECHA=$(date +%Y-%m-%d_%H-%M)
DIR_RESPALDO="/tmp/respaldo"
LOG_FILE="/tmp/mantenimiento.log"
TMP_ERR="/tmp/tar_error.txt"
RESULTADO=0

manejar_errores(){
	echo "[Alerta] El script fallo en la linea $1"
	if [ -s "$TMP_ERR" ]; then
		echo "Motivo por el cual falla: "
		cat "$TMP_ERR"
	fi
}

if mkdir -p "$DIR_RESPALDO"; then
	echo "La carpeta de respaldo fue creada (o ya existia) en $DIR_RESPALDO" 
else
	echo "[Error] La carpeta no pudo ser creada por falta de permisos"
fi

trap 'manejar_errores $LINENO' ERR

tar -czf "$DIR_RESPALDO/sitio_$FECHA.tar.gz" -C /var/www html 2>"$TMP_ERR" || RESULTADO=$?

case $RESULTADO in
	0)
	  echo "[Exito] El respaldo se creo en $DIR_RESPALDO"
	  ;;
	1)
	 echo "[Advertencia] Algunos archivos cambiaron mientras se leían"
	 ;;
	2)
	 echo "[Error critico] No cuentas con los permisos suficientes o el directorio no existe"
	 ;;
esac
