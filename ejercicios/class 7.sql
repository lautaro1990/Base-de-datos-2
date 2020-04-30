#1
SELECT * FROM actor a1 
	WHERE EXISTS (SELECT first_name, last_name  FROM actor a2 
				      WHERE a1.last_name = a2.last_name 
					  AND a1.actor_id <> a2.actor_id) 
	ORDER BY last_name;
	
#2
SELECT * FROM actor
	WHERE NOT EXISTS (SELECT actor_id FROM film_actor);

#3
SELECT * FROM customer
	WHERE (SELECT count(*) FROM rental WHERE rental.customer_id = customer.customer_id) = 1;

#4
SELECT * FROM customer
	WHERE (SELECT count(*) FROM rental WHERE rental.customer_id = customer.customer_id) > 1;

#5
SELECT * FROM actor
	WHERE actor_id IN (SELECT actor_id FROM film_actor
					   	   WHERE film_id IN (SELECT film_id FROM film
					   					         WHERE title = 'BETRAYED REAR' OR title = 'CATCH AMISTAD'));
					   					        
#6
SELECT * from actor
	WHERE actor_id IN (SELECT actor_id FROM film_actor
					       WHERE film_id = (SELECT film_id FROM film WHERE title = 'BETRAYED REAR')
	AND actor_id NOT IN (SELECT actor_id FROM film_actor
					         WHERE film_id = (SELECT film_id FROM film WHERE title = 'CATCH AMISTAD')));

#7            				     
SELECT * from actor
	WHERE actor_id IN (SELECT actor_id FROM film_actor
					       WHERE film_id = (SELECT film_id FROM film WHERE title = 'BETRAYED REAR')
	AND actor_id IN (SELECT actor_id FROM film_actor
					     WHERE film_id = (SELECT film_id FROM film WHERE title = 'CATCH AMISTAD')));
					      
#8
SELECT * FROM actor
	WHERE actor_id NOT IN (SELECT actor_id FROM film_actor
							   WHERE film_id = (SELECT film_id FROM film WHERE title = 'BETRAYED REAR'))
	AND actor_id NOT IN (SELECT actor_id FROM film_actor
							 WHERE film_id = (SELECT film_id FROM film WHERE title = 'CATCH AMISTAD'));