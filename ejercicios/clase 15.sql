use sakila;

-- 1

create or replace view list_of_customer 
as select customer_id, concat(first_name,' ',last_name) as 'full_name', address.address, address.postal_code as 'zip_code' , address.phone, city.city, country.country, case active 
when 1 then "Active"
else "Inactive"
end as status, store_id from customer
inner join address using (address_id)
inner join city using (city_id)
inner join country using (country_id);

select * from list_of_customer;

-- 2

create or replace view film_details 
as select film_id ,title, description, category.name, replacement_cost, length, rating, group_concat(concat(actor.first_name, actor.last_name))as 'actors'
from film
inner join film_category using (film_id)
inner join category using (category_id)
inner join film_actor using (film_id)
inner join actor using (actor_id)
GROUP BY film.film_id;

select * from film_details;

-- 3
create or replace view sales_by_film_category 
as select category.name , count(rental_id) as 'total_rental' from category
inner join film_category using (category_id)
inner join film using (film_id)
inner join inventory using (film_id)
inner join rental using (inventory_id)
group by category.name;

select * from sales_by_film_category;

-- 4 
create or replace view actor_information -- create a view called actor_information
as select actor_id, concat(first_name,' ',last_name) as 'full_name', count(film_id) as 'films acted' -- which will have actor id, first name, last name and the amount of films he/she acted on.
from actor -- here it get data from the actor table
inner join film_actor using (actor_id) 
inner join film using (film_id) -- we join into film table using film_actor table to determine in which film the actor acted 
group by actor_id; -- We group by actor to know the number of films in which each actor acted

select *  from actor_information;

-- 6
/* A Materialized View persists the data returned from the view definition query and automatically 
gets updated as data changes in the underlying tables. It improves the performance of complex queries 
while offering simple maintenance operations. */




