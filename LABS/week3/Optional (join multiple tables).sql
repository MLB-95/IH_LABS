use sakila;
# 1. Write a query to display for each store its store ID, city, and country.
select store_id, city, country from store
join address using (address_id)
join city using (city_id)
join country using (country_id);

# 2. Write a query to display how much business, in dollars, each store brought in.
select sum(amount), store_id from store
join staff using (store_id)
join payment using (staff_id)
group by store_id;

# 3.What is the average running time(length) of films by category?
select avg(length), name from film 
join film_category using(film_id)
join category using(category_id)
group by name;

# 4. Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)
