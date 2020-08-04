use sakila;

-- 1
select title , rating ,length
from film  
where length <= all (select length from film)
order by length;


-- 2
SELECT title FROM film f1
	WHERE length < ALL (SELECT length FROM film f2
							  WHERE f2.film_id <> f1.film_id);
   
 -- 3  
SELECT DISTINCT customer.*, address.address, payment.amount as 'lowest payment amount' FROM customer, payment, address
    WHERE customer.customer_id = payment.customer_id
    AND customer.address_id = address.address_id
    AND payment.amount <= ALL (SELECT amount FROM payment WHERE payment.customer_id = customer.customer_id);                              
  
-- 4
select customer.*, payment.amount from customer ,payment
where customer.customer_id = payment.customer_id
and payment.amount >= all (select amount from payment );