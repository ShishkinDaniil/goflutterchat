package user

import (
	"back/util"
	"context"
	"time"

	"back/pkg/auth"

	"github.com/google/uuid"
)

type service struct {
	Repository
	timeout         time.Duration
	accessTokenTTL  time.Duration
	refreshTokenTTL time.Duration
	tokenManager    auth.TokenManager
}

func NewService(repository Repository, tokenManager auth.TokenManager) Service {
	return &service{
		repository,
		time.Duration(2) * time.Second,
		24 * time.Hour,
		(24 * 365) * time.Hour,
		tokenManager,
	}
}

func (s *service) CreateUser(c context.Context, req *CreateUserReq) (*UserRes, error) {
	ctx, cancel := context.WithTimeout(c, s.timeout)
	defer cancel()

	hashedPassword, err := util.HashPassword(req.Password)
	if err != nil {
		return nil, err
	}
	userUID, err := uuid.NewUUID()
	if err != nil {
		return nil, err
	}
	chatID, err := uuid.NewUUID()
	if err != nil {
		return nil, err
	}
	createdTime, err := time.Parse("2006-01-02T15:04:05", time.Now().Format("2006-01-02T15:04:05"))
	if err != nil {
		return nil, err
	}
	u := &User{
		UID:      userUID,
		Name:     req.Name,
		Email:    req.Email,
		Password: hashedPassword,
		Created:  createdTime,
		ChatId:   chatID,
	}

	r, createErr := s.Repository.CreateUser(ctx, u)
	if createErr != nil {
		return nil, createErr
	}

	refreshToken, err := s.tokenManager.NewRefreshToken()
	if err != nil {
		return nil, err
	}
	err = s.Repository.CreateRefreshToken(ctx, u.UID.String(), refreshToken, createdTime, createdTime.Add(s.refreshTokenTTL))
	if err != nil {
		return nil, err
	}
	ss, err := s.tokenManager.NewJWT(u.UID.String(), s.accessTokenTTL)
	if err != nil {
		return nil, err
	}

	res := &UserRes{
		Name:         r.Name,
		Email:        r.Email,
		RefreshToken: refreshToken,
		AccessToken:  ss,
		ChatId:       r.ChatId.String(),
	}

	return res, nil
}

func (s *service) Login(c context.Context, req *LoginUserReq) (*UserRes, error) {
	ctx, cancel := context.WithTimeout(c, s.timeout)
	defer cancel()

	u, err := s.Repository.GetUserByEmail(ctx, req.Email)
	if err != nil {
		return nil, err
	}

	err = util.CheckPassword(req.Password, u.Password)
	if err != nil {
		return nil, err
	}
	now := time.Now()
	refreshToken, err := s.tokenManager.NewRefreshToken()
	if err != nil {
		return &UserRes{}, err
	}
	err = s.Repository.CreateRefreshToken(ctx, u.UID.String(), refreshToken, now, now.Add(s.refreshTokenTTL))
	if err != nil {
		return nil, err
	}
	ss, err := s.tokenManager.NewJWT(u.UID.String(), s.accessTokenTTL)
	if err != nil {
		return &UserRes{}, err
	}

	return &UserRes{AccessToken: ss, RefreshToken: refreshToken, Name: u.Name, Email: u.Email, ChatId: u.ChatId.String()}, nil
}

func (s *service) GetProfile(c context.Context, req string) (*UserBodyRes, error) {
	user, err := s.Repository.GetUserByUid(c, req)
	if err != nil {
		return nil, err
	}

	return &UserBodyRes{Name: user.Name, Email: user.Email, ChatId: user.ChatId.String()}, nil
}

func (s *service) RefreshTokens(c context.Context, refreshToken string) (*TokenResponse, error) {
	ctx, cancel := context.WithTimeout(c, s.timeout)
	defer cancel()
	print("HaveRefreshToken")
	errCheck := s.Repository.HaveRefreshToken(ctx, refreshToken)
	if errCheck != nil {
		return nil, errCheck
	}
	print("UpdateRefreshToken")
	errUpdate := s.Repository.UpdateRefreshToken(ctx, refreshToken, time.Now().Add(s.refreshTokenTTL))
	if errUpdate != nil {
		return nil, errUpdate
	}
	print("GetUidByToken")
	uid, errFind := s.Repository.GetUidByToken(ctx, refreshToken)
	if errFind != nil {
		return nil, errFind
	}
	print("NewJWT")
	ss, err := s.tokenManager.NewJWT(*uid, s.accessTokenTTL)
	if err != nil {
		return nil, err
	}

	// token := jwt.NewWithClaims(jwt.SigningMethodHS256, MyJWTClaims{
	// 	UID:  u.UID.String(),
	// 	Name: u.Name,
	// 	RegisteredClaims: jwt.RegisteredClaims{
	// 		Issuer:    u.UID.String(),
	// 		ExpiresAt: jwt.NewNumericDate(time.Now().Add(s.accessTokenTTL)),
	// 	},
	// })

	// ss, err := token.SignedString([]byte(secretKey))
	// if err != nil {
	// 	return nil, err
	// }

	return &TokenResponse{AccessToken: ss, RefreshToken: refreshToken}, nil

}
