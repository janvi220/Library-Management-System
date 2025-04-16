--Library Managament System-project

--creating Brach table
create table branch(
	branch_id varchar(10) primary key,
	manager_id varchar(10),
	branch_address varchar(50),
	contact_no varchar(10)
)
select * from branch
alter table branch
alter column contact_no type varchar(20)

--create employee table
create table employee(
	emp_id varchar(10) primary key,
	emp_name varchar(25),
	position varchar(25),
	salary int,
	branch_id varchar(25) --fk
)
select * from employee

--create table books
create table books(
	isbn varchar(20) primary key,
	book_title varchar(75),
	category varchar(10),
	rental_price float,
	status varchar(15),
	author varchar(35),
	publisher varchar(55)
)
alter table books
alter column category type varchar(20)
--create table members
create table members(
	member_id varchar(10) primary key,
	member_name varchar(25),
	member_address varchar(75),
	reg_date date
)

--create table issued_status
create table issued_status(
	issued_id varchar(10) primary key,
	issued_member_id varchar(10), --fk
	issued_book_name varchar(75),
	issued_date date,
	issued_book_isbn varchar(25),  --fk
	issued_emp_id varchar(10)     --fk
)

--create table return_status
create table return_status(
	return_id varchar(10) primary key,
	issued_id varchar(10),
	return_book_name varchar(75),
	return_date date,
	return_book_isbn varchar(20)
)

--foreign key
alter table issued_status
add constraint fk_members
foreign key(issued_member_id)
references members(member_id)

alter table issued_status
add constraint fk_books
foreign key(issued_book_isbn)
references books(isbn)

alter table issued_status
add constraint fk_employee
foreign key(issued_emp_id)
references employee(emp_id)

alter table employee
add constraint fk_branch
foreign key(branch_id)
references branch(branch_id)

alter table return_status
add constraint fk_issued_status
foreign key(issued_id)
references issued_status(issued_id)