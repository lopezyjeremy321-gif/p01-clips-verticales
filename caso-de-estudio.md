# Caso de estudio P01: 1 video de 56 min → 10 clips verticales

Todas las cifras de este archivo salen de salidas reales (ffprobe, ebur128, `etapas*.json`, `post.json`, `sync_resultados.json`). Lo que no se midió lo dice. PC: portátil i5-12450H (12 hilos), 32 GB, RTX 3050 de 4 GB **ocupada por otro proyecto durante toda la prueba**, así que todo corrió en CPU y compartiendo la máquina con otros procesos.

## 1. La fuente
- «NASA's SpaceX Crew-13 Prelaunch News Conference», NASA Kennedy Space Center, 30-sep-2026. Dominio público (`PD-USGov-NASA`). Ficha completa en `FUENTE.md`.
- 1920×1080, 59,94 fps (60000/1001), 56 min 10 s, 1,09 GiB. Voz de cuatro ponentes en panel con preguntas de periodistas, en inglés.
- Descarga con `curl` en 277 s. No se usó yt-dlp.

## 2. Resultado: los 10 clips (medido sobre cada MP4 final)
| N.º | Titular | Minuto | Seg. | MB | Tamaño | fps | LUFS | Pico dBFS | Fotos B-roll | Desfase audio vs. fuente (ms) | Cara visible |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Crew-13 teams fixed Dragon's oxidizer leak before launch | 4:14 | 44,2 | 40,4 | 1080×1920 | 59,94 | -14,1 | -1,4 | 3 | 0 | 88 % |
| 2 | NASA: crew, ground teams and hardware are healthy and ready | 13:12 | 39,0 | 33,8 | 1080×1920 | 59,94 | -14,1 | -1,4 | 2 | -5 | 73 % |
| 3 | A Canadian astronaut's first mission to space | 14:52 | 34,8 | 21,2 | 1080×1920 | 59,94 | -14,3 | -1,2 | 3 | -10 | 83 % |
| 4 | Four science experiments heading to the space station | 15:59 | 41,6 | 27,4 | 1080×1920 | 59,94 | -14,2 | -0,4 | 0 | -5 | 87 % |
| 5 | SpaceX's number one priority: getting the crew safely to orbit | 20:29 | 58,4 | 37,6 | 1080×1920 | 59,94 | -14,0 | -1,4 | 1 | 0 | 83 % |
| 6 | NASA wants more than one way to reach low Earth orbit | 34:40 | 42,4 | 34,2 | 1080×1920 | 59,94 | -13,9 | -1,4 | 2 | 0 | 90 % |
| 7 | Cutting a valve out of Dragon with the oxidizer tank full | 36:22 | 54,6 | 29,3 | 1080×1920 | 59,94 | -14,0 | -1,4 | 2 | 0 | 89 % |
| 8 | Starship is still a developmental test program | 39:20 | 48,9 | 24,6 | 1080×1920 | 59,94 | -14,0 | -1,5 | 0 | 0 | 98 % |
| 9 | A new study on how astronauts make a home in space | 48:38 | 42,4 | 30,4 | 1080×1920 | 59,94 | -14,5 | -1,2 | 2 | 0 | 83 % |
| 10 | Why the Crew-13 mission patch nods to Apollo 13 | 49:58 | 47,1 | 38,2 | 1080×1920 | 59,94 | -14,2 | -1,4 | 1 | -10 | 84 % |

