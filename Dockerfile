# ---------- Build ----------
FROM golang:1.23 AS builder
WORKDIR /app

# Dependências em cache
COPY go.mod go.sum ./
RUN go mod download

# Código-fonte
COPY . .

# Build do binário na pasta cmd/
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -ldflags="-s -w" -o /ra-trust-api ./cmd/main.go

# ---------- Runtime ----------
FROM gcr.io/distroless/static-debian11
USER nonroot:nonroot
WORKDIR /
COPY --from=builder /ra-trust-api /ra-trust-api
EXPOSE 8080
ENTRYPOINT ["/ra-trust-api"]
