use sakila;

-- 1
create user data_analyst identified by 'ahrt234'

-- 2
grant select,update,delete on sakila.* to 'data_analyst' with grant options;

-- 3
create table tabla (
id_test int(10) not null,
primary key (id_test)
);

-- 4
update film set title='xd' where film.film_id = 1;

-- 5
revoke update on sakila.* from data_analyst;

-- 6
update film set title='xd' where film.film_id = 1;
