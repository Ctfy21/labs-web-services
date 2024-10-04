package model

import "database/sql"

type Participant struct {
	Id         int    `json:"id"`
	Name       string `json:"name"`
	Email      string `json:"email"`
	Password   string `json:"password"`
	Oauth_code string `json:"oauth_code"`
	Status     int    `json:"status"`
	Role       int    `json:"role"`
	Avatar     string `json:"avatar"`
}

type SQLParticipant struct {
	Id         int            `json:"id"`
	Name       sql.NullString `json:"name"`
	Email      sql.NullString `json:"email"`
	Password   sql.NullString `json:"password"`
	Oauth_code sql.NullString `json:"oauth_code"`
	Status     int            `json:"status"`
	Role       int            `json:"role"`
	Avatar     sql.NullString `json:"avatar"`
}
