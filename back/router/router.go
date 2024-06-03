package router

import (
	"back/internal/repository/user"
	"time"

	"back/internal/ws"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

var r *gin.Engine

func InitRouter(userHandler *user.Handler, wsHandler *ws.Handler) {
	r = gin.Default()

	r.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"http://localhost:3000"},
		AllowMethods:     []string{"GET", "POST"},
		AllowHeaders:     []string{"Content-Type"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
		AllowOriginFunc: func(origin string) bool {
			return origin == "http://localhost:3000"
		},
		MaxAge: 12 * time.Hour,
	}))

	r.POST("/signup", userHandler.CreateUser)
	r.POST("/login", userHandler.Login)
	r.POST("/refresh-token", userHandler.RefreshToken)

	authenticated := r.Group("/", userHandler.UserIdentity)
	{
		authenticated.GET("/getProfile", userHandler.GetProfile)
		authenticated.GET("/logout", userHandler.Logout)
		authenticated.POST("/ws/createRoom", wsHandler.CreateRoom)
		authenticated.GET("/ws/joinRoom/:roomId", wsHandler.JoinRoom)
		authenticated.GET("/ws/getRooms", wsHandler.GetRooms)
		authenticated.GET("/ws/getClients/:roomId", wsHandler.GetClients)
	}
}

func Start(addr string) error {
	return r.Run(addr)
}
