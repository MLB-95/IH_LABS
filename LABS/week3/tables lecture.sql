create database Ironhack;
use Ironhack;
create table students (student_id int not null auto_increment, 
first_name VarChar(45),
last_name VarChar(45),
Py_Score INT,
Pet VarChar(45),
primary key (student_id));

select * from students;

insert into students (first_name, second_name, Py_Score, Pet) values ('Ahmed', 'Yurdakul', 95, 'Boar');

select * from students;

use bank;
create temporary table bank.loan_and_account
select l.loan_id, l.account_id, a.district_id, l.amount, l.payments, a.frequency
from bank.loan l
join bank.account a
on l.account_id = a.account_id;

select * from bank.loan_and_account;