USE sakila;

SELECT c.city_id, c.city, a.first_name, a.last_name, a.email, b.address
FROM customer a JOIN address b on a.address_id = b.address_id JOIN city c on b.city_id = c.city_id 
JOIN country d ON c.country_id = d.country_id
where c.city_id='312';


SELECT a.film_id, a.title, a.description, a.release_year, a.rating, a.special_features, c.name
FROM film a JOIN film_category b on a.film_id = b.film_id JOIN category c on b.category_id = c.category_id
where c.name='Comedy';


SELECT c.actor_id, CONCAT(c.first_name,"",c.last_name) as Actor_name , a.title, a.description, a.release_year
FROM film a JOIN film_actor b on a.film_id = b.film_id JOIN actor c on b.actor_id = c.actor_id
where c.actor_id='5';


SELECT a.first_name, a.last_name, a.email, b.address
FROM customer a JOIN address b on a.address_id = b.address_id
where a.store_id ='1' and b.city_id in ('1','42','312','459');


SELECT a.title, a.description, a.release_year, a.rating, a.special_features
FROM film a JOIN film_actor b on a.film_id=b.film_id
where a.rating='G' and a.special_features like '%Behind the Scenes' and b.actor_id='15';


SELECT a.film_id, a.title, c.actor_id, CONCAT(c.first_name," ",c.last_name) as Actor_name
FROM film a JOIN film_actor b on a.film_id = b.film_id JOIN actor c on c.actor_id = b.actor_id
where a.film_id='369';

SELECT a.title, a.description, a.release_year, a.rating, a.special_features, c.name as genero
FROM film a JOIN film_category b on a.film_id = b.film_id JOIN category c on b.category_id = c.category_id
where c.name='Drama' and a.rental_rate='2.99';

 
SELECT  CONCAT(e.first_name," ",e.last_name), a.title, a.description, a.release_year, a.rating, a.special_features, c.name as genero
FROM film a JOIN film_category b on a.film_id = b.film_id JOIN category c on b.category_id = c.category_id JOIN film_actor d on a.film_id = d.film_id JOIN actor e on e.actor_id = d.actor_id 
where c.name='Action' and e.first_name='Sandra' and e.last_name='Kilmer';