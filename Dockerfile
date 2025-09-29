# Build stage
FROM golang:1.22 AS builder
WORKDIR /app
COPY . .
RUN go mod tidy
RUN go build -o ra-trust-api ./cmd/main.go

# Run stage
FROM debian:bullseye-slim
WORKDIR /app
COPY --from=builder /app/ra-trust-api .
EXPOSE 8080
CMD ["./ra-trust-api"]
