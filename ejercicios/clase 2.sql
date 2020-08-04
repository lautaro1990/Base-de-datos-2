create database if not exists imdb;

use imdb;

drop table if exists film, actor, film_actor;

CREATE TABLE film (
    film_id INT AUTO_INCREMENT,
    titulo VARCHAR(100) not null,
    descripcion TEXT(300),
    fecha_lanzamiento DATE,
    PRIMARY KEY (film_id)
);

CREATE TABLE actor (
    actor_id INT AUTO_INCREMENT,
    first_name VARCHAR(30) not null,
    last_name VARCHAR(30) not null,
    PRIMARY KEY (actor_id)
);

CREATE TABLE film_actor (
    actor_id INT(20) not null ,
    film_id INT(20) not null
  
);

alter table film add last_update timestamp after film_id;

alter table actor add last_update timestamp after actor_id;

alter table film_actor add constraint fk_actor foreign key (actor_id) references actor(actor_id);

alter table film_actor add constraint fk_film foreign key (film_id) references film(film_id);

insert into film (titulo,last_update, descripcion, fecha_lanzamiento) values ('scoobydoo', '2001-08-02 11:34:30','xxxxxxxxxxxxxxxx', '2001-08-02'); 
insert into actor (last_update,first_name, last_name) values ('2001-08-02 11:34:30','pepe', 'mujica'); 

insert into film (titulo,last_update, descripcion, fecha_lanzamiento) values ('scoobydoo2', '2002-08-02 11:34:30','xxxxxxxxxxxxxxxx', '2002-08-02'); 
insert into actor (last_update,first_name, last_name) values ('2001-08-02 11:34:30','popoe', 'mujica'); 

insert into film (titulo,last_update, descripcion, fecha_lanzamiento) values ('scoobydoo3', '2003-08-02 11:34:30','xxxxxxxxxxxxxxxx', '2003-08-02'); 
insert into actor (last_update,first_name, last_name) values ('2001-08-02 11:34:30','preew', 'mujica'); 

insert into film_actor (actor_id, film_id) values (1, 2); 
insert into film_actor (actor_id, film_id) values (1, 3); 

