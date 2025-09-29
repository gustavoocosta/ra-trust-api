# Etapa de build
FROM golang:1.26 AS builder

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia apenas os arquivos de dependências primeiro para aproveitar o cache
COPY go.mod go.sum ./

# Baixa as dependências (vai usar cache se não mudar go.mod/go.sum)
RUN go mod download

# Copia o restante do código
COPY . .

# Compila o binário da aplicação
RUN go build -o ra-trust-api ./cmd/main.go

# Etapa final: imagem leve apenas com o binário
FROM debian:bullseye-slim

WORKDIR /app

# Copia o binário da etapa de build
COPY --from=builder /app/ra-trust-api .

# Porta que a aplicação vai expor (ajuste conforme necessário)
EXPOSE 8080

# Comando padrão para rodar a aplicação
CMD ["./ra-trust-api"]
