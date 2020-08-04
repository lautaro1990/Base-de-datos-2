use sakila;


SELECT *
  FROM film
      INNER JOIN `language`
              ON film.language_id = `language`.language_id;
              
SELECT * 
FROM `language`, film 
WHERE film.language_id = `language`.language_id ;

SELECT *
  FROM film
      INNER JOIN `language`
           USING (language_id);
           
           
SELECT * 
  FROM film 
       INNER JOIN film_category 
               ON film.film_id = film_category.film_id 
       INNER JOIN category 
               ON film_category.category_id = category.category_id; 

-- same?
SELECT *
  FROM film, film_category, category
 WHERE film.film_id = film_category.film_id
   AND film_category.category_id = category.category_id;               

-- with using
SELECT * 
  FROM film 
       INNER JOIN film_category 
            USING ( film_id ) 
       INNER JOIN category 
            USING ( category_id );  
            
  SELECT *
  FROM film
      NATURAL JOIN `language` ;  
      
  SELECT title, rental.*
  FROM film
       INNER JOIN inventory USING (film_id)       
       LEFT OUTER JOIN rental USING (inventory_id)
WHERE store_id = 1 
AND film_id = 1;
            
