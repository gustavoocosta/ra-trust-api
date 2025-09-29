package api

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/gustavoocosta/ra-trust-api/internal/db"
	"github.com/gustavoocosta/ra-trust-api/internal/models"
)

func RegisterUserRoutes(r *gin.Engine) {
	r.GET("/users", getUsers)
}

func getUsers(c *gin.Context) {
	var users []models.User
	err := db.DB.Select(&users, "SELECT id, name, email FROM users")
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, users)
}
