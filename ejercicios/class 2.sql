CREATE DATABASE IF NOT EXISTS imdb;

USE imdb;

DROP TABLE IF EXISTS film, actor, film_actor;

CREATE TABLE film
(
    film_id INT(11) NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL, 
    descripcion TEXT(300),
    lanzamiento_fecha DATE,
    PRIMARY KEY(film_id)
);

CREATE TABLE actor
(
    actor_id INT(11) NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL, 
    last_name VARCHAR(30),
    PRIMARY KEY(actor_id)
);

CREATE TABLE film_actor
(
    film_id int(11) NOT NULL,
    actor_id int(11) NOT NULL
    
);

ALTER TABLE film ADD last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE actor ADD last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE film_actor ADD CONSTRAINT fk_actor FOREIGN KEY (actor_id)  REFERENCES actor(actor_id);

ALTER TABLE film_actor ADD CONSTRAINT fk_film FOREIGN KEY (film_id)  REFERENCES film(film_id);

