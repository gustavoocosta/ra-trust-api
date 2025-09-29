# RA Trust API 🚀

API em **Golang** inspirada no Reclame Aqui, criada para demonstrar habilidades em:
- Golang + Gin
- PostgreSQL
- Docker & Docker Compose
- CI/CD com GitHub Actions
- Arquitetura limpa e escalável

## 📌 Como rodar
```bash
# Subir containers
docker-compose up --build

API disponível em: http://localhost:8080/health

📂 Estrutura

ra-trust-api/
 ┣ cmd/                  # Código principal
 ┣ Dockerfile
 ┣ docker-compose.yml
 ┣ .github/workflows/    # CI/CD
 ┗ README.md

---
