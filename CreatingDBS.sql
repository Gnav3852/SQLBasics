--Create DBS

create table account(
	user_id SERIAL primary key,
	username VARCHAR(50) unique not null,
	password VARCHAR(50) not null,
	email varchar(250) not null unique,
	created_on timestamp not null,
	last_login timestamp
)

create table job(
	job_id SERIAL primary key,
	job_name VARCHAR(200) unique not null
)



--only use serial for primary keys

create table account_job(
	user_id integer references account(user_id),
	job_id integer references job(job_id),
	hire_date timestamp
)



--inserts


insert into account(username,password,email,created_on)
values
('Jose','password','1@email',current_timestamp)


select * from account

insert into job(job_name)
values
('Astro')

insert into job(job_name)
values
('Pres')

select * from job



insert into account_job(user_id,job_id,hire_date)
values
(1,1,current_timestamp)

select * from account_job 



--updates


update account 
set last_login = current_timestamp


update account_job
set hire_date = account.created_on
from account 
where account_job.user_id = account.user_id


--delete


insert into job(job_name)
values
('Pre2s')


select * from job


delete from job
where job_name = 'Pre2s'
returning job_id,job_name



--alter 

create table information(
	info_id SERIAL primary key,
	title VARCHAR(500) not null,
	person VARCHAR(50) not null unique
)

select * from information

alter table information rename to new_info

select * from new_info 

alter table new_info rename column person to people

select * from new_info


alter table new_info
alter column people drop not null


alter table new_info 
drop column if exists people


--check constrain

create table employees(
	emp_id SERIAL primary key,
	first_name VARCHAR(500) not null,
	last_name VARCHAR(50) not null,
	birthday date check(birthday>'1900-01-01'),
	hire_date date check (hire_date>birthday),
	salary integer check (salary>0)
)

insert into employees(
	first_name,
	last_name,
	birthday,
	hire_date,
	salary
)
values(
'J','J','2000-3-3','2001-3-5',100
)











