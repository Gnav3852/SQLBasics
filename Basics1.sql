select * from film;

--SELECT STATMENTS

select first_name, last_name from actor;

select first_name, last_name,email from customer;

select distinct rental_rate from film;

select distinct rating from film;

--COUNT

select count(amount) from payment;

select count(distinct amount) from payment;

--WHERE

select * from customer 
where first_name = 'Jared';


select * from film where rental_rate  > 4 and replacement_cost >=19.99 and rating='R';

select count(*) from film where rental_rate  > 4 and replacement_cost >=19.99 
and rating='R';

select email from customer where first_name = 'Nancy' and last_name ='Thomas';

select phone from customer_list where address ='259 Ipoh Drive';


--ORDER BY

select * from customer order by store_id desc,first_name asc;

--LIMIT

select * from payment
where amount !=0.00
order by payment_date desc 
limit 5;

select customer_id from payment
order by payment_date asc
limit 10;

--BETWEEN

select * from payment
where amount not between 8 and 9

--IN

select * from payment
where amount not in(1.98,1.99,2.99);

--LIKE ILIKE

select * from customer
where first_name not like 'J%' and last_name like 'S%'

--CHALLENGE

select count(*) from payment
where amount >5.00;

select count(*) from actor
where first_name like 'P%';

select count(distinct district) from address;
select distinct(district) from address;

select count(*) from film
where replacement_cost between 5 and 15 and rating ='R';

select count(*) from film where title like '%Truman%';

--AGRAGETE FUNCTON

select min(replacement_cost), max(replacement_cost) from film; 
select ROUND( avg(replacement_cost),2 ) from film;
select sum(replacement_cost) from film;

--GROUP BY

select customer_id, sum(amount) from payment
group by customer_id
order by sum(amount) desc;

select customer_id, staff_id, sum(amount) from payment
group by staff_id,customer_id
order by customer_id;

--DATE

select date(payment_date), sum(amount) from payment
group by date(payment_date)



--CHALL

select staff_id, count(payment_id) from payment
group by staff_id


 
--HAVING

select customer_id, sum(amount) from payment
group by customer_id
having sum(amount) >100


select customer_id, count(*) from payment
group by customer_id
having count(*)>=40




--JOINS

--INNER JOINNN


select payment_id, payment.customer_id, first_name from payment
inner join customer
on payment.customer_id = customer.customer_id 

--FULL OUTER JOINN


select * from customer
full outer join payment
on customer.customer_id =payment.customer_id
--where customer.customer_id is null or payment.payment_id is null

--the where statement happens after the join 
--filters after



--LEFT JOINN
--film.film_id, film.title, inventory_id
select film.film_id, film.title, inventory_id from film
left join inventory
on film.film_id = inventory.film_id 
where inventory.film_id is NULL



--CALLLL

select address.district, customer.email from address
inner join customer
on address.address_id = customer.address_id 
where address.district ='California'


select * from film_actor


select title,first_name,last_name from film_actor 
inner join actor
on actor.actor_id = film_actor.actor_id
inner join film
on film_actor.film_id = film.film_id
where actor.first_name = 'Nick' and actor.last_name ='Wahlberg'





--ADV SOL



---TIME)

select EXTRACT(year from payment_date) 
from payment 


--MATH)

select round(rental_rate/replacement_cost,2)*100 from film

--STRING)

select length(first_name) from customer


--concat
select upper(first_name) || ' ' || left(last_name,1) as full_name 
from customer


--subqurey

select title,rental_rate from film
where rental_rate >(select avg(rental_rate) from film)


select * from film where film_id IN
(select inventory.film_id from rental
inner join inventory
on inventory.inventory_id = rental.inventory_id
where rental_date between  '2005-05-29' and '2005-05-30')
order by title asc



select first_name, last_name from customer as c where exists (select * from payment as p where p.customer_id = c.customer_id and amount>11)


--self-join

select f1.title, f2.title,f1.length 
from film as f1
inner join film as f2 on
f1.film_id != f2.film_id and f1.length =f2.length 



--CASE:


select * from customer


select customer_id, 
case 
	when customer_id <=100 then 'Prem'
	when customer_id between 100 and 200 then 'Plus'
	else 'Normal'
end as class_cus
from customer


select customer_id, 
case customer_id
	when 1 then 'win'
	when 40 then 'win'
	else 'lose'
end
from customer

--cast:;

select '5'::INteger

select cast('5' as INteger)


--view 

create view customer_info as
select first_name, last_name, address from customer
inner join address
on customer.address_id = address.address_id


select * from customer_info


create or replace view customer_info as
select first_name, last_name, address,district from customer
inner join address
on customer.address_id = address.address_id

select * from customer_info




drop view if exists customer_info






























