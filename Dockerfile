FROM golang:1.20-alpine AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod download
COPY . .

RUN go build -o my-go-app
FROM alpine:latest

COPY --from=builder /app/my-go-app /my-go-app

EXPOSE 9090

CMD ["/my-go-app"]
