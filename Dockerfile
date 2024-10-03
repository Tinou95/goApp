# Etape 1 : Construction
FROM golang:1.16-alpine
WORKDIR /app
COPY app/ .
RUN go mod init myapp
RUN go env -w CGO_ENABLED=0 GOOS=linux GOARCH=amd64
RUN go build -o myapp .
USER 1000
EXPOSE 9090
CMD ["./myapp"]
