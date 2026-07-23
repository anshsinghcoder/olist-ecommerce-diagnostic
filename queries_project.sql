use anshdb ;


/*1. Which five sub category items are generating the highest total sales but resulting in negative overall profit? */
select 
sub_category ,
Round (sum(sales) , 2 ) as total_sales,
Round (sum(profit) , 2 ) as total_profit 
from superstore 
group by sub_category
having sum( profit ) < 0 
order by total_sales desc
limit  5 ; 

/*2.What is the average delivery time (in days) for each shipping mode?*/
select
ship_mode,
round(avg(datediff(order_date , ship_date)),2) as avg_delivery_days
FROM superstore
GROUP BY ship_mode
ORDER BY avg_delivery_days ASC;

/*3.At what specific discount percentage does a sale officially stop being profitable?*/
SELECT
    discount,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_percentage
FROM superstore
GROUP BY discount
ORDER BY discount ASC;


/*4. Who are the most valuable customers, not just by total profit, but by how much they spend on an average order (AOV)? 
Data to Choose: */

SELECT 
    customer_name,
    segment,
    ROUND(SUM(sales), 2) AS lifetime_revenue,
    ROUND(SUM(profit), 2) AS lifetime_profit,
    ROUND(SUM(sales) / COUNT(order_id), 2) AS avg_order_value
FROM superstore
GROUP BY customer_name, segment
ORDER BY lifetime_profit DESC
LIMIT 5;


