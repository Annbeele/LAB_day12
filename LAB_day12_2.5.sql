# Lab | SQL Queries - Lesson 2.5

# 1. Select all the actors with the first name ‘Scarlett’.
select * from actor where first_name = 'Scarlett';

#2. How many films (movies) are available for rent and how many films have been
#   rented?
select count(inventory_id) from inventory;

select count(rental_id) from rental;

#3. What are the shortest and longest movie duration? Name the values max_duration
#   and min_duration.
select max(length) as max_duration , min(length) as min_duration from film;

#4. What's the average movie duration expressed in format (hours, minutes)?

select AVG(length) div 60, floor(mod(AVG(length), 60)) from film;

#another way to do it so we get also the seconds:

select sec_to_time(avg(length)*60) as average_duration from film;

#dateformat quan volem cambiar tota la columna. Pero aki nomes tindrem un numero, aixi k usarem agregation
#el avg ens dona un num, ho dividim entre 60.
#then usem modulo per tenir el reminder de aquella

#5. How many distinct (different) actors' last names are there?
SELECT 
    COUNT(DISTINCT last_name)
FROM
    actor;

#6. Since how many days has the company been operating (check DATEDIFF()
#   function)?
# select datediff(day, min(rental_date), max(rental_date)) from rental;

SELECT DATEDIFF(max(rental_date), min(rental_date)) as 'days open' from rental;

#7. Show rental info with additional columns month and weekday. Get 20 results.
# Case 1: getting weekday numbers
select *, monthname(rental_date) as month, weekday(rental_date) as weekday from rental
limit 20;

# Case 2: getting weekday names
SELECT *, date_format(convert(substring_index(rental_date, ' ', 1), date), '%M') as month, date_format(convert(substring_index(rental_date, ' ', 1), date), '%W') as weekday
FROM rental
limit 20;






#8. Add an additional column day_type with values 'weekend' and 'workday' depending
#   on the rental day of the week.
select *, monthname(rental_date) as month, weekday(rental_date) as weekday,
case
when (weekday(rental_date) in (5,6)) then 'weekend'
else 'workday'
end as day_type
from rental;

#select *, if (WEEKDAY(rental_date) > 5,"weekend", "workday") as day_type from rental;

#9. How many rentals were in the last month of activity?
select count(*) as rentals_last_month from rental 
	where month(rental_date) = (select month(max(rental_date)) from rental)
	and	year(rental_date) = (select year(max(rental_date)) from rental);
    
    
    