# RA Trust API

Este repositório contém a API do projeto **RA Trust**, desenvolvida em Go.  
O objetivo é fornecer endpoints seguros e organizados para autenticação, gestão de dados e integrações.

---

## Tecnologias utilizadas

- Go 1.23
- Docker e Docker Compose
- PostgreSQL

---

## Estrutura do projeto

- `cmd/` → ponto de entrada da aplicação (main.go)  
- `internal/` → regras de negócio, handlers e serviços  
- `migrations/` → scripts SQL para criação/alteração do banco  
- `Dockerfile` → imagem da aplicação  
- `docker-compose.yml` → orquestração dos serviços  
- `.github/workflows/` → automações de CI/CD  
- `go.mod` e `go.sum` → dependências do Go

---

## Configuração

Antes de rodar, crie um arquivo `.env` na raiz com as variáveis de ambiente:

```env
DB_HOST=db
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=postgres
DB_NAME=ra_trust
API_PORT=8080
```

---

## Como executar

### Usando Docker
```bash
docker-compose up --build
```

Isso vai iniciar:
- API em `http://localhost:8080`
- Banco PostgreSQL na porta `5432`

### Sem Docker
```bash
go mod tidy
go run ./cmd/main.go
```

---

## Migrações do banco

Os scripts SQL ficam em `migrations/`.  
Se estiver utilizando `golang-migrate`, execute:

```bash
migrate -path migrations -database "postgres://postgres:postgres@localhost:5432/ra_trust?sslmode=disable" up
```

---

## Testes

```bash
go test ./...
```

---

## Build da imagem Docker

```bash
docker build -t ra-trust-api .
```

---

## CI/CD

O repositório já possui workflow do GitHub Actions em `.github/workflows/ci.yml`,  
que executa o build a cada `push` ou `pull request` na branch `main`.
