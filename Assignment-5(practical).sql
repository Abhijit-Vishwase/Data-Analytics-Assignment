create database subqueries_assignment;

use subqueries_assignment;


create table department
(department_id char(3) primary key,
department_name varchar(20),
location varchar(20));

create table employee
(emp_id char(3) primary key,
name varchar(20),
department_id char(3),
salary int,
constraint fk_dept
foreign key (department_id)
references department(department_id));

create table sales
(
	sale_id char(3) primary key,
    emp_id char(3),
    sale_amount int,
    sale_date date,
		constraint fk_emp
        foreign key (emp_id)
        references employee(emp_id)
);

insert into department (department_id, department_name, location)
values
('D01', 'Sales', 'Mumbai'),
('D02', 'Marketing', 'Delhi'),
('D03', 'Finance', 'Pune'),
('D04', 'HR', 'Bengaluru'),
('D05', 'IT', 'Hyderabad');

insert into employee (emp_id, name, department_id, salary)
values
('101', 'Abhishek', 'D01', 62000),
('102', 'Shubham', 'D01', 58000),
('103', 'Priya', 'D02', 67000),
('104', 'Rohit', 'D02', 64000),
('105', 'Neha', 'D03', 72000),
('106', 'Aman', 'D03', 55000),
('107', 'Ravi', 'D04', 60000),
('108', 'Sneha', 'D04', 75000),
('109', 'Kiran', 'D05', 70000),
('110', 'Tanuja', 'D05', 65000);

insert into sales (sale_id, emp_id, sale_amount, sale_date)
values
(201, 101, 4500, '2025-01-05'),
(202, 102, 7800, '2025-01-10'),
(203, 103, 6700, '2025-01-14'),
(204, 104, 12000, '2025-01-20'),
(205, 105, 9800, '2025-02-02'),
(206, 106, 10500, '2025-02-05'),
(207, 107, 3200, '2025-02-09'),
(208, 108, 5100, '2025-02-15'),
(209, 109, 3900, '2025-02-20'),
(210, 110, 7200, '2025-03-01');

select * from department;
select * from employee;
select * from sales;

## Q. Retrive the names of employees who earn more than average salary of all employees.
select name 
from employee
where 
	salary > (select avg(salary) from employee);
    
    
## Q. find the employees who belong to the department with the higest average salary.
select name from employee e
where
	e.department_id =
		(select department_id from employee 
        group by department_id 
        order by avg(salary) desc
		limit 1
        );
        
        
## Q.List all employees who have made at least one sale.
select distinct name
from employee e
join sales s
	on e.emp_id = s.emp_id;
    
    
## Q. Find the employee with the highest sale amount.
select name 
from employee e
join sales s
	on e.emp_id=s.emp_id
where 
	s.sale_amount=(select max(sale_amount) from sales);


## Q.Retrieve the names of employees whose salaries are higher than Shubham’s salary.
select name 
from employee
where 
	salary > 
		(select salary from employee
        where name ="shubham");
        
        
## Q. Find employees who work in the same department as Abhishek.
select name
from employee e
	join department d
		on e.department_id = d.department_id
	where 
		department_name =
			(select department_name 
            from department
				where department_id =
						(select department_id from employee
							where name="abhishek")
			);
            
            
## Q. List departments that have at least one employee earning more than ₹60,000.
select department_name 
from department d
	join employee e
		on d.department_id = e.department_id
	where
		e.salary > 60000;
        
        
## Q. Find the department name of the employee who made the highest sale.
select department_name
from department d
	join employee e
		on d.department_id = e.department_id
	join sales s
		on e.emp_id = s.emp_id
where 
	s.sale_amount = 
		(select max(sale_amount)
        from sales);


## Q. Retrieve employees who have made sales greater than the average sale amount.
select name 
from employee e
	join sales s 
		on e.emp_id = s.emp_id
where
	s.sale_amount >
		(select avg(sale_amount)
        from sales);
        
        
## Q. Find the total sales made by employees who earn more than the average salary.
select sum(sale_amount)
from sales s
	join employee e
		on e.emp_id = s.emp_id
where
	salary >
		(select avg(salary)
			from employee
		);
        
        
## Q.Find employees who have not made any sales.
select name	
from employee e
	left join sales s 
		on e.emp_id=s.emp_id
where s.sale_amount IS NULL;


## Q.List departments where the average salary is above ₹55,000
select department_name 
from department d
	join employee e
		on d.department_id = e.department_id
group by department_name
having avg(e.salary)>55000;


## Q. Retrieve department names where the total sales exceed ₹10,000
select department_name
from department d
	join employee e
		on d.department_id = e.department_id
	join sales s
		on e.emp_id = s.emp_id
group by department_name
having sum(sale_amount)>10000;

## Q.Find the employee who has made the second-highest sale.
select name	
from employee e
	join sales s 
		on e.emp_id=s.emp_id
where 
	sale_amount =
		(select max(sale_amount) 
		from sales
			where 
				sale_amount<
					(select max(sale_amount)
					from sales
					)
		);
        

## Q. Retrieve the names of employees whose salary is greater than the highest sale amount recorded
select name	
from employee e
	join sales s 
		on e.emp_id=s.emp_id
where
	salary >
		(select max(sale_amount)
			from sales
		);







                
	