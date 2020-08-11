use sakila;

-- 1
select concat(first_name,' ', last_name) as 'name', address.address, city.city from customer
inner join address using (address_id)
inner join city using (city_id)
inner join country using (country_id)
where country = 'Argentina'
;

-- 2
select title, language.name,
case
when rating = 'PG' then '(Parental Guidance Suggested)'
when rating = 'G' then '(General Audiences)'
when rating = 'NC-17' then '(Adults Only)'
when rating = 'PG-13' then '(Parents Strongly Cautioned)'
when rating = 'R' then '(Restricted'
end as rating

from film
inner join language using (language_id)
;

-- 3 

select title, release_year, concat(first_name, last_name) as 'actor' from film
inner join film_actor using (film_id)
inner join actor using (actor_id)
where concat(first_name, last_name) like '%penelopeguiness%';

-- 4 
select film.title , concat(customer.first_name,customer.last_name) as 'customer', rental.return_date from customer
inner join rental using (customer_id)
inner join inventory using (inventory_id)
inner join film using (film_id)
where month(rental_date) between 5 and 6
;

-- 5 
 /*The convert and cast functions do the same, the only difference is that it changes the order of the parameters.
 cast example with rental date : */

select cast(rental_date as time), rental_date from rental;
select cast(rental_date as date), rental_date from rental;


-- 6

/* -The Oracle NVL() function Allows you to replace null with a more meaningful alternative in the results of a query.

-The ISNULL() function returns 1 or 0 depending on whether an expression is NULL.If expression is NULL, this function returns 1. Otherwise, it returns 0.ISNULL() is available on SQL Server.

-The IFNULL() function returns a specified value if the expression is NULL.If the expression is NOT NULL, this function returns the expression. IFNULL() is available on SQL Server.

-The COALESCE() function returns the first non-null value in a list.COALESCE() is available on SQL Server.





