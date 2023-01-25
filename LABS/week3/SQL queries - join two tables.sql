use sakila;

# 1. Which actor has appeared in the most films?
select * from actor;
select * from film_actor;
select distinct first_name, last_name, count(actor_id) from actor
inner join film_actor using (actor_id) 
group by actor_id order by count(actor_id) desc
limit 1;

# 2. Most active customer (the customer that has rented the most number of films)
select * from customer;
select * from rental;
select first_name, last_name, count(customer_id) from customer
inner join rental using (customer_id)
group by first_name, last_name order by count(customer_id) desc
limit 1;

# 3. List number of films per category.
select * from category;
select * from film_category;
select `name`, count(film_id) from category
inner join film_category using(category_id)
group by `name`;

# 4. Display the first and last names, as well as the address, of each staff member.
select * from address;
select * from staff;
select first_name, last_name, address from staff
inner join address using(address_id);

# 5. get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.
select * from film;
select * from language;
select title, name from film
inner join language using(language_id)
where name = "English" and title regexp "^M.*"
or "Italian" and title regexp "^M.*";

select title, name from film
inner join language using (language_id)
where language.name = 'English' and 'Italian'
and film.title like "M%";

# 6. Display the total amount rung up by each staff member in August of 2005.
select * from payment;
select first_name, last_name, sum(amount) from staff
inner join payment using(staff_id)
where payment_date between "2005-08-01" and "2005-08-31"
group by first_name, last_name;

# 7. List each film and the number of actors who are listed for that film.
select * from film;
select * from film_actor;

select title, count(actor_id) from film
left join film_actor using (film_id)
group by title
order by count(actor_id) desc;

# 8. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select * from payment;
select * from customer;

select first_name, last_name, sum(amount) from customer
inner join payment using (customer_id)
group by first_name, last_name
order by last_name;

# 9. Write sql statement to check if you can find any actor who never particiapted in any film.
select * from film;
select * from actor;
select * from film_actor;

select first_name, last_name, film_id from actor
left join film_actor using(actor_id)
where film_id is null;

# 10. get the addresses that have NO customers, and ends with the letter "e"
select * from address;
select * from customer;

select address, customer_id from address
left join customer using(address_id)
where customer_id is null
and address like"%e";

# Optional: what is the most rented film?

select * from rental;
select * from inventory;
select * from film;

select title, count(rental_id) from film
inner join inventory using(film_id)
inner join rental using(inventory_id)
group by title
order by count(rental_id) desc
limit 1;

