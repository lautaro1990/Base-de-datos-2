use sakila;

SELECT f.title ,f.special_features, f.rating 
FROM  film f
WHERE f.rating ="PG-13";

select title,length 
from film 
order by length desc;

select title,rental_rate,replacement_cost
from film
where replacement_cost between 20 and 24;

select f.title, f.rating, c.name, f.special_features
from film f , film_category fc, category c
WHERE f.film_id = fc.film_id 
  AND fc.category_id = c.category_id 
  and f.special_features = 'Behind the Scenes' ;
  

select a.first_name, a.last_name,f.title 
from actor a, film f, film_actor fa
where f.film_id = fa.film_id 
and fa.actor_id = a.actor_id
and f.title = 'ZOOLANDER FICTION'; 

select a.address, c.city, co.country , s.store_id
from country co , city c , address a, store s
where s.address_id = a.address_id
and a.city_id = c.city_id
and c.country_id = co.country_id
and s.store_id = 1;


select f1.title , f2.title , f1.rating 
from film f1 , film f2
where f1.rating = f2.rating and f1.film_id <> f2.film_id;

select DISTINCT f.title, s1.first_name, s1.last_name
from film f,staff s1, inventory i,store s2
where i.store_id = s2.store_id
and i.film_id = f.film_id
and s1.store_id = s2.store_id
and s2.store_id = 2 ;





