use sakila;
select * from sakila.language
inner join film
on language.language_id = film.language_id;

select * from language
inner join film
using (language_id);

