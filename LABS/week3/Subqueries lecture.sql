use bank;

SELECT account_id from loan
where amount > (select avg(amount) from loan);

use sakila;

select first_name, last_name from actor
where actor_id > 10;

select first_name, last_name from actor
inner join film_actor using (actor_id)
where film_id=1;

select first_name, last_name from actor
where actor_id in (select actor_id from film_actor
				where film_id = 1); # we write "in" because it is a list.

select first_name, last_name from actor
where actor_id in (select actor_id from film_actor
				where film_id = (select film_id from film
								where title = 'Academy Dinosaur'));

