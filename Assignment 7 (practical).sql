CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50),
 Price DECIMAL(10,2)
 );

INSERT INTO Products VALUES
(1, 'Keyboard', 'Electronics', 1200),
(2, 'Mouse', 'Electronics', 800),
(3, 'Chair', 'Furniture', 2500),
(4, 'Desk', 'Furniture', 5500);

CREATE TABLE Sales (
SaleID INT PRIMARY KEY,
ProductID INT,
Quantity INT,
SaleDate DATE,
 FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
 );

INSERT INTO Sales VALUES

(1, 1, 4, '2024-01-05'),
(2, 2, 10, '2024-01-06'), 
(3,3, 2, '2024-01-10'),
(4, 4, 1, '2024-01-11');

select * from products;
select * from sales;

## Q6. Write a CTE to calculate the total revenue for each product
##(Revenues = Price × Quantity), and return only products where  revenue > 3000.

with revenue_generated as(
	select
	p.productid,
	saleid,
	quantity,
	price,
	quantity*price as revenue,
	category,
	productname
	from products p
	left join sales s
	on p.productid=s.productid
    )
    select
		productid,
		saleid,
		quantity,
		price,
        productname,
		revenue
        from revenue_generated
        where revenue >3000;

## Q7. Create a view named  vw_CategorySummary Category, TotalProducts, AveragePrice.

create view  vw_CategorySummary as
select
category,
count(productname) as totalproduct,
avg(price) as avrageprice
from products
group by category;

select * from  vw_CategorySummary;

## Q8. Create an updatable view containing ProductID, ProductName, and Price. Then update the price of ProductID = 1 using the view.

create view vw_productbasics as
select
productid,
productname,
price
from products;

select * from vw_productbasics;

update vw_productbasics
set price=1500
where productid=1;

select * from vw_productbasics;

## Q9. Create a stored procedure that accepts a category name and returns all products belonging to that category.

delimiter //

create procedure getproductbycategory(in cat_name varchar(100))
begin
select
productname,
price
from products
where category = cat_name;
end //

delimiter ;

call getproductbycategory('Electronics');

## Q10. Create an AFTER DELETE trigger on the  table ProductArchivetimestamp.Productstable that archives deleted product rows into a new .
## The archive should store ProductID, ProductName, Category, Price, and DeletedAt

CREATE TABLE ProductArchive (
    ProductID INT,
    ProductName VARCHAR(255),
    Category VARCHAR(100),
    Price DECIMAL(10,2),
    DeletedAt TIMESTAMP
);

DELIMITER //

CREATE TRIGGER trg_after_delete_products
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ProductArchive (ProductID, ProductName, Category, Price, DeletedAt)
    VALUES (OLD.ProductID, OLD.ProductName, OLD.Category, OLD.Price, NOW());
END;
//

DELIMITER ;

DELETE FROM products WHERE ProductID = 1;

select * from productarchive;