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
	Name     string `json:"name"`
	Email    string `json:"email"`
	Password string `json:"password"`
	Created  string `json:"created"`
}

type RefreshTokenReq struct {
	RefreshToken string `json:"refreshToken"`
}

type UserRes struct {
	Name         string `json:"name"`
	Email        string `json:"email"`
	AccessToken  string `json:"accessToken"`
	RefreshToken string `json:"refreshToken"`
}

type UserBodyRes struct {
	Name  string `json:"name"`
	Email string `json:"email"`
}

type LoginUserReq struct {
	Email    string `json:"email"`
	Password string `json:"password"`
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
	GetUidByToken(ctx context.Context, refreshToken string) (*string, error)
	CreateRefreshToken(ctx context.Context, userUID string, refreshToken string, createAt time.Time, expireAt time.Time) error
	GetUserByUid(ctx context.Context, uid string) (*User, error)
}

type Service interface {
	CreateUser(c context.Context, req *CreateUserReq) (*UserRes, error)
	Login(c context.Context, req *LoginUserReq) (*UserRes, error)
	RefreshTokens(c context.Context, refreshToken string) (*TokenResponse, error)
	GetProfile(c context.Context, req string) (*UserBodyRes, error)
}