- 10 de 10 miden 1080×1920 y 59,94 fps (**no 60 exactos**: la fuente es de 59,94 fps y el motor no inventa cuadros; con una fuente de 24 o 30 fps habría salido a 30).
- Volumen: de -14,5 a -13,9 LUFS. El objetivo era −14 ±0,5: 10 de 10 cumplen; el clip 09 (-14,5) está exactamente en el borde. Pico verdadero entre -1,5 y -0,4 dBFS.
- Peso total: 317,0 MB (31,7 MB de media por clip) frente a 1,09 GiB de la fuente.
- Subtítulos palabra a palabra (palabra activa en amarillo) con tiempos de Whisper small, titular arriba, sin marca de agua (plan admin, `dueno=None`), sin música.
- B-roll libre: 16 fotos en total (0 a 3 por clip). Créditos en `*.creditos.txt` y `*.descripcion.txt`, nunca sobre el video. Lista:
- «Launch Pad 39A»: Bill Ingalls, Public domain. https://commons.wikimedia.org/wiki/File%3ABrightly%20lit%20STS-135%20on%20launch%20pad%2039a.jpg
- «NASA»: NASA, Public domain. https://commons.wikimedia.org/wiki/File%3ANASA%20HQ%20Building.jpg
- «SpaceX»: Original: NASA Johnson Space Center Derivative work: Nythar, Public domain. https://commons.wikimedia.org/wiki/File%3ACRS-20%20Dragon%E2%80%93Enhanced.jpg
- «Canadian Space Agency»: DLR German Aerospace Center, CC BY 3.0. https://commons.wikimedia.org/wiki/File%3ARapid%20Eye%20and%20Canadian%20Space%20Agency%20%287635805580%29.jpg
- «Royal Canadian Air Force»: MarcelX42, CC BY-SA 4.0. https://commons.wikimedia.org/wiki/File%3AHannover%20Airport%20Royal%20Canadian%20Air%20Force%20Government%20of%20Canada%20Airbus%20CC-330%20330002%20%28DSC03094%29.jpg
- «International Space Station»: NASA/Goddard Space Flight Center, CC BY 2.0. https://commons.wikimedia.org/wiki/File%3ADramatic%20Views%20of%20Hurricane%20Florence%20from%20the%20International%20Space%20Station%20From%209%2012%20%2842828603210%29%20%28cropped%29.jpg
- «SpaceX Starship»: Lars Plougmann from United States, CC BY-SA 2.0. https://commons.wikimedia.org/wiki/File%3AStarship%20SN16.jpeg
- «Boeing Starliner»: Balon Greyjoy, CC0. https://commons.wikimedia.org/wiki/File%3A20180706%20Starliner%20Johnson%20Space%20Center.jpg
- «Cape Canaveral»: NASA, Public domain. https://commons.wikimedia.org/wiki/File%3ACape%20canaveral.jpg
- «SpaceX Dragon»: SpaceX Photos, CC0. https://commons.wikimedia.org/wiki/File%3ADragon%202%20hover%20test%20%2824159153709%29.jpg
- «University of British Columbia»: Xicotencatl, CC BY-SA 4.0. https://commons.wikimedia.org/wiki/File%3AAsian%20Center%20UBC.JPG
- «Apollo 13 spacecraft»: NASA/Apollo 17 crew; taken by either Harrison Schmitt or Ron Evans, Public domain. https://commons.wikimedia.org/wiki/File%3AThe%20Earth%20seen%20from%20Apollo%2017.jpg

## 3. Qué hizo el sistema, qué hice yo, y cuánto tardó
| Etapa | Tiempo | Quién | Nota |
|---|---|---|---|
| Descarga de la fuente (curl, 1,09 GiB) | 277 s | Script | Desde el servidor de NASA, sin yt-dlp. |
| Elegir momentos (juez Groq) | 13 min 33 s y 9 min 38 s | Sistema | Dos pasadas (la segunda, con 16 candidatos y los minutos ya usados excluidos). Casi todo es espera de límites de uso de Groq. |
| Tiempos palabra a palabra (Whisper small, CPU) | 67 min 06 s | Sistema | Solo sobre los 15 tramos elegidos (12 min 07 s de audio). Una ventana tardó 40 min 25 s por la CPU saturada; las otras 14 sumaron 26 min 41 s para 11 min 18 s de audio. |
| Cortar, encuadrar 9:16, subtítulos y portada (motor) | 49 min 10 s | Sistema | 11 clips pasaron por el motor (4 min 28 s por clip de media); 4 fueron rechazados por el revisor de idea completa antes de renderizar, y 1 clip extra quedó de reserva. |
| Titulares, selección y exclusión de fotos | Sin medir | Persona | Revisar los titulares del juez contra el audio y reescribirlos; descartar 2 fotos de B-roll. |
| B-roll, subtítulos encima y −14 LUFS (postproceso.py) | 27 min 58 s | Script propio | 10 clips, 2 min 48 s por clip. |

Tiempo de reloj total de la prueba, de la descarga a los MP4 finales: varias horas, porque las etapas corrieron en CPU compartida. No es una cifra de rendimiento del motor. Con GPU libre el motor transcribe 56 min completos y renderiza más rápido; eso **no se pudo medir aquí**.

### Qué automatizó el sistema (ViralClip Pro, `motor\proceso.py`)
Copia del video, transcripción, juez de momentos (LLM por Groq) con partición en 9 tramos de texto, revisor de «idea completa», recorte de muletillas y silencios largos (`limpiar_partes`), detección de cortes de escena (PySceneDetect), detección y seguimiento de caras (MediaPipe), decisión de encuadre 9:16 (`seguir`), subtítulos palabra a palabra con libass, portada.

### Qué hice yo o un script mío
- `run_p01.py`: lanza el motor sin el servidor ni el panel, con datos temporales, y sustituye la transcripción completa por la de dos etapas (subtítulos oficiales para elegir; Whisper solo sobre los tramos elegidos).
- Reescritura de los 10 titulares contra el audio.
- `postproceso.py`: B-roll por debajo de los subtítulos (el motor lo pone encima y los tapa), exclusión de 2 fotos y loudnorm de 2 pasadas.
- Verificación (`verificar_lote.py`, `sync_av.py`, `medidas_p01.py`).

