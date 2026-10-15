#!/usr/bin/env bash

# ============================================
# Script: mantenimiento.sh
# Descripción: Crea un respaldo comprimido
#              del directorio /var/www/html
#              y registra información del sistema.
# ============================================

# Variables
FECHA=$(date +%Y-%m-%d_%H-%M)
DIR_RESPALDO="/tmp/respaldos"
LOG_FILE="/tmp/mantenimiento.log"
ARCHIVO_RESPALDO="${DIR_RESPALDO}/sitio_${FECHA}.tar.gz"
DIRECTORIO_ORIGEN="/var/www/html"

# Crear el directorio de respaldos si no existe
mkdir -p "$DIR_RESPALDO"

# Registrar el inicio del mantenimiento
echo "=== Mantenimiento ejecutado el $FECHA ===" >> "$LOG_FILE"

# Crear el respaldo comprimido
if tar -czf "$ARCHIVO_RESPALDO" -C "$DIRECTORIO_ORIGEN" . 2>/dev/null; then
    echo "Respaldo creado correctamente: $ARCHIVO_RESPALDO" >> "$LOG_FILE"
else
    echo "ERROR: No se pudo crear el respaldo." >> "$LOG_FILE"
fi

# Registrar el uso actual del disco
echo "Uso de disco actual:" >> "$LOG_FILE"
df -h / >> "$LOG_FILE"

# Separador entre ejecuciones
echo "----------------------------------------" >> "$LOG_FILE"
