# Etapa de construcción (Build)
FROM node:14 AS build

# Definir directorio de trabajo en la imagen
WORKDIR /app

# Copiar archivos del proyecto a la imagen
COPY . .

# Instalar dependencias y construir la aplicación
RUN npm install
RUN npm run build

# Etapa de producción (Runtime)
FROM nginx:alpine

# Copiar los archivos generados en la etapa de construcción al contenedor final
COPY --from=build /app/build /usr/share/nginx/html

# Exponer el puerto en el que corre nginx
EXPOSE 80

# Comando para ejecutar el servidor nginx
CMD ["nginx", "-g", "daemon off;"]