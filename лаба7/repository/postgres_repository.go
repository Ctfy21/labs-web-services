package repository

import (
	"database/sql"
	"fmt"
	"log"

	"lab7-web-services/model"

	_ "github.com/lib/pq"
)

type CommentaryRepository interface {
	AddModeratorStatus(participant_id int) error
	RemoveModeratorStatus(participant_id int) error
	FindOne(participant_id int) *model.Participant
}

type database struct {
	client *sql.DB
}

func New() CommentaryRepository {

	connStr := "postgres://postgres:123456@localhost/lab4-web-services?sslmode=disable"
	db, err := sql.Open("postgres", connStr)

	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Connected to PostgreSQL")

	return &database{
		client: db,
	}
}

func (db *database) AddModeratorStatus(participant_id int) error {
	_, err := db.client.Exec("UPDATE participant SET role = 1 WHERE id = $1", participant_id)
	if err != nil {
		return err
	}
	return nil
}

func (db *database) RemoveModeratorStatus(participant_id int) error {
	_, err := db.client.Exec("UPDATE participant SET role = 0 WHERE id = $1", participant_id)
	if err != nil {
		return err
	}
	return nil
}

func (db *database) FindOne(participant_id int) *model.Participant {
	rows, err := db.client.Query("SELECT * FROM participant WHERE id = $1", participant_id)
	if err != nil {
		panic(err)
	}
	defer rows.Close()
	com := model.SQLParticipant{}
	for rows.Next() {
		err := rows.Scan(&com.Id, &com.Name, &com.Email, &com.Password, &com.Oauth_code, &com.Status, &com.Role, &com.Avatar)
		if err != nil {
			fmt.Println(err)
			continue
		}
	}
	return &model.Participant{
		Id:         com.Id,
		Name:       com.Name.String,
		Email:      com.Email.String,
		Password:   com.Password.String,
		Oauth_code: com.Oauth_code.String,
		Status:     com.Status,
		Role:       com.Role,
		Avatar:     com.Avatar.String,
	}
}
