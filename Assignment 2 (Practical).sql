USE company_db;

create table Employees1(
EmpID int primary key,
EmpName varchar(50),
Department varchar(50),
city varchar(50),
salary int,
HireDate date);

insert into Employees1 values
(101,"Rahul Mehta","Sales","Delhi",55000,"2020-04-12"),
(102,"Priya Sharma","HR","Mumbai",62000,"2019-09-25"),
(103,"Aman Singh","IT","Bengluru",72000,"2021-03-10"),
(104,"Neha Patel","Sales","Delhi",48000,"2022-01-14"),
(105,"Karan Joshi","Marketing","Pune",45000,"2018-07-22"),
(106,"Divya Nair","IT","Chennai",81000,"2019-12-11"),
(107,"Raj Kumar","HR","Delhi",60000,"2020-05-28"),
(108,"Simran Kaur","Finance","Mumbai",58000,"2021-08-03"),
(109,"Arjun Reddy","IT","Hydrabad",70000,"2022-02-18"),
(110,"Anjali Das","Sales","Kolkata",51000,"2023-01-15");

select * from Employees1;

select * from Employees1
where Department="HR"or Department="IT";

select * from Employees1
where Department in("Sales","IT","Finance");

select * from Employees1
where salary between 50000 and 70000;

select * from Employees1
where EmpName like "A%";

select * from Employees1
where EmpName like "%an%";

select * from Employees1
where city="Delhi" or city="Mumbai"
and salary>55000;

select * from Employees1
where Department <>"HR";

select * from Employees1
where HireDate between "2019-01-01" and "2022-01-01"
order by Hiredate asc;

