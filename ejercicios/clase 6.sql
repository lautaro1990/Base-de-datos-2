use sakila;

select * from actor a1
where exists ( select * from actor a2 where a1.last_name = a2.last_name and a1.actor_id <> a2.actor_id )
order by last_name asc ;

select * from actor
where not exists ( select actor_id from film_actor );

#no me salio
SELECT * FROM customer
WHERE (SELECT count(*) FROM rental WHERE rental.customer_id = customer.customer_id) = 1;  


    
SELECT * FROM customer
	WHERE (SELECT count(*) FROM rental WHERE rental.customer_id = customer.customer_id) > 1;
    
select * from actor
where actor_id in (select actor_id from film_actor where film_id in ( select film_id from film where title = 'BETRAYED REAR' or title = 'CATCH AMISTAD'));
  
select * from actor
where actor_id in (select actor_id from film_actor where film_id in ( select film_id from film where title = 'BETRAYED REAR' )
and actor_id  not in (select actor_id from film_actor where film_id in ( select film_id from film where title = 'CATCH AMISTAD' )));
  
select * from actor
where actor_id not in (select actor_id from film_actor where film_id in ( select film_id from film where title = 'BETRAYED REAR' or title = 'CATCH AMISTAD'));
  
  