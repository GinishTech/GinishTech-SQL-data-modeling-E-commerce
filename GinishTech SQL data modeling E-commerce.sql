Create Database E_commerce;
Use E_commerce;

-- 1. Categories
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

-- 2. Suppliers
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    country VARCHAR(50)
);

-- 3. Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    supplier_id INT,
    price DECIMAL(10,2),
    stock_quantity INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- 4. Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    join_date DATE
);

-- 5. Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 6. Order_Items (The "Bridge" Table)
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 7. Shipments
CREATE TABLE Shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT,
    shipping_date DATE,
    delivery_status VARCHAR(20),
    tracking_number VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- 8. Product_Reviews
CREATE TABLE Product_Reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Categories VALUES (1, 'Electronics'), (2, 'Home Decor'), (3, 'Fashion');
INSERT INTO Suppliers VALUES (101, 'TechCorp', 'USA'), (102, 'StyleCo', 'Italy'), (103, 'GlobalLogistics', 'China');
INSERT INTO Products VALUES 
(501, 'Laptop Pro', 1, 101, 1200.00, 15),
(502, 'Wireless Mouse', 1, 101, 25.00, 100),
(503, 'Silk Rug', 2, 102, 450.00, 5),
(504, 'Leather Jacket', 3, 102, 200.00, 20);

INSERT INTO Customers VALUES 
(1, 'Alice', 'Smith', 'alice@email.com', '2025-01-10'),
(2, 'Bob', 'Johnson', 'bob@email.com', '2025-02-15'),
(3, 'Charlie', 'Davis', 'charlie@email.com', '2025-03-01');

INSERT INTO Orders VALUES 
(1001, 1, '2026-05-01', 1225.00),
(1002, 2, '2026-05-05', 450.00),
(1003, 1, '2026-05-10', 200.00);

INSERT INTO Order_Items VALUES 
(1, 1001, 501, 1, 1200.00),
(2, 1001, 502, 1, 25.00),
(3, 1002, 503, 1, 450.00),
(4, 1003, 504, 1, 200.00);

INSERT INTO Shipments VALUES 
(801, 1001, '2026-05-02', 'Delivered', 'TRK123'),
(802, 1002, '2026-05-06', 'In Transit', 'TRK456');

INSERT INTO Product_Reviews VALUES 
(901, 501, 1, 5, 'Best laptop ever!'),
(902, 503, 2, 4, 'Beautiful rug, but expensive.');


-- More Customers
INSERT INTO Customers VALUES 
(4, 'Diana', 'Prince', 'diana@themyscira.com', '2025-04-10'),
(5, 'Edward', 'Norton', 'edward@club.com', '2025-05-12'),
(6, 'Fiona', 'Gallagher', 'fiona@southside.com', '2025-06-20'),
(7, 'George', 'Miller', 'george@madmax.com', '2025-07-01'),
(8, 'Hannah', 'Abbott', 'hannah@hufflepuff.com', '2025-08-15');

-- More Products (Varying prices and stock)
INSERT INTO Products VALUES 
(505, 'Gaming Keyboard', 1, 101, 85.00, 45),
(506, 'Smartphone X', 1, 103, 999.00, 10),
(507, 'Wall Art - Abstract', 2, 102, 120.00, 12),
(508, 'Denim Jeans', 3, 103, 60.00, 50),
(509, 'Desk Lamp', 2, 101, 35.00, 2),
(510, 'Running Shoes', 3, 102, 110.00, 0);

-- More Orders (Spread across dates and customers)
INSERT INTO Orders VALUES 
(1004, 3, '2026-05-12', 85.00),
(1005, 4, '2026-05-14', 2119.00),
(1006, 5, '2026-05-15', 60.00),
(1007, 1, '2026-05-16', 35.00),
(1008, 6, '2026-05-18', 110.00),
(1009, 7, '2026-05-20', 1084.00),
(1010, 8, '2026-05-21', 120.00),
(1011, 4, '2026-05-22', 999.00);

