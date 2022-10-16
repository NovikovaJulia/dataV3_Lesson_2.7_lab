-- dataV3_Lesson_2.7_lab
USE sakila;


-- 1. How many films are there for each of the categories in the category table.
-- Use appropriate join to write this query.
SELECT c.category_id , COUNT(fc.film_id) as number_of_films FROM sakila.category AS c
JOIN sakila.film_category AS fc
ON c.category_id = fc.category_id
GROUP BY c.category_id;


-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT s.staff_id, SUM(p.amount) as total_amount FROM sakila.staff as s
JOIN sakila.payment p
ON s.staff_id = p.staff_id
WHERE YEAR(p.payment_date) = '2005' AND MONTH(p.payment_date) = '8'
GROUP BY s.staff_id;


-- 3. Which actor has appeared in the most films?
SELECT a.first_name AS actor_name, a.last_name AS actor_surname, count(fa.film_id) AS number_of_films FROM sakila.actor AS a
JOIN sakila.film_actor AS fa
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id;


-- 4. Most active customer (the customer that has rented the most number of films)
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.customer_id) as rented_films FROM sakila.customer AS c
JOIN sakila.rental AS r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY rented_films DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address FROM sakila.staff as s
JOIN sakila.address as a
ON s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film.
SELECT f.film_id, f.title, COUNT(actor_id) AS number_of_actors FROM sakila.film as f
JOIN sakila.film_actor as fa
ON f.film_id = fa.film_id
GROUP BY f.film_id;

-- 7. Using the tables payment and customer and the JOIN command,
-- list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, SUM(p.amount) AS paid_total FROM sakila.customer as c
JOIN sakila.payment as p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name;

-- 8. List number of films per category.
SELECT c.category_id, c.name, COUNT(fc.film_id) AS number_of_films FROM sakila.category as c
JOIN sakila.film_category as fc
ON c.category_id = fc.category_id
GROUP BY c.category_id;