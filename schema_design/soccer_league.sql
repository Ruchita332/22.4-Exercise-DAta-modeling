--from the terminal run:
--psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(25),
    dob DATE
    );

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(25),
    description TEXT,
    city TEXT
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY key,
    start_date DATE,
    end_date DATE
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(25),
    dob DATE,
    skills TEXT,
    current_teamID INTEGER REFERENCES teams
);



CREATE TABLE matches   
(
    id SERIAL PRIMARY KEY,
    team_1 INTEGER REFERENCES teams,
    team_2 INTEGER REFERENCES teams,
    referee INTEGER REFERENCES referees,
    season_id INTEGER REFERENCES seasons,
    date DATE,
    location TEXT
);



CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    team_id INTEGER REFERENCES teams,
    matches_id INTEGER REFERENCES matches
    -- leagues_id INTEGER references leagues
);

CREATE TABLE rankings --(is there a better way to do record ranking)
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams,
    season_id INTEGER REFERENCES seasons,
    ranking INTEGER
);
