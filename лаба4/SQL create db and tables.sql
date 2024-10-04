-- DROP DATABASE lab4_design_web_services;

-- CREATE DATABASE lab4_design_web_services;

CREATE TABLE participant (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60),
    email VARCHAR(256),
    password VARCHAR(64),
    oauth_code VARCHAR(1024),
    status INTEGER NOT NULL,
    role INTEGER NOT NULL,
    avatar VARCHAR(1024),
    CHECK((password != NULL AND email != NULL) OR oauth_code != NULL)
);

CREATE TABLE section (
    section_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    count_theme INTEGER NOT NULL
);

CREATE TABLE theme (
    theme_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    section_id INTEGER REFERENCES section (section_id),
    first_message VARCHAR(3000),
    count_message INTEGER,
    timestamp date
);

CREATE TABLE tag (
    tag_id SERIAL PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE commentary (
    commentary_id SERIAL PRIMARY KEY,
    participant_id INTEGER REFERENCES participant (id),
    topic VARCHAR(200),
    content VARCHAR(3000),
    count_likes INTEGER,
    theme_id INTEGER REFERENCES theme (theme_id),
    timestamp date,
    commentary_type BOOLEAN,
    reply_commentary_id INTEGER REFERENCES commentary (commentary_id),
    tag_id INTEGER REFERENCES tag (tag_id)
);

CREATE TABLE log (
    log_id SERIAL PRIMARY KEY,
    type_of_logs integer,
    log_message VARCHAR(3000),
    timestamp date
);

CREATE TABLE notification (
    notification_id SERIAL PRIMARY KEY,
    topic VARCHAR(50),
    content VARCHAR(500),
    sender_id INTEGER REFERENCES participant (id),
    receiver_id INTEGER REFERENCES participant (id)
);