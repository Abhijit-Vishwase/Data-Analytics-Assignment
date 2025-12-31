create database 3table;

create table Customers(
CustomerID int primary key,
CustomerName varchar(50),
City varchar(50));

insert into Customers values
(1,"John Smith","New York"),
(2,"Mary Johnson","Chicago"),
(3,"Peter Adams","Los Angeles"),
(4,"Nancy Miller","Houstan"),
(5,"Robert White","Miami");

create table Orders(
OrderID int primary key,
CustomerID int,
OrderDate date,
Amount int);

insert into Orders values
(101,1,"2024-10-01",250),
(102,2,"2024-10-05",300),
(103,1,"2024-10-07",150),
(104,3,"2024-10-10",450),
(105,6,"2024-10-12",400);

create table Payments(
PaymentID varchar(10) primary key,
CustomerID int,
PaymentDate date,
Amount int);

insert into Payments values
("P001",1,"2024-10-02",250),
("P002",2,"2024-10-06",300),
("P003",3,"2024-10-11",450),
("P004",4,"2024-10-15",200);

create table Employees(
EmployeeID int primary key,
EmployeeName varchar(50),
ManagerID int);

insert into Employees values
(1,"Alex Green",null),
(2,"Brian Lee",1),
(3,"Carol Ray",1),
(4,"David Kim",2),
(5,"Eva Smith",2);

select * from Customers;
select * from Orders;
select * from Employees;
select * from Payments;

SELECT DISTINCT c.CustomerID, c.CustomerName, c.City
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

SELECT c.CustomerID, c.CustomerName, o.OrderID, o.Amount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;

SELECT o.OrderID, o.CustomerID, c.CustomerName, o.Amount
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;

SELECT c.CustomerID, c.CustomerName, o.OrderID, o.Amount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerID, c.CustomerName, o.OrderID, o.Amount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT c.CustomerID, c.CustomerName
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c
INNER JOIN Payments p ON c.CustomerID = p.CustomerID
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

SELECT c.CustomerName, o.OrderID
FROM Customers c
CROSS JOIN Orders o;

SELECT c.CustomerName, o.Amount AS OrderAmount, p.Amount AS PaymentAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON c.CustomerID = p.CustomerID;

SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN Payments p ON c.CustomerID = p.CustomerID;