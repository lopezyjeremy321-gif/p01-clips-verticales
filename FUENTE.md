# Fuente del video largo (P01)

| Campo | Valor |
|---|---|
| Título | NASA's SpaceX Crew-13 Prelaunch News Conference (1080p) |
| Qué es | Rueda de prensa en vivo con voz (4 ponentes en panel + preguntas de periodistas), Centro Espacial Kennedy, 30-sep-2026 |
| Autor | NASA Kennedy Space Center (obra del gobierno de EE. UU.) |
| Licencia | Dominio público (`PD-USGov-NASA`, etiqueta de Wikimedia Commons). Los medios de NASA no tienen copyright; la política de uso de NASA exige no sugerir respaldo de NASA y no usar su insignia como marca propia |
| Página en Commons | https://commons.wikimedia.org/wiki/File:NASA%27s_SpaceX_Crew-13_Prelaunch_News_Conference_-_1080p_(KSC-20260930-VP-RTD01-0001-SpaceX_Crew_13_Prelaunch_News_Conference_1080p-M26154).webm |
| Origen real descargado | NASA Image and Video Library, id `KSC-20260930-VP-RTD01-0001-SpaceX_Crew_13_Prelaunch_News_Conference_1080p-M26154` |
| URL del archivo | https://images-assets.nasa.gov/video/KSC-20260930-VP-RTD01-0001-SpaceX_Crew_13_Prelaunch_News_Conference_1080p-M26154/KSC-20260930-VP-RTD01-0001-SpaceX_Crew_13_Prelaunch_News_Conference_1080p-M26154~orig.mp4 |
| Subtítulos oficiales (solo para comparar) | misma carpeta, `.srt` (91 296 bytes) |
| Descarga | `curl` (no yt-dlp), 1 173 362 775 bytes (1,09 GiB) en 277 s (promedio 4,2 MB/s) |
| SHA-256 | `bf916a76782230addeb10d7ac371f49ef93a9cf6a03d349a39f5cf4ed549b328` |
| Propiedades (ffprobe) | h264 1920x1080, 60000/1001 fps (59,94), AAC estéreo 48 kHz, 3369,85 s (56 min 10 s), 2,79 Mb/s |
| Ruta local | `<ruta-local>` (no se versiona ni se exporta) |

## Cómo se verificó la licencia
- La ficha de Commons marca `{{PD-USGov-NASA}}` y cita como fuente la NASA Image and Video Library (id arriba).
- El archivo se bajó directo de `images-assets.nasa.gov` (el servidor de NASA), no de un tercero.
- Pendiente de verificar por un humano: ninguna revisión legal; es una lectura de la etiqueta de licencia, no asesoría jurídica.

## Por qué no se usó la primera opción
Se eligió primero una entrevista CC BY de YouTube subida a Commons (Reason), pero Wikimedia respondió HTTP 429 al descargar el archivo grande (límite por IP, probablemente compartido con otros procesos de esta PC) y su ficha seguía con `{{LicenseReview}}` sin completar. El video de NASA es dominio público directo y además trae 59,94 fps nativos.

## Qué no se hizo
- No se usó yt-dlp.
- No se resube el video original a ningún sitio; solo los 10 clips derivados (cada uno con su `creditos.txt`/`descripcion.txt`).
