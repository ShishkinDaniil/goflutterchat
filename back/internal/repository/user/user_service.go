package user

import (
	"back/util"
	"context"
	"time"

	"back/pkg/auth"

	"github.com/golang-jwt/jwt/v4"
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

func (s *service) CreateUser(c context.Context, req *CreateUserReq) (*CreateUserRes, error) {
	ctx, cancel := context.WithTimeout(c, s.timeout)
	defer cancel()

	hashedPassword, err := util.HashPassword(req.Password)
	if err != nil {
		return nil, err
	}
	userUID, err := uuid.Parse(req.UID)
	if err != nil {
		return nil, err
	}
	createdTime, err := time.Parse("2006-01-02T15:04:05", req.Created)
	if err != nil {
		return nil, err
	}
	u := &User{
		UID:      userUID,
		Name:     req.Name,
		Email:    req.Email,
		Password: hashedPassword,
		Created:  createdTime,
	}

	r, err := s.Repository.CreateUser(ctx, u)
	if err != nil {
		return nil, err
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

	res := &CreateUserRes{
		UID:          r.UID.String(),
		Name:         r.Name,
		Email:        r.Email,
		Created:      r.Created.String(),
		RefreshToken: refreshToken,
		AccessToken:  ss,
	}

	return res, nil
}

type MyJWTClaims struct {
	UID  string `json:"UID"`
	Name string `json:"name"`
	jwt.RegisteredClaims
}

func (s *service) Login(c context.Context, req *LoginUserReq) (*LoginUserRes, error) {
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
		return &LoginUserRes{}, err
	}
	err = s.Repository.CreateRefreshToken(ctx, u.UID.String(), refreshToken, now, now.Add(s.refreshTokenTTL))
	if err != nil {
		return nil, err
	}
	ss, err := s.tokenManager.NewJWT(u.UID.String(), s.accessTokenTTL)
	if err != nil {
		return &LoginUserRes{}, err
	}

	// token := jwt.NewWithClaims(jwt.SigningMethodHS256, MyJWTClaims{
	// 	UID:  u.UID.String(),
	// 	Name: u.Name,
	// 	RegisteredClaims: jwt.RegisteredClaims{
	// 		Issuer:    u.UID.String(),
	// 		ExpiresAt: jwt.NewNumericDate(time.Now().Add(24 * time.Hour)),
	// 	},
	// })

	// ss, err := token.SignedString([]byte(secretKey))
	// if err != nil {
	// 	return nil, err
	// }

	return &LoginUserRes{accessToken: ss, refreshToken: refreshToken, Name: u.Name, UID: u.UID.String()}, nil
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
	ss, err := s.tokenManager.NewJWT(uid, s.accessTokenTTL)
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
