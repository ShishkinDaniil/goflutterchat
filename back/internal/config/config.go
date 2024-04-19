package config

import (
	"time"
)

type (
	Config struct {
		HTTP HTTPConfig
		Auth AuthConfig
	}

	HTTPConfig struct {
		Host string `mapstructure:"host"`
		Port string `mapstructure:"port"`
	}

	AuthConfig struct {
		AccessTokenTTL  time.Duration
		RefreshTokenTTL time.Duration
	}
)
