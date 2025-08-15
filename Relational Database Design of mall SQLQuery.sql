-- creating the database mall

create database mall

-- to use the database mall

use mall

-- creating tables of customers, products, orders and orderdetails

create table customers
(id int primary key,
name varchar(255) not null,
email varchar(255) unique not null);

select * from customers 

create table products
(
prod_id int primary key,
prod_name nvarchar(255) not null,
price decimal(10,2) not null
);

select * from products

create table orders
(order_id int primary key,
customerid int not null foreign key references customers(id),
orderdate datetime default getdate()
);

select * from orders

create table orderdetails
(
orderdetails_id int primary key,
order_id int not null foreign key references orders(order_id),
product_id int not null foreign key references products(prod_id),
quantity int not null
);

select * from orderdetails

-- combining data across tables using join 
-- to get all orders with the customer name and product details

 select
 o.order_id,
 c.name,
 p.prod_name,
 od.quantity,
 p.price,
 (od.quantity * p.price) as totalprice
 from
 orders o
 join customers c on c.id = o.customerid
 join orderdetails od on od.order_id = o.order_id
 join products p on od.product_id = p.prod_id
 ;

 -- common table expressions
 -- to break down complex queries into readable steps
 -- to find customers who spent more than $500
 
 with customertotals as
 (
	select 
	c.id,
	c.name,
	sum(od.quantity * p.price) as totalspent
	from customers c
	join orders o on o.customerid = c.id
	join orderdetails od on od.order_id = o.order_id
	join products p on p.prod_id = od.product_id
	group by c.id, c.name
)
select * from customertotals
where totalspent > 500;

-- window function
-- these allow calculation without collapsing rows
-- to show each order with total spend per customer using sum() over

select
c.name,
o.order_id,
sum(od.order_id * p.price) over (partition by c.id) as totalpercustomer
from customers c
join orders o on c.id = o.customerid
join orderdetails od on o.order_id = od.order_id
join products p on od.product_id = p.prod_id

-- stored procedure -- to encapsulate codes for reuse

CREATE PROCEDURE GetCustomerOrders 
	@customerid int
as
begin
select
	o.order_id,
	p.prod_name,
	o.orderdate,
	od.quantity,
	p.price
from orders o
join orderdetails od on od.order_id = o.order_id
join products p on p.prod_id = od.product_id
join customers c on c.id = o.customerid
where o.customerid = @customerid
end
exec GetCustomerOrders @customerid = 1

-- to delete the stored procedure

IF OBJECT_ID('GetCustomerOrders', 'P') IS NOT NULL
    DROP PROCEDURE GetCustomerOrders;

-- triggers -- to automate actions when data changes
--trigger to log when new order is created

create table orderlogs
(
log_id int primary key,
order_id int,
logmessage varchar(255),
logdate datetime default getdate()
);

select* from orderlogs

create trigger afterorderinsert
on orders
after insert
as
begin
	insert into orderlogs (order_id,logmessage)
	select i.order_id, 'new order created'
	from inserted i;
end;

select * from orderlogs

-- views -- predefined queries for easier access

create view customerpurchase
as
select
	c.name,
	o.order_id,
	o.orderdate,
	p.prod_name,
	od.quantity,
	(od.quantity * p.price) as totalprice
from customers c
join orders o on o.customerid = c.id
join orderdetails od on od.order_id = o.order_id
join products p on p.prod_id = od.product_id;

select * from customerpurchase

-- transactional operations -- ensuring data integrity when inserting multiple related rows

begin transaction;

begin try
	insert into orders(customerid) values(1);
	declare @order_id int = scope_identity();

	insert into orderdetails (order_id, product_id, quantity, orderdetails_id)
	values (@order_id, 2, 3, 4);

	commit transaction;

end try
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Transaction failed';
END CATCH;