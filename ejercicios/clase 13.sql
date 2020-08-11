use sakila;


-- 1
insert into customer
(store_id, first_name, last_name, email, address_id, active, create_date, last_update)
select 1, 'Juan', 'Perez', 'juanperez@gmail.com', MAX(address_id), 1, current_timestamp, current_timestamp FROM address
inner join city on address.city_id = city.city_id
inner join country on city.country_id = country.country_id
where country = 'United States';
        
-- 2
insert into rental
(rental_date, inventory_id, customer_id, staff_id)
select current_timestamp, MAX(inventory_id), 1, (SELECT MAX(staff_id) FROM staff WHERE staff.store_id = inventory.store_id) from inventory
inner join film on inventory.film_id = film.film_id
where film.title = 'ALICE FANTASIA'
AND store_id = 2;
   

-- 3

update film
set release_year = 2001
where rating = 'PG';

update film
set release_year = 2002
where rating = 'G';

update film
set release_year = 2003
where rating = 'NC-17';

update film
set release_year = 2004
where rating = 'PG-13';

update film
set release_year = 2005
where rating = 'R';

-- 4

    
-- 5

delete from film_actor 
where film_id = 2;

delete from film_category 
where film_id = 2;

delete from inventory 
where film_id = 2;

delete from film
where film_id = 2;

-- 6



    

                          