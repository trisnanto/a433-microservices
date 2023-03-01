# menggunakan base image Node.js ver 14
FROM node:14.21-alpine as builder

# menambahkan metadata kedalam image
LABEL org.opencontainers.image.source=https://github.com/trisnanto/a433-microservices

# menentukan working directory didalam container
WORKDIR /app

# menyalin file yang berawalan package dan bertipe json ke app directory container
COPY package*.json ./

# menginstall dependencies
RUN npm install

# menyalin seluruh source code ke working directory didalam container
COPY . .

# menjalankan proses build aplikasi
RUN npm run build

# membuka dan menggunakan port 8000 untuk aplikasi
EXPOSE 8000

# menjalankan server
CMD [ "npm", "run", "serve" ]
