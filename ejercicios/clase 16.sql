use sakila;

create table `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `jobTitle` varchar(50) NOT NULL,
  primary key (`employeeNumber`)
);

describe employees;

-- 1- Insert a new employee to , but with an null email. Explain what happens.

insert into `employees` (`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`jobTitle`) values
(1,'Perez','Juan','x2020','1','aaaaa');

-- Does not allow inserting an employee because the email cannot be null.

 -- 2- Run the first the query

UPDATE employees SET employeeNumber = employeeNumber - 20;

-- Change the employeeNumber by subtracting 20
UPDATE employees SET employeeNumber = employeeNumber + 20;

-- 3- Add a age column to the table employee where and it can only accept values from 16 up to 70 years old.

alter table employees add age int not null check(age >= 16 && age <= 70);

-- 4- Describe the referential integrity between tables film, actor and film_actor in sakila db.
/*La relacion entre las tablas film y la tabla actor es una relacion many to many por lo que requiere de una tabla intermedia entre estas dos, la tabla film_actor.Esto 
ocurre ya que en una pelicula pueden actuar varios actores y un actor pueden actuar en varias peliculas. */


/* 5- Create a new column called lastUpdate to table employee and use trigger(s) to keep the date-time updated 
on inserts and updates operations. Bonus: add a column lastUpdateUser and the respective trigger(s) to specify who
 was the last MySQL user that changed the row (assume multiple users, other than root, can connect to MySQL and change this table).*/

alter table employees add last_update DATETIME;
  
-- insert
create trigger update_insert before insert on employees
for each row 
    begin 
        set new.last_update = CURRENT_TIMESTAMP(); 
    end;

-- update
create trigger update_update before update on employees
for each row 
    begin 
        set new.last_update = CURRENT_TIMESTAMP(); 
    end;

  
  

