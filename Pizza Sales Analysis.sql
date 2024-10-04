SELECT *
FROM pizza_sales;

/********************
TOTAL REVENUE
*********************/

SELECT SUM(total_price) AS total_revenue
FROM pizza_sales;

/********************
Average Order Value
*********************/
SELECT ROUND(AVG(order_total),2) AS average_order_total
FROM (
	SELECT order_id, SUM(total_price) AS order_total
	FROM pizza_sales
	GROUP BY order_id 
	) 
AS order_totals;

/********************
Total Pizzas Sold
*********************/
SELECT SUM(quantity) AS total_pizzas_sold
FROM pizza_sales;

/********************
Total Orders
*********************/
SELECT COUNT(DISTINCT(order_id)) AS total_orders
FROM pizza_sales;

/********************
Weekly Orders
*********************/
SELECT 
    DATEPART(WEEKDAY, order_date) AS day_of_week,  
    COUNT(DISTINCT(order_id)) AS total_sales 
FROM 
    pizza_sales
GROUP BY 
    DATEPART(WEEKDAY, order_date)
ORDER BY
	day_of_week ASC;

/********************
Hourly Orders
*********************/
SELECT
	DATEPART(HOUR, order_time) AS time_of_day,
	COUNT(DISTINCT(order_id)) AS total_order
FROM 
	pizza_sales
GROUP BY 
    DATEPART(HOUR, order_time)
ORDER BY
	time_of_day ASC;

/********************
Monthly Orders
*********************/
SELECT
	DATEPART(MONTH, order_date) AS monthly_order,
	COUNT(DISTINCT(order_id)) AS total_order
FROM
	pizza_sales
GROUP BY 
	DATEPART(MONTH, order_date)
ORDER BY
	DATEPART(MONTH, order_date) ASC;
/********************
Sales By Pizza Name
*********************/
SELECT
	pizza_name,
	SUM(quantity) AS total_sales
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY
	total_sales DESC;

/********************
Sales By Pizza Category
*********************/
SELECT
	SUM(quantity) AS total_sales,
	pizza_category
FROM
	pizza_sales
GROUP BY
	pizza_category
ORDER BY
	total_sales DESC;

/********************
Sales By Pizza Size
*********************/
SELECT
	SUM(quantity) AS total_sales,
	pizza_size
FROM
	pizza_sales
GROUP BY
	pizza_size
ORDER BY
	total_sales DESC;