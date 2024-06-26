# Having 
# Having allows us to filter based off of an aggregated column

#Let's try filtering using the Where statement as we normally would

#Let's say we want to look at people who tipped more than 5 dollars and give them a discount
SELECT customer_id, SUM(tip) as total_tips 
FROM customer_orders
WHERE total_tips > 5
GROUP BY(customer_id)
ORDER BY total_tips;

#We get an error "Unknown column 'total_tips' in where clause"
#This is because of execution order. We are trying to filter based on a column that is basically created in the Group By statement which hasn't executed yet.

#What we can use is the having clause
SELECT customer_id, SUM(tip) as total_tips 
FROM customer_orders
GROUP BY(customer_id)
HAVING total_tips > 5
ORDER BY total_tips;

#Now our output works and we are able to filter on our aggregate functions columns








SELECT 	COUNT(customers.first_name) AS 'number of customers', 
		SUM(points) AS total_points, 
        state
FROM customers
GROUP BY state
HAVING total_points > 3000;