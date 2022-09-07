--from the terminal run:
--psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
    id SERIAL PRIMARY key,
    first_name TEXT,
    last_name TEXT,
    education   TEXT,
    specialization  TEXT
    
);

CREATE TABLE patients
(
    id SERIAL PRIMARY key,
    first_name TEXT,
    last_name TEXT,
    dob DATE,
    insurance   TEXT,
    description TEXT
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY key,
    name TEXT,
    description TEXT
);


CREATE TABLE visits
(
    id SERIAL PRIMARY key,
    doctor_id int REFERENCES doctors,
    patient_id int REFERENCES patients,
    date DATE
);


CREATE TABLE diagnoses
(
    id SERIAL PRIMARY key,
    visit_id int REFERENCES visits,
    disease_id int REFERENCES diseases,
    notes TEXT

);