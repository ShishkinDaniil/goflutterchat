package user

import (
	"context"

	"time"

	"github.com/google/uuid"
)

type User struct {
	UID      uuid.UUID `json:"uid"`
	Name     string    `json:"name"`
	Email    string    `json:"email"`
	Password string    `json:"password"`
	Created  time.Time `json:"created"`
}

type CreateUserReq struct {
	UID      string `json:"uid"`
	Name     string `json:"name"`
	Email    string `json:"email"`
	Password string `json:"password"`
	Created  string `json:"created"`
}

type RefreshTokenReq struct {
	RefreshToken string `json:"refreshToken"`
}

type CreateUserRes struct {
	UID          string `json:"uid"`
	Name         string `json:"name"`
	Email        string `json:"email"`
	Created      string `json:"created"`
	AccessToken  string `json:"accessToken"`
	RefreshToken string `json:"refreshToken"`
}

type LoginUserReq struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

type LoginUserRes struct {
	accessToken  string
	refreshToken string
	UID          string `json:"uid"`
	Name         string `json:"name"`
}

type TokenResponse struct {
	AccessToken  string `json:"accessToken"`
	RefreshToken string `json:"refreshToken"`
}

type Repository interface {
	CreateUser(ctx context.Context, user *User) (*User, error)
	GetUserByEmail(ctx context.Context, email string) (*User, error)
	DeleteRefreshToken(ctx context.Context, userUID string, refreshToken string) (bool, error)
	UpdateRefreshToken(ctx context.Context, refreshToken string, expireAt time.Time) error
	HaveRefreshToken(ctx context.Context, refreshToken string) error
	GetUidByToken(ctx context.Context, refreshToken string) (string, error)
	CreateRefreshToken(ctx context.Context, userUID string, refreshToken string, createAt time.Time, expireAt time.Time) error
}

type Service interface {
	CreateUser(c context.Context, req *CreateUserReq) (*CreateUserRes, error)
	Login(c context.Context, req *LoginUserReq) (*LoginUserRes, error)
	RefreshTokens(c context.Context, refreshToken string) (*TokenResponse, error)
}
