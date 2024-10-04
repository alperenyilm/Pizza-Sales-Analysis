# Pizza Sales Analysis Project

## Table of Contents
1. [Project Description](#project-description)
2. [Technologies Used](#technologies-used)
3. [Dataset](#dataset)
4. [Data Cleaning and Preparation](#data-cleaning-and-preparation)
5. [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)
6. [Data Analysis](#data-analysis)
7. [Results/Findings](#resultsfindings)
8. [Recommendations](#recommendations)
9. [Limitations](#limitations)

---

## Project Overview

This project aims to analyze pizza sales data in order to identify key business insights, such as customer preferences, popular pizzas, and peak sales times. The data includes transactional details such as pizza type, size, quantity, price, and order time. By leveraging these insights, the project can help in optimizing the menu, pricing strategies, and promotional efforts.
![image](https://github.com/user-attachments/assets/4b6d1c51-36f8-4991-adf4-5d3069ce5300)
![image](https://github.com/user-attachments/assets/a181403e-8e8b-44c0-b0b8-510322b7b94b)

---

## Technologies Used

- **SQL**: To query and summarize the data.
- **Power BI (PBIX)**: For creating visualizations and dashboards.
- **CSV/Excel**: For raw data storage and basic analysis.

---

## Dataset

- **Source**: The dataset was provided in CSV format.
- **Structure**: The dataset includes the following columns:
  - `order_details_id`: Unique identifier for each order detail.
  - `order_id`: Identifier for the order.
  - `pizza_id`: Identifier for the specific pizza ordered.
  - `quantity`: Quantity of pizzas ordered.
  - `order_date`: Date when the order was placed.
  - `order_time`: Time when the order was placed.
  - `unit_price`: Price of a single pizza.
  - `total_price`: Total price for the order.
  - `pizza_size`: Size of the pizza (e.g., M, L).
  - `pizza_category`: Category (e.g., Classic, Veggie).
  - `pizza_ingredients`: Ingredients used in the pizza.
  - `pizza_name`: Name of the pizza.

---

## Data Cleaning and Preparation

- **Delimiter Handling**: The CSV file used semicolons (`;`), which were properly handled during the loading process.
- **Missing Values**: No major missing values were detected.
- **Date and Time Formatting**: Date and time fields were standardized for consistent analysis.
- **Price Formatting**: Corrected the `unit_price` and `total_price` columns by converting commas to decimal points where necessary.

---

## Exploratory Data Analysis (EDA)

The exploratory analysis focused on answering the following key questions:
1. **What is the total revenue generated?**  
   - Total revenue was calculated by summing the `total_price` field.

2. **How many pizzas were sold?**  
   - The total quantity of pizzas sold was derived by summing the `quantity` field.

3. **What is the average value of an order?**  
   - Average order value was determined by calculating the mean of total prices per order.

4. **When do most orders occur?**  
   - Peak order times were identified by grouping orders by the hour and day of the week.

5. **Which pizza categories are most popular?**  
   - Pizza sales were grouped by categories like 'Classic', 'Veggie', and 'Supreme' to determine popularity.

---

## Data Analysis

### SQL queries were used for deeper analysis:
- **Total Revenue**: Sum of the `total_price` field.
- **Average Order Value**: Average total price per order.
- **Total Pizzas Sold**: Sum of the `quantity` field.
- **Weekly and Hourly Orders**: Grouped and counted by the day of the week and time of day.
- **Pizza Category and Name Sales**: Grouped by pizza categories and names to identify popular items.
  
Example SQL queries used:
```sql
SELECT SUM(total_price) AS total_revenue FROM pizza_sales;

SELECT ROUND(AVG(order_total),2) AS average_order_total
FROM (
    SELECT order_id, SUM(total_price) AS order_total
    FROM pizza_sales
    GROUP BY order_id
) AS order_totals;

SELECT COUNT(DISTINCT(order_id)) AS total_orders FROM pizza_sales;
```

### Power BI Calculations and Columns
Several calculated columns and measures were created in Power BI to enhance the analysis:

#### Calculated Columns:

Tabii, işte başlıkları kalın olacak şekilde düzenledim:

**Order Day**: Extracts the first three letters of the day of the week for easier grouping and visualization.  
Order Day = UPPER(LEFT(pizza_sales[Day Name], 3))

**Order Month**: Extracts the first three letters of the month for better clarity in graphs.  
Order Month = UPPER(LEFT(pizza_sales[Month Name], 3))

#### **Measures**:
**Total Orders**: This measure calculates the distinct number of orders.  
Total Orders = DISTINCTCOUNT(pizza_sales[order_id])

**Total Pizzas Sold**: This measure sums the quantity of pizzas sold.  
Total Pizzas Sold = SUM(pizza_sales[quantity])

**Total Revenue**: This measure sums the total revenue from pizza sales.  
Total Revenue = SUM(pizza_sales[total_price])

**Average Order Value**: This measure calculates the average value per order.  
Average Order Value = [Total Revenue] / [Total Orders]

**Average Pizzas Per Order**: This measure calculates the average number of pizzas per order.  
Average Pizzas Per Order = [Total Pizzas Sold] / [Total Orders]

### **Results/Findings**

The analysis results are summarized as follows:

**Total Revenue**: The total revenue generated from pizza sales is 817.86K. This data indicates strong sales volume, particularly supported by higher order volumes during weekdays (Wednesday and Friday).

**Total Pizzas Sold**: A total of 50K pizzas were sold. The majority of pizzas sold were in the Large and Medium sizes, while smaller sizes saw significantly fewer sales. This suggests a customer preference for larger pizzas.

**Total Orders**: There were 21K total orders, and the average order value was calculated to be 38.31. The average order value indicates a solid pricing strategy for the business.

**Top 5 Pizzas by Orders and Revenue**: The most ordered pizzas included "The Classic Deluxe" and "The Hawaiian". In terms of revenue, "The Thai Chicken Pizza" and "The Barbecue Chicken Pizza" stood out as the top performers.

**Sales by Time of Day and Day of the Week**: Most orders were concentrated during lunch hours (12:00-14:00) and evening hours (17:00-19:00). Friday was the busiest day of the week, while Sunday had the lowest order volume.

**Sales Breakdown by Pizza Category**: Classic pizzas (26.91%) were the best-selling category, followed by Supreme (23.96%) and Veggie (23.96%) pizzas. This demonstrates a clear preference for Classic pizza options among customers.

**Monthly Order Trends**: Sales peaked in July and August, followed by a gradual decline. This indicates possible seasonal demand, which could be linked to summer promotions or events.

### **Recommendations**

**Target High-Demand Times for Promotions**: Focus marketing efforts on the high-demand hours, particularly during lunch (12:00-14:00) and dinner (17:00-19:00) times. Special promotions or discounts during these periods can further boost customer engagement and sales.

**Focus on Best-Selling Pizzas**: Pizzas like "The Thai Chicken Pizza" and "The Classic Deluxe" are among the top sellers. Promotions specifically for these high-performing items can drive even greater revenue. Similarly, optimizing the menu by focusing on these popular pizzas can streamline customer choices.

**Menu Optimization for Low-Performing Pizzas**: The least popular pizzas, such as "The Brie Carre" and "The Green Garden", could be removed from the menu or promoted differently. Menu adjustments should be considered to maximize profitability by highlighting the most popular or profitable items.

**Increase Marketing for Weekends**: Despite the high order volume on Fridays, weekend sales—especially on Sundays—show a significant drop. Introducing weekend-exclusive offers or family-sized meal deals could help increase sales on weekends.

**Improve Seasonal Sales Strategy**: Sales peaked during the summer months (July and August). Building a targeted marketing strategy to capitalize on these seasonal trends can enhance profitability. Advanced planning for inventory and promotions could further boost revenue during these peak months.

### **Limitations**

Some limitations of the analysis include:

**Date Range**: The data covers a limited time period (2015). Future analyses could benefit from a broader date range to capture long-term trends and more comprehensive insights.

**Customer Segmentation**: The dataset does not include detailed customer segmentation data, such as demographics or purchase behavior. For deeper insights, collecting more customer-specific data (e.g., age, location, frequency of orders) would be beneficial.

**External Factors**: The data does not account for external factors such as weather conditions, economic influences, or promotional campaigns that could have affected sales trends. Incorporating external data could help explain some seasonal trends or regional differences in sales.

**Limited Geographic Data**: The dataset does not include geographic or regional breakdowns for the sales data. Expanding the analysis to consider geographical preferences and regional marketing strategies could enhance targeted promotions and sales campaigns.

**Missing Service Type Information**: The dataset does not differentiate between dine-in and takeout orders, which could provide deeper insights into customer preferences and order behaviors. Adding this information in future datasets would allow for more targeted marketing strategies and operational improvements.

