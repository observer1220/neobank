# Build stage
FROM golang:1.22.1-alpine3.19 AS builder
WORKDIR /app
COPY . .
RUN go build -o main main.go

# Run DB migrations directly inside golang code, No need to install golang-migrate here
# RUN apk add curl
# RUN apk add tar
# RUN curl -L https://github.com/golang-migrate/migrate/releases/download/v4.16.2/migrate.linux-amd64.tar.gz | tar xvz

# Run stage
FROM alpine:3.18
WORKDIR /app
COPY --from=builder /app/main .
# COPY --from=builder /app/migrate ./migrate
COPY app.env .
COPY start.sh .
COPY wait-for.sh .
COPY db/migration ./db/migration
RUN chmod +x ./start.sh
RUN chmod +x ./wait-for.sh

EXPOSE 8080 9090
CMD [ "/app/main" ]
# ENTRYPOINT [ "/app/start.sh" ]