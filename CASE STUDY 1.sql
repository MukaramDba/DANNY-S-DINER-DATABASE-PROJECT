	 
-- This show the number of product baught by each customer
select customer_id, COUNT(product_id)as NumberOfProducts
from  dannys_diner.sales
group by customer_id

--What is the total amount each customer spent at the restaurant?


--How many days has each customer visited the restaurant?

select customer_id, count(distinct order_date)
from dannys_diner.sales
group by customer_id


--What was the first item from the menu purchased by each customer?

select * from dannys_diner.members
select * from dannys_diner.menu
select * from dannys_diner.sales

WITH ordered_sales_cte AS
(
	SELECT customer_id, order_date, product_name,
	 DENSE_RANK() OVER(PARTITION BY s.customer_id
	 ORDER BY order_date) AS rank
	FROM dannys_diner.sales AS s
	JOIN dannys_diner.menu AS m
	 ON s.product_id = m.product_id
  	)
SELECT customer_id, product_name
FROM ordered_sales_cte
WHERE rank = 1
GROUP BY customer_id, product_name;


--What is the most purchased item on the menu and how many times was it purchased by all customers? Most purchased item on the menu is ramen.

select * from dannys_diner.members
select * from dannys_diner.menu
select * from dannys_diner.sales

select COUNT( sales.product_id) as NumberOfOccurence, menu.product_name as MostPurchased
from dannys_diner.menu
join dannys_diner.sales 
on menu.product_id = sales.product_id
group by sales.product_id, menu.product_name

SELECT COUNT(product_id)
FROM dannys_diner.sales
group by sales.product_id

