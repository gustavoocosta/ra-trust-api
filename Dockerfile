# Etapa de build
FROM golang:1.26 AS builder

WORKDIR /app

# Copia apenas arquivos de dependências para usar cache
COPY go.mod go.sum ./
RUN go mod download

# Copia o restante do código
COPY . .

# Compila o binário estático
RUN CGO_ENABLED=0 GOOS=linux go build -o ra-trust-api ./cmd/main.go

# Etapa final: imagem mínima com distroless
FROM gcr.io/distroless/base-debian11

WORKDIR /app

# Copia o binário da etapa de build
COPY --from=builder /app/ra-trust-api .

# Porta que a aplicação vai expor
EXPOSE 8080

# Comando padrão
CMD ["./ra-trust-api"]