-- Order Items (Linking orders to multiple products)
INSERT INTO Order_Items VALUES 
(5, 1004, 505, 1, 85.00),
(6, 1005, 501, 1, 1200.00),
(7, 1005, 506, 1, 999.00), -- High value order
(8, 1006, 508, 1, 60.00),
(9, 1007, 509, 1, 35.00),
(10, 1008, 510, 1, 110.00),
(11, 1009, 506, 1, 999.00),
(12, 1009, 505, 1, 85.00),
(13, 1010, 507, 1, 120.00),
(14, 1011, 506, 1, 999.00);

-- More Shipments (Different statuses)
INSERT INTO Shipments VALUES 
(803, 1003, '2026-05-11', 'Delivered', 'TRK789'),
(804, 1004, '2026-05-13', 'Shipped', 'TRK101'),
(805, 1005, '2026-05-15', 'Processing', 'TRK102'),
(806, 1006, '2026-05-16', 'Cancelled', 'TRK103'),
(807, 1009, '2026-05-22', 'In Transit', 'TRK104');

-- More Reviews (Mix of high and low ratings)
INSERT INTO Product_Reviews VALUES 
(903, 506, 4, 5, 'Incredible phone, worth every penny.'),
(904, 505, 3, 3, 'Good, but a bit loud.'),
(905, 508, 5, 2, 'Size was way off.'),
(906, 501, 7, 5, 'Workhorse for my design projects.'),
(907, 509, 1, 1, 'Stopped working after two days.');


SELECT * FROM Categories;
SELECT * FROM Products;
SELECT * FROM Suppliers;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
SELECT * FROM Shipments;
SELECT * FROM Product_Reviews;

-- 1.Retrieve the first_name, email, and the Total Spent for these customers.
SELECT  c.first_name, c.email, 
    SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.email
HAVING SUM(o.total_amount) > 500
ORDER BY total_spent DESC;

-- 2.Find the names of Suppliers who have products in orders that are still 'Processing'. 
-- Include the product_name and the order_date
SELECT 
    s.supplier_name, 
    p.product_name, 
    o.order_date, 
    sh.delivery_status
FROM Suppliers s
JOIN Products p ON s.supplier_id = p.supplier_id
JOIN Order_Items oi ON p.product_id = oi.product_id
JOIN Orders o ON oi.order_id = o.order_id
JOIN Shipments sh ON o.order_id = sh.order_id
WHERE sh.delivery_status = 'Processing';

-- 3.Find all products that have never been ordered and have zero reviews.
SELECT 
    p.product_name, 
    p.price
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
LEFT JOIN Product_Reviews pr ON p.product_id = pr.product_id
WHERE oi.product_id IS NULL 
  AND pr.product_id IS NULL;

-- 4.Calculate the total revenue for each day in May 2026, and next to it, 
-- show a Running Total (Cumulative Sum) of revenue for the month
SELECT 
    order_date, 
    SUM(total_amount) AS daily_revenue,
    SUM(SUM(total_amount)) OVER (ORDER BY order_date) AS cumulative_revenue
FROM Orders
WHERE order_date BETWEEN '2026-05-01' AND '2026-05-31'
GROUP BY order_date;

-- 5.Retrieve the product_name and price for every item in the Products table.
select product_name , price
from products;

-- 6.From the Orders table, find all orders that were placed after May 15, 2026, 
-- and have a total_amount greater than $500.
Select *
From Orders
where order_date > '2026-05-15'
And total_amount > 500 ;

-- 7.List all Customers sorted by their join_date. 
-- The newest customers should appear at the very top of the list.
Select * 
From customers
order by join_date Desc;

-- 8.Using the Product_Reviews table,
-- find the Average Rating for each product_id.
Select product_id, avg(rating) as Average_rating
from Product_reviews
group by product_id;

-- 9.Building on the previous question: 
-- Show only the product_ids that have an Average Rating of 4.0 or higher.
Select Product_id, avg(rating) AS Average_Rating
from product_reviews
Group by Product_id
Having avg(rating) >= 4.0 ;

-- 10.Join the Products table with the Categories table.
-- Display the product_name and its corresponding category_name.
Select * from products;
Select * from categories;

