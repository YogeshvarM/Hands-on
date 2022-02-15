-- Importing the dumb_sql file from local directory into mysql.

-- Using the sales database
use sales;

-- Viewing the data of tables in sales database
Select * from sales.customers;
Select * from sales.date;
Select * from sales.markets;
Select * from sales.products;
Select * from sales.transactions;

-- Data Analysis
-- Transactions table have some problem in records.In currency feature it have INR and USD as records.For aggregrating purpose this will have impact on analysis. So we need to change USD into INR.


Select * from sales.transactions where currency='USD';

UPDATE sales.transactions
SET currency=REPLACE(currency, 'USD', 'INR')
WHERE currency LIKE 'USD';


-- 'csv' file for sales_amount in 'Chennai' market zone.

Select * from sales.transactions where market_code='Mark001';

-- 'csv' file for sales_amount in 'Chennai' market zone for year '2020'

Select * from sales.transactions 
Inner Join sales.date
on sales.date.date=sales.transactions.order_date
where year=2020;

-- for finding the total sales_qty in 'Chennai' zone for year 2020

Select count(sales_qty) as Total_Revenue from sales.transactions 
Inner Join sales.date
on sales.date.date=sales.transactions.order_date
where year=2020;

-- for finding the total sales_Qty in 'Chennai' zone for january,2020

Select count(sales_qty) as Total_Revenue from sales.transactions 
Inner Join sales.date
on sales.date.date=sales.transactions.order_date
where year=2020 and month_name='January';
