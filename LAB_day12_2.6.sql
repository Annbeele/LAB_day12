# Lab | SQL Queries - Lesson 2.6

#1. Get release years
select distinct release_year from film;

#2. Get all films with ARMAGEDDON in the title.
select title from film
where title like '%armageddon%';

#3. Get all films which title ends with APOLLO.
select title from film
where title like '%apollo';

#4. Get 10 the longest films.
select title, length from film
order by length desc
limit 10;
#5. How many films include Behind the Scenes content?
select count(*) from film
where special_features like '%Behind the Scenes%';

#6. Drop column picture from staff.
alter table staff drop column picture;

#7. A new person is hired to help Jon. Her name is TAMMY SANDERS,
#   and she is a customer. Update the database accordingly.

insert into staff (first_name, last_name, address_id , email, store_id, active, username)
select first_name, last_name, address_id , email, 2, active, first_name from customer
where first_name = "TAMMY" and last_name = "SANDERS";

#8. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at
#   Store 1. You can use current date for the rental_date column in the rental table.
#  Hint: Check the columns in the table rental and see what information you would need
#  to add there. You can query those pieces of information. For eg., you would notice that
# you need customer_id information as well. To get that you can use the following query:
#    select customer_id from sakila.customer
#    where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
# Use similar method to get inventory_id, film_id, and staff_id.

