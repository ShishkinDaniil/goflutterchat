package app

import (
	"log"

	"back/internal/db"
	"back/internal/repository/user"
	"back/pkg/auth"

	"back/internal/ws"
	"back/router"
)

func Run() {
	dbConn, err := db.NewDatabase()
	if err != nil {
		log.Fatalf("could not initialize database connection: %s", err)
	}
	tokenManager, err := auth.NewManager("secret")
	if err != nil {
		log.Fatalf("could not initialize token manager: %s", err)
	}
	userRep := user.NewRepository(dbConn.GetDB())
	userSvc := user.NewService(userRep, tokenManager)
	userHandler := user.NewHandler(userSvc, tokenManager)

	hub := ws.NewHub()
	wsHandler := ws.NewHandler(hub)
	go hub.Run()

	router.InitRouter(userHandler, wsHandler)
	router.Start("0.0.0.0:8080")
}
