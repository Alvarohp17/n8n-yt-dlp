# Usa una imagen base oficial de Node.js (en lugar de n8n) para asegurarnos de que todo se instale correctamente
FROM node:16-alpine

# Cambiamos al usuario root para tener permisos de instalación
USER root

# Instala las dependencias necesarias para n8n
RUN apk add --no-cache curl ffmpeg bash \
    && npm install -g n8n \
    && curl -L https://yt-dlp.org/downloads/latest/yt-dlp -o /usr/local/bin/yt-dlp \
    && chmod a+rx /usr/local/bin/yt-dlp

# Cambia al usuario no privilegiado de n8n
USER node

# Exponer el puerto 5678 para n8n
EXPOSE 5678

# Comando por defecto para ejecutar n8n
CMD ["n8n"]



