package domain

import "errors"

var (
	ErrUserNotFound      = errors.New("user doesn't exists")
	ErrUserAlreadyExists = errors.New("user with such email already exists")
	RefreshTokenExpired  = errors.New("RefreshTokenExpired")
)
