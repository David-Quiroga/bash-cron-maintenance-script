# 🛠️ Automated System Maintenance & Backup Script

Este repositorio contiene la implementación de una solución en Bash Scripting para la automatización de respaldos periódicos, monitoreo del almacenamiento del sistema y la gestión eficiente de servicios en un entorno Linux (Ubuntu Server/Desktop).

---

## 📌 Descripción del Proyecto

En entornos de producción, la ejecución manual de respaldos rutinarios y la falta de control sobre los recursos en disco pueden ocasionar pérdida de datos o saturación del sistema. 

Este proyecto resuelve este problema implementando un script ejecutable que crea copias de seguridad comprimidas con marcas de tiempo únicas, registra el estado del almacenamiento en un archivo de log persistente y se ejecuta en segundo plano sin intervención humana mediante el demonio de `cron`.

---

## 🚀 Características Principales

* **Respaldos Automatizados:** Compresión `.tar.gz` de directorios clave del servidor (como sitios web alojados en `/var/www/html`).
* **Estampado Temporal Único:** Generación de nombres de archivo dinámicos (`sitio_YYYY-MM-DD_HH-MM.tar.gz`) para evitar sobrescrituras.
* **Monitoreo de Disco:** Inclusión de reporte de uso de almacenamiento (`df -h`) registrado en logs de ejecución.
* **Redirección y Logging:** Captura unificada de salida estándar y errores (`>> log 2>&1`) para facilitar la auditoría.
* **Gestión Eficiente de Servicios:** Configuración y optimización de Nginx para evitar el consumo innecesario de recursos al inicio del sistema.

---

## 🛠️ Tecnologías y Conceptos Aplicados

* **OS / Entorno:** Linux (Ubuntu) / Bash Shell
* **Automatización:** System Cron (`/etc/crontab`), Crontab, Daemons
* **Gestión de Servicios:** `systemctl` (Systemd), `lsof`, `ss`
* **Utilidades de Sistema:** `tar`, `df`, `grep`, Redirecciones de I/O

---

## 📂 Estructura del Repositorio

```text
.
├── mantenimiento.sh    # Script principal de mantenimiento y respaldos
└── README.md           # Documentación del proyecto