## 4. Verificación de sincronía audio/video
- **Audio frente a la fuente:** correlación de envolventes (5 ms) entre el audio de cada clip y el de la fuente en el tramo más largo del clip: desfase de -10 a 0 ms, con correlación de 0,92 a 1,00.
- **Flujos:** `start_time` de video y audio iguales (0 ms) en los 10; la duración del audio supera a la del video entre 18 y 96 ms (cola del códec AAC).
- **Boca frente a energía del audio** (MediaPipe, 30 cuadros/s): correlación baja (de 0,06 a 0,30) y un retraso aparente de 100 a 167 ms en 9 de 10 clips. Sospecho sesgo de la medición (la boca se abre antes de que suba la energía, y el detector suaviza); **no es una prueba** de desfase real, y no la presento como tal.
- **A ojo:** hojas de fotogramas de los 10 clips (12 muestras por clip, `verificacion-hojas\`). Sin desfase evidente de subtítulos; sí hay defectos de encuadre (sección 5).

## 5. Fallos y límites
1. Whisper sobre los 56 min 10 s completos no terminó: el primer intento murió a los 16 min 55 s con un error de memoria (mkl_malloc) y el segundo no avanzó con la CPU saturada por otros procesos. La GPU de 4 GB estaba ocupada por otro proyecto. Por eso se usaron los subtítulos oficiales de NASA para elegir y Whisper solo sobre los tramos elegidos. El flujo normal del motor transcribe todo; no se pudo medir aquí.
2. El juez propuso 10 candidatos y el revisor de idea completa rechazó 3; hizo falta una segunda tanda (16 candidatos, 5 útiles tras excluir los ya usados). En total 4 tramos se rechazaron.
3. Los titulares del juez no se pueden publicar tal cual: eran sensacionalistas o inexactos («cortaron el tanque» cuando el audio dice «valve», «el fin de la ISS»). Se reescribieron a mano contra el audio. Sin esa revisión humana habría desinformación sobre personas reales.
4. El encuadre automático a veces pierde a quien habla. Contado a ojo en las hojas de fotogramas (12 muestras por clip): 8 de los 10 clips tienen al menos una muestra con el plano general de la transmisión recortado a pantalla completa, con las personas pequeñas, o con un panel vacío; el peor (clip 04) tiene 5 de 12. No se corrigió.
5. Cara visible en el centro del cuadro: entre 73 % y 98 % de los cuadros según el detector de MediaPipe (mediana 85 %); el resto son planos de audiencia, de pantalla o con la persona fuera del recorte.
6. El B-roll libre es relevante a medias: sale de buscar entidades en Wikimedia Commons («International Space Station» devolvió un huracán visto desde la estación). Se descartaron a mano dos fotos; el resto se dejó y está acreditado.
7. 60 fps: el motor no los inventa. Estos clips salen a 59.94 fps porque la fuente es de 59,94 fps (ffprobe: 60000/1001). Con una fuente de 24 o 30 fps el motor sube a 30 fps, no a 60.
8. Sincronía audio y video: se mide el desfase del audio frente a la fuente (correlación de envolventes) y la correlación boca-audio. La segunda es débil (0,06 a 0,30) y da siempre un retraso de 100 a 167 ms (menos en el clip 09), que más parece sesgo de la medición que desfase real: no es una prueba. Lo medido de verdad: el audio de cada clip coincide con el de la fuente con un desfase de 0 a −10 ms, y video y audio salen del mismo corte.
9. Un solo video fuente, en inglés, con ponentes en panel. No se probó un podcast de dos personas en plano fijo, ni audio con música, ni otros idiomas.
10. Los 10 clips dependen de un portátil con 12 hilos compartidos con otros procesos: los tiempos de esta página son de esa PC y ese día, no una promesa de velocidad.

## 6. Qué se probó y qué no
Probado: 10 clips 1080×1920 a 59,94 fps con −14 LUFS (±0,5), subtítulos palabra a palabra, B-roll libre con crédito, sin marca de agua, audio alineado con la fuente.
No probado: transcripción completa del motor sobre el video largo (CPU saturada, GPU ocupada); fuentes de otro tipo (podcast de dos personas en plano fijo, audio con música, otros idiomas); publicación; el panel real 8790 ni el MCP; velocidad con GPU.

## 7. Seguridad y licencias
- Fuente de dominio público, descargada del servidor de NASA; sin yt-dlp, sin cookies, sin claves en logs. gitleaks: ver `README.md`.
- B-roll: Wikimedia Commons con licencia verificada por el propio motor (CC0, dominio público, CC BY, CC BY-SA); las de CC BY y CC BY-SA llevan crédito en el archivo de descripción.
- Los titulares sobre personas reales se reescribieron para no atribuirles lo que no dijeron. Las personas que aparecen no respaldan este trabajo ni a NASA.
