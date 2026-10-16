# Linux Maintenance and Backup Script

Script de Bash para automatizar la creación de respaldos comprimidos del directorio `/var/www/html` y registrar información sobre el mantenimiento y el uso del disco.

## Características

- Creación automática del directorio de respaldos si no existe.
- Generación de respaldos comprimidos en formato `.tar.gz`.
- Inclusión de fecha y hora en el nombre de cada respaldo.
- Registro de las ejecuciones y sus resultados en un archivo de log.
- Consulta y registro del uso actual del disco.
- Manejo básico de errores durante la creación del respaldo.

## Requisitos

- Linux.
- Bash.
- `tar`, para crear archivos comprimidos.
- `date`, para generar marcas de tiempo.
- `df`, para consultar el uso del disco.
- Permisos de lectura sobre el directorio de origen y escritura en el directorio de respaldos y el archivo de log.

## Configuración

El script utiliza las siguientes variables:

| Variable | Descripción |
|---|---|
| `FECHA` | Fecha y hora utilizadas para identificar cada respaldo. |
| `DIR_RESPALDO` | Directorio donde se almacenan los respaldos. |
| `LOG_FILE` | Archivo donde se registran los resultados del mantenimiento. |
| `ARCHIVO_RESPALDO` | Ruta completa del archivo comprimido generado. |
| `DIRECTORIO_ORIGEN` | Directorio del que se crea el respaldo. |

Valores predeterminados:

```bash
DIR_RESPALDO="/tmp/respaldos"
LOG_FILE="/tmp/mantenimiento.log"
DIRECTORIO_ORIGEN="/var/www/html"
```

Estas rutas pueden modificarse según las necesidades del entorno.

## Instalación

Clona el repositorio:

```bash
git clone <REPOSITORY_URL>
cd <REPOSITORY_DIRECTORY>
```

Dale permisos de ejecución al script:

```bash
chmod +x mantenimiento.sh
```

## Uso

Ejecuta el script con:

```bash
./mantenimiento.sh
```

Si el usuario no tiene los permisos necesarios para acceder al directorio de origen o escribir en las rutas configuradas, la operación puede fallar.

## Funcionamiento

1. Obtiene la fecha y hora actuales para identificar la ejecución.
2. Define las rutas del directorio de respaldos, el archivo de log y el directorio de origen.
3. Crea el directorio de respaldos si todavía no existe.
4. Registra el inicio del mantenimiento en el archivo de log.
5. Genera un archivo comprimido `.tar.gz` con el contenido de `/var/www/html`.
6. Registra en el log si el respaldo se creó correctamente o si ocurrió un error.
7. Consulta el uso actual del sistema de archivos raíz mediante `df -h /`.
8. Añade un separador al log para distinguir las distintas ejecuciones.

## Archivos generados

**Respaldo comprimido**

```text
/tmp/respaldos/sitio_YYYY-MM-DD_HH-MM.tar.gz
```

**Registro de mantenimiento**

```text
/tmp/mantenimiento.log
```

El archivo de log acumula información de las ejecuciones, incluyendo el resultado del respaldo y el uso del disco.

## Consideraciones de seguridad y mantenimiento

- Los respaldos se almacenan en `/tmp`, por lo que no deben considerarse copias permanentes ni una estrategia de recuperación ante desastres.
- El directorio `/var/www/html` debe existir y ser accesible para el usuario que ejecuta el script.
- El usuario debe tener permisos de escritura sobre el directorio de respaldos y el archivo de log.
- El script no elimina respaldos antiguos ni limita el tamaño del archivo de log.
- Se recomienda verificar periódicamente la integridad de los archivos generados y conservar copias en una ubicación independiente.
- Actualmente, el script registra el error de `tar`, pero no detiene toda la ejecución cuando falla la creación del respaldo.

## Tecnologías

- Bash
- Linux
- `tar`
- `gzip`
- Coreutils (`date`, `mkdir`)
- `df`

## Licencia

Este proyecto se distribuye bajo la licencia especificada en el archivo `LICENSE` del repositorio.
