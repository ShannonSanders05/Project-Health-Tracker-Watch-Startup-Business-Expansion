/*
--------------------------------------------------------------------
PERCENTAGE OF PROPERTY PRICE PER STATE AND POPULATION
--------------------------------------------------------------------
*/

SELECT 
	property_prices.state_usa,
	ROUND(avg_price/ (SELECT SUM(avg_price) FROM property_prices) * 100,2) AS property_prices,
	ROUND(estimate / (SELECT SUM(estimate) FROM population) * 100,2) AS population 
FROM property_prices
INNER JOIN population
ON 	population.state_usa = property_prices.state_usa

-----------------------------------------------
/* TOP HIGHEST AVERAGE PROPERTY PRICE */

SELECT 
	state_usa,  
	avg_price AS average_property_price
FROM property_prices
ORDER BY average_property_price DESC
LIMIT 5

/* TOP LOWEST PROPERTY PRICE */

SELECT 
	state_usa,  
	avg_price AS average_property_price
FROM property_prices
ORDER BY average_property_price ASC
LIMIT 5

-----------------------------------------------


/*TOP HIGHEST POPULATION */

SELECT 
	state_usa,  
	estimate
FROM population
ORDER BY estimate DESC
LIMIT 5

/*TOP LOWEST POPULATION */

SELECT 
	state_usa,  
	estimate
FROM population
ORDER BY estimate ASC
LIMIT 5


/*
--------------------------------------------------------------------
PROPERTY PRICES ACROSS DIFFERENT STATES
--------------------------------------------------------------------
*/

SELECT state_usa, avg_price FROM property_prices

-----------------------------------------------



/*
--------------------------------------------------------------------
DISTRIBUTION OF HEALTHCARE SPENDING ACROSS DIFFERENT STATES
--------------------------------------------------------------------
*/

SELECT * FROM health_spending

-----------------------------------------------


/*
--------------------------------------------------------------------
AVERAGE PROFIT FOR COMPETITORS IN EACH STATE
--------------------------------------------------------------------
*/

SELECT state_usa, AVG(profit) FROM competitors
GROUP BY state_usa
ORDER BY AVG(profit) 

-----------------------------------------------


/*
-----------------------------------------------------------------------------------------
DATA FOR CORRELATION BETWEEN PROPERTY PRICES AND POPULATION
-----------------------------------------------------------------------------------------
*/

SELECT 
	property_prices.state_usa,  
	avg_price,
	estimate AS population
FROM property_prices
INNER JOIN population
ON 	property_prices.state_usa = population.state_usa

------------------------------------------------



/*
-----------------------------------------------------------------------------------------
DATA FOR CORRELATION BETWEEN COMPETITOR COMPANIES' PROFITS AND POPULATION
-----------------------------------------------------------------------------------------
*/

SELECT 
	population.state_usa,
	estimate AS population,
	competitors_profit
FROM population
INNER JOIN 
	(
		SELECT
			competitors.state_usa,
			SUM(profit) AS competitors_profit
		FROM
			competitors
		GROUP BY
			competitors.state_usa
	)
competitors 
ON 	competitors.state_usa = population.state_usa
order by  competitors_profit
-------------------------------------------------

/*
-----------------------------------------------------------------------------------------
DATA FOR CORRELATION BETWEEN STATE INCOME HEALTHCARE SPENDING
-----------------------------------------------------------------------------------------
*/

SELECT 
	state_income.state_usa,  
	average_income,
	avg_spending
FROM state_income
INNER JOIN health_spending
ON 	health_spending.state_usa = state_income.state_usa

------------------------------------------------

/*
-----------------------------------------------------------------------------------------
DATA FOR CORRELATION BETWEEN PROPERTY PRICES AND STATE INCOME
-----------------------------------------------------------------------------------------
*/

SELECT 
	property_prices.state_usa,
	avg_price AS avg_property_price,
	average_income
FROM property_prices
INNER JOIN state_income
ON 	property_prices.state_usa = state_income.state_usa

------------------------------------------------

/*
-----------------------------------------------------------------------------------------
DATA FOR CORRELATION BETWEEN HEALTH SPENDING AND POPULATION
-----------------------------------------------------------------------------------------
*/

SELECT 
	health_spending.state_usa,
	avg_spending AS healthcare_spending,
	estimate AS population
FROM health_spending
INNER JOIN population
ON 	health_spending.state_usa = population.state_usa
order by healthcare_spending

------------------------------------------------

/*
-----------------------------------------------------------------------------------------
DATA FOR STATE INCOME, POPULATION AND HEALTHCARE SPENDING
-----------------------------------------------------------------------------------------
*/

SELECT 
	health_spending.state_usa,
	avg_spending AS healthcare_spending,
	estimate AS population,
	average_income
FROM health_spending
INNER JOIN population ON	health_spending.state_usa = population.state_usa
INNER JOIN state_income ON health_spending.state_usa = state_income.state_usa


------------------------------------------------


/*ADDITIONAL TASK AND QUESTIONS*/

-----------------------------------------------------------------------------------------

SELECT state_usa, avg_spending FROM health_spending
ORDER BY avg_spending DESC
LIMIT 10