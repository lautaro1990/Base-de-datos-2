use sakila;

-- 1
select f.title , i.inventory_id
from film f
left join inventory i
using (film_id)
where i.film_id is null
;

-- 2

select f.title , i.inventory_id, r.rental_id
from film f
inner join inventory i
on f.film_id = i.film_id
left join rental r
on i.inventory_id = r.inventory_id
where r.rental_id is null
;

-- 3


select 	first_name,last_name,store.store_id,rental_date, return_date, title
from customer
inner join store
on customer.store_id = store.store_id
inner join rental
on customer.customer_id = rental.customer_id
inner join inventory 
on rental.inventory_id = inventory.inventory_id
inner join film
on inventory.film_id = film.film_id
where return_date is not null
order by	store.store_id , last_name

;

-- 4
select sum(amount)as dinero,store.store_id,city , country ,concat(staff.first_name,'-', staff.last_name) as'nombre,apellido'
from payment
inner join staff	using (staff_id)
inner join store	using (store_id)
inner join address	on store.address_id = address.address_id
inner join city	using (city_id)
inner join country	using (country_id)
GROUP BY store.store_id
;




	


