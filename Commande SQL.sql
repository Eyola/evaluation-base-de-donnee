CREATE DATABASE IF NOT EXISTS cinema;

use cinema;

CREATE TABLE movie (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  title varchar(50) NOT NULL UNIQUE
); 

CREATE TABLE price (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  rate varchar(50) NOT NULL UNIQUE,
  price decimal(4,2) NOT NULL
);

CREATE TABLE user_role (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  role_name varchar(50) NOT NULL UNIQUE
); 

CREATE TABLE theater (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  theater_name varchar(50) NOT NULL UNIQUE
); 

CREATE TABLE screening (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  date_time datetime NOT NULL,
  movie_id int(11) NOT NULL,
  theater_id int(11) NOT NULL,
  FOREIGN KEY (movie_id) REFERENCES movie (id),
  FOREIGN KEY (theater_id) REFERENCES theater (id)
); 

CREATE TABLE user (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  last_name varchar(50) NOT NULL,
  first_name varchar(50) NOT NULL,
  email tinytext UNIQUE NOT NULL,
  password varchar(60) NOT NULL,
  role_id int(11) NOT NULL,
  FOREIGN KEY (role_id) REFERENCES user_role (id)
); 

CREATE TABLE ticket (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  price_id int(11) NOT NULL,
  screening_id int(11) NOT NULL,
  FOREIGN KEY (price_id) REFERENCES price (id),
  FOREIGN KEY (screening_id) REFERENCES screening (id),
  FOREIGN KEY (user_id) REFERENCES user (id)
); 

INSERT INTO user_role (role_name) VALUES ('administrateur'), ('employe'), ('client');
INSERT INTO price (rate, price) VALUES ('Plein tarif','9.20'), ('Etudiant','7.60'), ('Moins de 14 ans','5.90');
INSERT INTO theater (theater_name) VALUES ('2 Lions'), ('Place Sainte-Anne'), ('Studio');
INSERT INTO movie (title) VALUES ('Les 3 petits cochons'), ('Aladdin'), ('Star Wars IV'), ('Forest Gump');

INSERT INTO user (last_name, first_name, email, password, role_id) 
    VALUES 
    ('Wayne', 'Bruce', 'bruce@wayne.fr', '0000', '1'),
    ('Doe', 'John', 'john@doe.fr', '0000', '1'), 
    ('Parker', 'Peter', 'peter@parker.com', '0000', '2'), 
    ('Skywalker', 'Luke', 'luke@skywalker.fr', '0000', '2'),
    ('Schwarzenegger', 'Arnold', 'arnold@Schwarzenegger.fr', '0000', '3'),
    ('Hanks', 'Tom', 'tom@hanks.fr', '0000', '3'),
    ('Granger', 'Ermionne', 'ermionne@granger.fr', '0000', '3');

INSERT INTO screening (date_time, movie_id, theater_id) 
    VALUES 
        ('2024-04-03 13:00:00', '1', '1'),
        ('2024-04-08 14:00:00', '2', '3'),
        ('2024-04-03 13:00:00', '1', '2'),
        ('2024-05-08 10:00:00', '3', '3');

INSERT INTO ticket (user_id, price_id, screening_id)
    VALUES
        ('6', '1', '4'),
        ('6', '1', '4'),
        ('5', '1', '1'),
        ('6', '2', '4'),
        ('6', '3', '4'),
        ('7', '1', '2'),
        ('7', '1', '2');