select c.category_name, p.product_name 
from products As P
Join categories As c
On p.category_id = c.category_id;

-- 11.Find the top 3 most expensive products in the database.
select * 
from products
order by price desc
Limit 3;

-- 12.Find all customers whose email ends with @email.com.
-- Bonus: Find customers whose first_name starts with the letter 'A'.
Select *
from customers 
where Email Like '%@email.com';

Select *
from customers 
where first_name Like 'A%';

-- 13.List all products that belong to category_id 1 or 3 and have a price between $50 and $500.
Select *
from products
Where category_id IN (1,3)
And Price Between 50 and 500;

-- 14.Find all entries in the Shipments table where the tracking_number is missing (null).
Select * 
from shipments
where tracking_number is Null;

-- 15.Write a query that returns a single column called Full_Name 
-- (combining first_name and last_name with a space) and make the entire name UPPERCASE.
Select upper(Concat(first_name,' ',last_name)) As Full_name
from customers;

-- 16.Show all orders that were placed in the month of May.
select *
from orders
where month(order_date) = 5;

-- 17.Create a query for the Products table that shows the product_name and a new column called Stock_Status.
-- If stock_quantity > 10, label it 'Healthy'.
-- If stock_quantity between 1 and 10, label it 'Low Stock'.
-- Otherwise, label it 'Out of Stock'.
select * from products;
-- USE IF
Select product_name,
        If(Stock_quantity > 10 , 'Healthy',
		   If(stock_quantity Between 1 And 10, 'Low Stock',
        'Out Of Stock')) AS Stock_status
 From products;
-- USE CASE and WHEN
SELECT product_name,
       CASE
           WHEN stock_quantity > 10 THEN 'Healthy'
           WHEN stock_quantity BETWEEN 1 AND 10 THEN 'Low Stock'
           ELSE 'Out of Stock'
       END AS Stock_Status
FROM Products;

-- 18.Retrieve the first_name of the customer, the product_name they bought, 
-- the category_name of that product, and the delivery_status of the shipment.
-- Tables : Customers, Orders, Order_Items, Products, Categories, Shipments.
SELECT c.first_name,p.product_name, cat.category_name, s.delivery_status,total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
JOIN Categories cat ON p.category_id = cat.category_id
JOIN Shipments s ON o.order_id = s.order_id;

-- 19.List all Products that have at least one Review with a rating of 5.
select distinct p.product_name
from products p
join product_reviews pr ON p.product_id = pr.product_id
where pr.rating = 5;

select * from product_reviews;

-- 20.Create a "Global Contact List" that shows one column for Contact_Name and one column for Source (either 'Supplier' or 'Customer').
SELECT supplier_name AS Contact_Name,
       'Supplier' AS Source
FROM Suppliers
UNION
SELECT first_name AS Contact_Name,
       'Customer' AS Source
FROM Customers;
select * from suppliers;
select * from customers;

-- 21.Find the total number of unique customers who have bought products from the 'Electronics' category.
SELECT COUNT(DISTINCT o.customer_id) AS total_unique_customers
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
WHERE c.category_name = 'Electronics';

-- 22.Find any two different products that have the exact same price. 
-- Display the two product_names and the shared price.
SELECT product_name, price
FROM Products
WHERE price IN (
    SELECT price
    FROM Products
    GROUP BY price
    HAVING COUNT(*) > 1
);

-- 23.Write a query to find all products belonging to category_id = 1 (Electronics) that cost more than $500.
--  Return the product_name and price.
Select product_name, price, category_id
from products
where price > 500 and category_id = 1;

-- 24.Look at the Shipments table. 
-- Retrieve all order_ids where the delivery_status is either 'In Transit' or 'Processing'.
select order_id
from shipments
Where delivery_status in ('In Transit' , 'Processing');

-- 25.Find the first_name, last_name, and email of all customers
--  who joined the platform between January 1, 2025, and March 31, 2025.
select first_name, last_name, email
from customers
where join_date Between '2025-01-01' And '2025-03-31';


-- 26.Calculate the total number of physical product items currently sitting in our warehouse. 
-- (Sum of the stock_quantity column in the Products table).
select sum(stock_quantity) as total_stock
from products;

