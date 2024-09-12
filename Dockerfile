# Usa una imagen base oficial de n8n
FROM n8nio/n8n:latest

# Instala yt-dlp
RUN apt-get update && apt-get install -y curl ffmpeg \
    && curl -L https://yt-dlp.org/downloads/latest/yt-dlp -o /usr/local/bin/yt-dlp \
    && chmod a+rx /usr/local/bin/yt-dlp

# Expone el puerto que usa n8n
EXPOSE 5678

# Comando por defecto para iniciar n8n
CMD ["n8n"]
