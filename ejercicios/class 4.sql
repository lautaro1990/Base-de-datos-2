SELECT * From film;

SELECT title ,special_features, rating FROM  film f WHERE rating ="PG-13";

SELECT DISTINCT title ,rental_duration FROM  film f;

SELECT title, rental_rate, replacement_cost FROM  film f WHERE replacement_cost BETWEEN 20.00 and 24.00;

SELECT title, description , rating FROM film f  WHERE special_features LIKE "%Behind the Scenes%";

SELECT DISTINCT a.first_name , a.last_name, f.title FROM actor a , film f , film_actor fa where fa.film_id = f.film_id AND f.title ="ZOOLANDER FICTION";

SELECT a2.address, c2.city, c3.country FROM store s2, address a2, city c2 , country c3 WHERE s2.store_id =1 AND s2.address_id = a2.address_id AND a2.city_id = c2.city_id AND c2.country_id = c3.country_id;

SELECT f2.title, f2.rating FROM film f2 WHERE f2.rating IN(SELECT f3.rating FROM film f3 WHERE f2.rating = f3.rating);

SELECT f2.title, f2.rating FROM  film f2 , (SELECT f3.rating FROM film f3 ) f4 WHERE f2.rating = f4.rating;

SELECT DISTINCT f3.* ,s3.first_name , s3.last_name FROM film f3, staff s3 , inventory i2, store s2 WHERE i2.store_id = s2.store_id AND i2.film_id = f3.film_id AND s3.store_id = s2.store_id AND s3.store_id = 2; 