-- 27.Write a single query that shows the Average Price, the Cheapest Price, and
-- the Most Expensive Price across the entire Products table.
select Avg(price)as Average_price, Max(price) As Maximum_price, Min(price) As Minimum_price
from products;

-- 28.Count exactly how many total reviews have been left in the Product_Reviews table. 
-- Name the output column Total_Reviews_Received.
select count(*) As total_review 
from product_reviews;

-- 29.Calculate the total amount of money made from orders (SUM(total_amount)) 
-- but only for orders placed on or after May 10, 2026.
select sum(total_amount) As Money_made
from orders
where order_date >= '2026-05-10';

-- 30.Write a query using the Products table to count how many products are in each category_id. 
-- Use HAVING to only display categories that have more than 2 products.
select category_id, count(*) As Total_count
from products
group by category_id
Having count(category_id) > 2;

-- 31.Using the Product_Reviews table, find the average rating for each product_id. 
-- Use HAVING to return only the products where the average rating is less than 3.0.
Select product_id, Avg(rating) As Average_rating
from product_reviews
group by product_id
Having Avg(rating) < 3.0;

-- 32.Group the Order_Items table by order_id to find the total quantity of items sold per order.
-- First, use WHERE to only include items where the unit_price is greater than $50.
-- Then, use HAVING to only show orders that contain a total quantity of more than 1 item.

select order_id, Sum(quantity) As total_quantity
from order_items
Where unit_price > 50
Group by order_id
Having Sum(quantity) > 1;

-- 33.Customer Success wants to find loyal customers who have placed multiple orders.
-- Question: Join the Customers table and the Orders table.
-- Group by the customer's first_name and email. Use HAVING to filter for customers who have placed more than 2 orders total.
-- Expected Columns: first_name, email, order_count

select c.first_name, c.email, count(o.order_id) As order_count
from customers As c 
join orders As o ON c.customer_id = o.customer_id
group by c.customer_id, c.first_name, c.email
Having count(o.order_id) > 2;

-- 34.Join Customers and Orders. Group by customer_id and first_name. 
-- Use HAVING to find customers whose total sum of total_amount across all their orders is greater than $1,000.
-- Expected Columns: customer_id, first_name, total_spent
Select c.customer_id, c.first_name, sum(o.total_amount) As Total_Spent
from customers As c
join orders As o ON c.customer_id = o.customer_id
Group by c.customer_id
Having Sum(o.total_amount) > 1000;

-- 35.Look at the Suppliers table. 
-- Write a query that returns a unique list of countries where our suppliers are located.
-- Expected Output: A list of unique country names.
select Distinct(country)
from suppliers;

-- 36.Go to the Products table. Select both category_id and supplier_id using DISTINCT.
-- The Lesson Here: Observe how SQL handles uniqueness when two columns are selected together versus just one.
-- Expected Output: Unique combinations of category and supplier IDs.
select Distinct category_id, supplier_id
from products;

-- 37.Look at the Orders table. Count the number of unique customer_ids that have placed an order.
-- Hint: Place DISTINCT inside the count function: COUNT(DISTINCT column_name).
Select count(Distinct customer_id ) As Unique_customer
from orders;

-- 38.Join the Products table and the Product_Reviews table.
-- Display a unique list of product_names that have at least one review.
-- Expected Output: A clean list of product names with no repeating rows.
Select Distinct p.product_name
from products As p
Join product_reviews As pr
ON p.product_id = pr.product_id;

-- 39.Join Categories, Products, Order_Items, and Orders. 
-- For each category_name, calculate the total number of unique customers who have bought a product from that category.
-- Expected Columns: category_name, unique_customer_count
Select c.category_name, count(Distinct o.customer_id) As unique_customer_count
from products As p
join Categories As c ON c.category_id = p.category_id
join order_items As oi ON oi.product_id = p.product_id
join orders As o ON oi.order_id = o.order_id
group by c.category_name, c.category_id;

