package repository

import (
	"database/sql"
	"fmt"
	"log"

	"github.com/Ctfy21/lab6-web-services/graph/model"
	_ "github.com/lib/pq"
)

type CommentaryRepository interface {
	AddLike(commentarty_id int) error
	RemoveLike(commentarty_id int) error
	FindAll() []*model.Commentary
	FindOne(commentarty_id int) *model.Commentary
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

func (db *database) AddLike(commentarty_id int) error {
	_, err := db.client.Exec("UPDATE commentary SET count_likes = count_likes + 1 WHERE commentary_id = $1", commentarty_id)
	if err != nil {
		return err
	}
	return nil
}

func (db *database) RemoveLike(commentarty_id int) error {
	_, err := db.client.Exec("UPDATE commentary SET count_likes = count_likes - 1 WHERE commentary_id = $1", commentarty_id)
	if err != nil {
		return err
	}
	return nil
}

func (db *database) FindAll() []*model.Commentary {
	rows, err := db.client.Query("select * from commentary")
	if err != nil {
		panic(err)
	}
	defer rows.Close()
	commentaries := []*model.Commentary{}

	for rows.Next() {
		com := model.Commentary{}
		err := rows.Scan(&com.CommentartyID, &com.UserID, &com.Topic, &com.Content, &com.CountLikes, &com.ThemeID, &com.Timestamp, &com.MessageType, &com.ReplyMessageID, &com.TagID)
		if err != nil {
			fmt.Println(err)
			continue
		}
		commentaries = append(commentaries, &com)
	}
	return commentaries
}

func (db *database) FindOne(commentarty_id int) *model.Commentary {
	rows, err := db.client.Query("SELECT * FROM commentary WHERE commentary_id = $1", commentarty_id)
	if err != nil {
		panic(err)
	}
	defer rows.Close()
	com := model.Commentary{}
	for rows.Next() {
		err := rows.Scan(&com.CommentartyID, &com.UserID, &com.Topic, &com.Content, &com.CountLikes, &com.ThemeID, &com.Timestamp, &com.MessageType, &com.ReplyMessageID, &com.TagID)
		if err != nil {
			fmt.Println(err)
			continue
		}
	}
	return &com
}
