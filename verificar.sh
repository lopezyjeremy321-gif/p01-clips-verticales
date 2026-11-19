#!/bin/bash
# Uso: verificar.sh <mp4> <carpeta_salida>   -> ffprobe + LUFS (ebur128) + hoja de contactos
f="$1"; out="$2"; mkdir -p "$out"
b=$(basename "$f" .mp4)
ffprobe -v error -select_streams v:0 -show_entries stream=codec_name,width,height,r_frame_rate,avg_frame_rate,pix_fmt,nb_frames -show_entries format=duration,size,bit_rate -of json "$f" > "$out/$b.probe.json"
ffprobe -v error -select_streams a:0 -show_entries stream=codec_name,sample_rate,channels -of json "$f" > "$out/$b.probea.json"
ffmpeg -nostats -i "$f" -af ebur128=peak=true -f null - 2>&1 | awk '/Summary:/{s=1} s' > "$out/$b.lufs.txt"
dur=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$f")
# hoja de contactos 6x2 (12 cuadros repartidos), cada celda 270x480
fps=$(awk -v d="$dur" 'BEGIN{printf "%.5f", 12/d}')
ffmpeg -y -v error -i "$f" -vf "fps=$fps,scale=270:480,tile=6x2:padding=4:margin=4:color=black" -frames:v 1 "$out/$b.hoja.jpg"
echo "$b ok"
