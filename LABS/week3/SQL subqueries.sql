use sakila;

# 1. List all films whose length is longer than the average of all the films.
select title from film
where length > (select avg(length) from film);

# 2. How many copies of the film Hunchback Impossible exist in the inventory system?
select * from inventory;
select title from film;

select film_id, count(inventory_id) from inventory
where film_id = (select film_id from film 
				where title ='HUNCHBACK IMPOSSIBLE')
group by film_id;

# 3. Use subqueries to display all actors who appear in the film Alone Trip.
select first_name, last_name from actor
where actor_id in (select actor_id from film_actor
				where film_id in (select film_id from film
								where title = "ALONE TRIP"));

# 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
select name from category;

select title from film
where film_id in (select film_id from film_category
				where category_id in (select category_id from category
									where name = "Family"));

# 5. Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
select first_name, last_name, email from customer
where address_id in (select address_id from address
					where city_id in (select city_id from city
									where country_id in (select country_id from country
														where country = "Canada")));

select first_name, last_name, email from customer
join address using (address_id)
join city using (city_id)
join country using(country_id)
where country = "Canada";

# 6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

select title from film
where film_id in (select film_id from film_actor
				where actor_id = (select distinct count(actor_id) from film_actor
									group by actor_id
                                    order by actor_id desc));

select actor_id, count(film_id) from film_actor
group by actor_id
order by count(film_id) desc; # actor_id = 107

select title from film
where film_id in (select film_id from film_actor
				where actor_id = 107);

# 7. Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
select title from film
where film_id in (select film_id from inventory
				where inventory_id in (select inventory_id from rental
									where customer_id in (select customer_id from payment
													where amount = (select max(amount) from payment))));
                                                    


# 8. Customers who spent more than the average payments(this refers to the average of all amount spent per each customer).
select sum(amount) from payment
group by customer_id;

select first_name, last_name, sum(amount) as total_paid from customer
join payment using(customer_id)
group by customer_id
having total_paid > (select avg(amount) from payment)
order by first_name;

select SUM(amount) as total_paid from payment group by customer_id;

select avg(total_paid) as total_paid from (select SUM(amount) as total_paid from payment group by customer_id) as tablename;

select avg(amount) from payment group by customer_id;
select avg(amount) from payment;
select amount from payment;