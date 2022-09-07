--from the terminal run:
--psql < craiglist.sql

DROP DATABASE IF EXISTS craiglist;

CREATE DATABASE craiglist;

\c craiglist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT,
    description TEXT
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(15) NOT NULL,
    password VARCHAR (15) NOT NULL,
    preferred_region_id INTEGER REFERENCES regions
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title  TEXT,
    post_description TEXT,
    location TEXT, -- Q best data format to add location
    user_id INTEGER REFERENCES users,
    region_id INTEGER REFERENCES regions,
    category_id INTEGER REFERENCES categories
);



