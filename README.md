# P01 · ViralClip Studio: caso de estudio «1 video de 56 min → 10 clips verticales»

Qué es: una demostración medida del motor ViralClip Pro (`<ruta-local>`) con un video largo de dominio público (rueda de prensa de NASA, 56 min 10 s, 59,94 fps). Entrega 10 clips 1080×1920 con subtítulos palabra a palabra, B-roll libre con crédito, sin marca de agua y a −14 LUFS, más una página de servicio estática.

- Caso completo, con tiempos, pesos, qué automatizó el sistema, fallos y límites: [`caso-de-estudio.md`](caso-de-estudio.md)
- Fuente, licencia y SHA-256: [`FUENTE.md`](FUENTE.md)
- Página de servicio: `web\index.html` (completa, con 10 vistas previas) y `web-ligero\` (la que se despliega: 3 vistas previas)
- Capturas: `docs\capturas\` (escritorio 1440, móvil 390, modo oscuro) · Lighthouse móvil: `docs\lighthouse-movil.json`

## Resultados medidos (resumen)
| Criterio | Resultado medido |
|---|---|
| Clips | 10 de 10, 34,8 a 58,4 s, 21 a 40 MB |
| Tamaño y fps | 1080×1920 en los 10; 59,94 fps (60000/1001), no 60 exactos: la fuente es de 59,94 y el motor no inventa cuadros |
| Volumen | −14,5 a −13,9 LUFS (objetivo −14 ±0,5: 10 de 10; el clip 09 en el borde) |
| Audio frente a la fuente | desfase de 0 a −10 ms (correlación 0,92 a 1,00) |
| Marca de agua | ninguna |
| Cara visible (MediaPipe) | 73 % a 98 % de los cuadros |
| Lighthouse móvil (página) | Rendimiento 100, Accesibilidad 100, Buenas prácticas 96, SEO 100; LCP 1,1 s, CLS 0 |
| hallmark `sloplint --render` | `index.html` 0 FAIL, 0 REFLEX, 3 WARN descartados por escrito; `detalle.html` 1 FAIL (puerta 58, palabras por pantalla; es una página de lectura con tablas) |

Lo que **no** se pudo probar: transcripción completa del motor sobre los 56 min (la CPU estaba saturada y la GPU, ocupada por otro proyecto), otros tipos de fuente, publicación y el panel real. Detalle en el caso de estudio.

## Cómo reproducir
Python del motor: `<ruta-local>`. Carpeta de trabajo: `<ruta-local>`.
```powershell
# 1) descargar la fuente (ver FUENTE.md para la URL completa) a fuente\crew13_prelaunch_orig.mp4 y el .srt
# 2) pase del motor sobre datos temporales (no abre el panel ni toca el 8790); 10 candidatos de 30-60 s
$env:CUDA_VISIBLE_DEVICES="-1"; python -u run_p01.py "<ruta-local>" 10 30 60 groq
# 3) por clip: B-roll + subtítulos + -14 LUFS (con el titular verificado)
python postproceso.py <id_clip> "<titular>" --broll-max 3
# 4) medir y armar
python medidas_p01.py; python verificar_lote.py; python armar_verificacion.py; python armar_caso.py; python build_p01.py
```
Variables de la segunda tanda: `P01_DATOS`, `P01_ETAPAS`, `P01_EXCLUIR`, `P01_MAXCLIPS`, `P01_TEMA` (ver `run_p01.py`).

## Archivos de entrega
`Exportaciones\Portafolio\P01\10-clips\` (10 MP4 + `.descripcion.txt` + `.creditos.txt`), `3-mejores\`, `verificacion\` (hojas de contactos), `pagina-servicio\`.

## Límites honestos
- Una sola fuente, en inglés, con ponentes en panel. No se probó un podcast de dos personas en plano fijo.
- El encuadre automático falla en parte de los clips: 8 de 10 tienen al menos una de 12 muestras con plano general recortado o panel vacío; el peor tiene 5 de 12.
- Los titulares del juez eran inexactos; se reescribieron a mano. Sin revisión humana no son publicables.
- El B-roll es relevante a medias («International Space Station» devolvió un huracán visto desde la estación).
- Los tiempos son de esta PC compartida con otros procesos ese día, no una promesa de velocidad.

## Licencias y créditos
- Video: NASA Kennedy Space Center, dominio público (`PD-USGov-NASA`). No implica respaldo de NASA.
- B-roll: Wikimedia Commons (CC0, dominio público, CC BY, CC BY-SA); créditos en cada `.creditos.txt` y en `web\detalle.html`.
- Tipografías de la página: Barlow Condensed y Atkinson Hyperlegible (SIL OFL 1.1).
- Código propio de este proyecto: scripts de esta carpeta. El motor ViralClip Pro es del dueño.

## Seguridad

---
**Nota:** este repositorio es un **caso de estudio** (resultados, sitio de demostración y documentación). El motor que genera los clips es privado y no se incluye.
