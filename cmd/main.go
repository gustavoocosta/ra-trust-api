package main

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/gustavoocosta/ra-trust-api/internal/api"
	"github.com/gustavoocosta/ra-trust-api/internal/db"
)

func main() {
	// Conexão com o banco
	db.Connect()

	// Iniciar servidor
	r := gin.Default()

	// Health check
	r.GET("/health", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"status": "ok"})
	})

	// Rotas de usuário
	api.RegisterUserRoutes(r)

	log.Println("Server running on :8080")
	r.Run(":8080")
}
