## 1. Review the tables in the database.
USE sakila;
# 2. Explore tables by selecting all columns from each table or using the in built review features for your client.
SELECT * FROM sakila.film;
# 3. Select one column from a table. Get film titles.
SELECT title FROM sakila.film;
SELECT * FROM sakila.film;
# 4. Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
SELECT * FROM sakila.language;
SELECT * FROM sakila.film where language_ID = 1;
SELECT *, language_id=1 as language FROM sakila.film;
# 5. 
	# 5.1 Find out how many stores does the company have?
SELECT * FROM sakila.store; 
# there are 2 stores
	# 5.2 Find out how many employees staff does the company have?
select * FROM sakila.staff;
# there are 2 employees
	# 5.3 Return a list of employee first names only?
SELECT first_name FROM sakila.staff;
