# Usa una imagen base oficial de n8n
FROM n8nio/n8n:latest

# Instala yt-dlp en Alpine con permisos de superusuario
USER root
RUN apk add --no-cache curl ffmpeg \
    && curl -L https://yt-dlp.org/downloads/latest/yt-dlp -o /usr/local/bin/yt-dlp \
    && chmod a+rx /usr/local/bin/yt-dlp

# Cambia el usuario de vuelta a n8n
USER node

# Expone el puerto que usa n8n
EXPOSE 5678

# Comando por defecto para iniciar n8n
CMD ["n8n"]


