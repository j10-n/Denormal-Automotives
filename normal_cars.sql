DROP DATABASE IF EXISTS normal_cars;
DROP USER IF EXISTS normal_user;
CREATE USER normal_user;
CREATE DATABASE normal_cars WITH OWNER normal_user;
\timing
\c normal_cars;
\i scripts/denormal_data.sql;a
CREATE TABLE makeTable(
    ID SERIAL NOT NULL PRIMARY KEY,
    make_code character varying(125) NOT NULL,
    make_title character varying(125) NOT NULL
);
INSERT INTO makeTable (make_code, make_title)
SELECT DISTINCT make_code, make_title FROM car_models;

CREATE TABLE modelTable(
    ID SERIAL NOT NULL PRIMARY KEY,
    model_code character varying(125) NOT NULL,
    model_title character varying(125) NOT NULL
);
INSERT INTO modelTable (model_code, model_title)
SELECT DISTINCT model_code, model_title FROM car_models;

CREATE TABLE yearTable(
    ID SERIAL NOT NULL PRIMARY KEY,
    year integer NOT NULL
);
INSERT INTO yearTable (year)
SELECT DISTINCT year FROM car_models ;

SELECT DISTINCT make_code, make_title FROM car_models;
SELECT DISTINCT model_code, model_title FROM car_models WHERE make_code = 'VOLKS';
SELECT DISTINCT make_code, model_code, model_title, year FROM car_models WHERE make_code = 'LAM';
SELECT DISTINCT COUNT(*) FROM car_models WHERE year BETWEEN 2010 AND 2015;
