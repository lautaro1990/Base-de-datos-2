use sakila;
-- 1
select postal_code from address where postal_code in
(select postal_code from address 
inner join city using (city_id)
inner join country using (country_id)
where country_id between 1 and 10);


select postal_code from address where postal_code in
(select postal_code from address 
inner join city using (city_id)
inner join country using (country_id)
where country like('%a'));

create index postal_code on address(postal_code);

/*El tiempo que tardo en ejecutar las consultas bajo 1ms en cada uno cuando se hizo el indice.*/

 -- 2

select first_name from film 
inner join film_actor using(film_id)
inner join actor using ( actor_id)
where film_id = 3
;

select last_name from film 
inner join film_actor using(film_id)
inner join actor using ( actor_id)
where film_id = 3
;

/*La consulta con last_name tardo menos porque tiene un indice , en cambio first_name no lo tiene*/

-- 3

