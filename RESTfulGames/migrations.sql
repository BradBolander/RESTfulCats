CREATE DATABASE restfulgames;
\c restfulgames

CREATE TABLE games (id SERIAL PRIMARY KEY, name VARCHAR(255), studio VARCHAR(255), releaseyear VARCHAR(255), genre VARCHAR(255));
