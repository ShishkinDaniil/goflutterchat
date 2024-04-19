.PHONY:
.SILENT:
.DEFAULT_GOAL := run

# postgresinit: docker run --name postgres -p 5433:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password -d postgres:16.2

postgres:
	docker exec -it postgres psql   

createdb:
	docker exec -it postgres createdb --username=root --owner=root chatdb

dropdb:
	docker exec -it postgres dropdb chatdb

migrateup:
	migrate -path internal/db/migrations -database "postgresql://root:password@localhost:5433/chatdb?sslmode=disable" -verbose up

migratedown:
	migrate -path internal/db/migrations -database "postgresql://root:password@localhost:5433/chatdb?sslmode=disable" -verbose down

