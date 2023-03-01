# menggunakan base image golang ver 1.15
FROM golang:1.15-alpine

# menambahkan metadata kedalam image
LABEL org.opencontainers.image.source=https://github.com/trisnanto/a433-microservices

# menentukan working directory didalam container
WORKDIR /go/src/github.com/dicodingacademy/karsajobs

# mengatur variabel environment
ENV GO111MODULE=on
ENV APP_PORT=8080

# menyalin file go.mod dan go.sum
COPY go.mod .
COPY go.sum .

# mengunduh module yang diperlukan
RUN go mod download

# menyalin seluruh source code ke working directory didalam container
COPY . .

# menjalankan perintah untuk melakukan build aplikasi
RUN mkdir /build; \
    go build -o /build/ ./...

# menggunakan port 8080 untuk aplikasi
EXPOSE 8080

# menjalankan server
CMD ["/build/web"]