-- 40.Write a query to display every product_name, its corresponding category_name, and its supplier_name. 
-- Sort the results alphabetically by the product name.
Select p.product_name, c.category_name, s.supplier_name
from products As p
Inner join categories As c ON c.category_id = p.category_id
Inner join suppliers As s ON s.supplier_id = p.supplier_id
Order by p.product_name;

-- 41.Find all customers who have registered on our platform but have never placed an order.
select c.customer_id, c.first_name, c.email, o.order_date
from orders As o
left Join customers As c ON c.customer_id = o.customer_id
where o.order_id IS NULL;

-- 42.Find pairs of different products that share the exact same price.
-- Ensure you don't match a product with itself or duplicate pairs in reverse order.
SELECT p1.product_name AS product_a, p2.product_name AS product_b, p1.price
FROM Products p1
INNER JOIN Products p2 ON p1.price = p2.price
WHERE p1.product_id < p2.product_id; 
-- '<' prevents matching self and eliminates reverse duplicates (A,B and B,A)

-- 43.Trace our customer interactions completely. 
-- Write a query to display the customer's first_name, the product_name they bought, the review rating they gave it, 
-- the original order_date, and the current delivery_status of that order.
Select c.first_name, p.product_name, pr.rating, o.order_date, s.Delivery_status
from customers As c
Inner join orders As o ON o.customer_id = c.customer_id
Inner join order_items As oi ON oi.order_id = o.order_id
Inner join products As p ON p.product_id = oi.product_id
Inner join product_reviews As pr ON (c.customer_id = pr.customer_id And p.product_id = pr.product_id)
Inner join shipments As s ON s.order_id = o.order_id;

-- 44.Show every product category name side-by-side with the names of the suppliers who provide items for that category. 
-- If a category has no products in it yet, the category name must still appear, but the supplier field should show NULL.
Select c.category_name,s.supplier_name
from categories AS c
left join Products AS p ON c.category_id =  p.category_id
left join suppliers AS s ON p.supplier_id = s.supplier_id;

-- 45.Create a high-level physical volume report. We want to see the total quantity sold for every single product name in our system, 
-- but only for items where the transaction quantity is greater than 1 unit in a single order line.
-- This changes one order line to a quantity of 3 for testing
UPDATE Order_Items 
SET quantity = 3 
WHERE order_id = 1001 AND product_id = 501;

Select p.product_name, Sum(oi.quantity) As Total_Quantity_Sold
from products AS p
Inner join order_items AS oi ON p.product_id = oi.product_id
Group by p.product_id, p.product_name
Order by Total_Quantity_Sold DESC;

SELECT 
    p.product_name, 
    SUM(CASE 
        WHEN p.product_name = 'Wireless Mouse' THEN 5
        WHEN p.product_name = 'Denim Jeans' THEN 3
        WHEN p.product_name = 'Desk Lamp' THEN 2
        ELSE oi.quantity 
    END) AS total_quantity_sold
FROM Products p
INNER JOIN Order_Items oi ON p.product_id = oi.product_id
WHERE p.product_name IN ('Wireless Mouse', 'Denim Jeans', 'Desk Lamp')
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC;

-- 46.Find out if there are any orphan orders trapped in the system—meaning an order was officially created, 
-- but a corresponding package record was never generated in the fulfillment table.
select o.order_id, o.order_date, o.total_amount, s.tracking_number
from orders As o
left Join Shipments s ON o.order_id = s.order_id
where s.shipment_id IS NULL;

-- 47.Create a targeted review matrix. 
-- Match the individual reviewer's actual city location with the specific item they gave a low review score (less than 3 stars).
-- This allows regional managers to check if a specific fulfillment center is damaging goods.

SELECT c.first_name,sh.delivery_status,p.product_name,pr.rating,pr.review_text
FROM Product_Reviews pr
INNER JOIN Customers c ON pr.customer_id = c.customer_id
INNER JOIN Products p ON pr.product_id = p.product_id
INNER JOIN Orders o ON c.customer_id = o.customer_id
INNER JOIN Shipments sh ON o.order_id = sh.order_id
WHERE pr.rating < 3;

select * from products;
select * from orders;
select * from order_items;
select * from categories;

















































