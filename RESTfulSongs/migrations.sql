CREATE DATABASE restfulsongs;
\c restfulsongs

CREATE TABLE songs (id SERIAL PRIMARY KEY, name VARCHAR(255), artist VARCHAR(255));
