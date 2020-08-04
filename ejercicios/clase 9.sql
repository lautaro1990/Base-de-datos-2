USE sakila;

-- 1
select c1.country,c1.country_id, count(c3.city) as city
from country c1, (select c2.city , c2.country_id from city c2) c3
where c1.country_id = c3.country_id
group by country 
order by country,country_id
;
 
-- 2 
select c1.country,c1.country_id, count(c3.city) as city
from country c1, (select c2.city , c2.country_id from city c2) c3
where c1.country_id = c3.country_id
group by country 
having count(c3.city) > 10
order by count(c3.city) desc;

-- 3
select first_name , last_name ,address, count(*) as total_peliculas, (select sum(amount) from payment p where p.customer_id = c.customer_id) as monto
from customer c , rental r ,address a
where a.address_id = c.address_id
and c.customer_id = r.customer_id
group by r.customer_id
order by monto desc
;

-- 4
select  avg(length) , (select c.name from category c where c.category_id = fc.category_id and f.film_id = fc.film_id) as categoria
from film f,film_category fc
group by categoria
order by avg(length) desc
;

-- 5
select f.rating , sum(p.amount) as peliculas_vendidas 
from film f, inventory i, rental r, payment p 
where p.rental_id = r.rental_id 
and r.inventory_id = i.inventory_id 
and i.film_id = f.film_id
group by f.rating;








