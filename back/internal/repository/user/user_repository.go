package user

import (
	"back/internal/domain"
	"context"
	"database/sql"
	"time"

	"github.com/google/uuid"
)

type DBTX interface {
	ExecContext(ctx context.Context, query string, args ...interface{}) (sql.Result, error)
	PrepareContext(context.Context, string) (*sql.Stmt, error)
	QueryContext(context.Context, string, ...interface{}) (*sql.Rows, error)
	QueryRowContext(context.Context, string, ...interface{}) *sql.Row
}

type repository struct {
	db DBTX
}

func NewRepository(db DBTX) Repository {
	return &repository{db: db}
}

func (r *repository) CreateUser(ctx context.Context, user *User) (*User, error) {
	var lastInsertId uuid.UUID
	print(user.Email)
	errEmail := r.FindEmail(ctx, user)
	if errEmail != nil {
		return &User{}, errEmail
	}
	query := "INSERT INTO users(name, password, email, created, uid) VALUES ($1, $2, $3, $4, $5) returning uid"
	err := r.db.QueryRowContext(ctx, query, user.Name, user.Password, user.Email, user.Created, user.UID).Scan(&lastInsertId)
	if err != nil {
		return &User{}, err
	}

	user.UID = uuid.UUID(lastInsertId)
	return user, nil
}

func (r *repository) FindEmail(ctx context.Context, user *User) error {
	email := user.Email
	query := "SELECT * FROM users WHERE email = $1"
	err := r.db.QueryRowContext(ctx, query, email).Scan("email")
	switch {
	case err == sql.ErrNoRows:
		return nil
	default:
		return domain.ErrUserAlreadyExists
	}
}

func (r *repository) GetUserByEmail(ctx context.Context, email string) (*User, error) {
	u := User{}
	query := "SELECT uid, email, name, password, created FROM users WHERE email = $1"
	err := r.db.QueryRowContext(ctx, query, email).Scan(&u.UID, &u.Email, &u.Name, &u.Password, &u.Created)
	if err != nil {
		return &User{}, domain.ErrUserNotFound
	}

	return &u, nil
}

func (r *repository) GetUserByUid(ctx context.Context, uid string) (*User, error) {
	u := User{}
	query := "SELECT uid, email, name, password, created FROM users WHERE uid = $1"
	err := r.db.QueryRowContext(ctx, query, uid).Scan(&u.UID, &u.Email, &u.Name, &u.Password, &u.Created)
	if err != nil {
		return &User{}, domain.ErrUserNotFound
	}

	return &u, nil
}

// DeleteToken function to delete refresh Token
func (r *repository) DeleteRefreshToken(ctx context.Context, userUID string, refreshToken string) (bool, error) {
	query := "DELETE FROM user_refresh_tokens WHERE token = $1 AND user_uid = $2"
	err := r.db.QueryRowContext(ctx, query, refreshToken, userUID)
	if err != nil {
		return false, err.Err()
	}
	return true, nil
}

func (r *repository) CreateRefreshToken(ctx context.Context, userUID string, refreshToken string, createAt time.Time, expireAt time.Time) error {
	query := "INSERT INTO user_refresh_tokens(token, user_uid, created, expiry_time) VALUES ($1, $2, $3, $4) returning token"
	err := r.db.QueryRowContext(ctx, query, refreshToken, userUID, createAt, expireAt)
	if err != nil {
		return err.Err()
	}
	return nil
}

func (r *repository) GetUidByToken(ctx context.Context, refreshToken string) (*string, error) {
	var uid *string
	query := "SELECT user_uid FROM user_refresh_tokens WHERE token = $1"
	err := r.db.QueryRowContext(ctx, query, refreshToken).Scan(&uid)
	if err != nil {
		return nil, err
	}

	return uid, nil
}

func (r *repository) HaveRefreshToken(ctx context.Context, refreshToken string) error {
	query := "SELECT * FROM user_refresh_tokens WHERE token = $1 AND expiry_time < $2"
	q := r.db.QueryRowContext(ctx, query, refreshToken, time.Now())
	err := q.Err()
	if err != nil {
		switch {
		case err == sql.ErrNoRows:
			return domain.RefreshTokenExpired
		default:
			return err
		}
	}

	return nil
}

func (r *repository) UpdateRefreshToken(ctx context.Context, refreshToken string, expireAt time.Time) error {
	query := "UPDATE user_refresh_tokens SET expiry_time=$1 WHERE token = $2"
	err := r.db.QueryRowContext(ctx, query, expireAt, refreshToken)
	if err != nil {
		return err.Err()
	}

	return nil
}
