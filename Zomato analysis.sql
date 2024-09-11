create database Zomato_Sales_Analysis;
use zomato_sales_Analysis;
select * from `main (1)`;
select * from `country (1)`;
select * from `currency (1)`;
1Q_------------------------------------------------;
CREATE TABLE CountryMap (
    CountryID INT AUTO_INCREMENT PRIMARY KEY,
    CountryName VARCHAR(100) NOT NULL,
    CountryCode VARCHAR(10) NOT NULL,
    Region VARCHAR(100),
    SubRegion VARCHAR(100),
    Population INT,
    Area DECIMAL(15,2),
    Capital VARCHAR(100)
);
2Q----------------------------------------------------------;
USE zomato_sales_analysis;

CREATE TABLE DateTable (
    DateKey DATE
);


CREATE TABLE CalendarTable AS
SELECT 
    DateKey,
    YEAR(DateKey) AS Year,
    MONTH(DateKey) AS MonthNo,
    DATE_FORMAT(DateKey, '%M') AS MonthFullName,
    CASE 
        WHEN MONTH(DateKey) IN (1, 2, 3) THEN 'Q1'
        WHEN MONTH(DateKey) IN (4, 5, 6) THEN 'Q2'
        WHEN MONTH(DateKey) IN (7, 8, 9) THEN 'Q3'
        ELSE 'Q4'
    END AS Quarter,
    DATE_FORMAT(DateKey, '%Y-%b') AS YearMonth,
    DAYOFWEEK(DateKey) AS WeekdayNo,
    DATE_FORMAT(DateKey, '%W') AS WeekdayName,
    CASE 
        WHEN MONTH(DateKey) = 4 THEN 'FM1'
        WHEN MONTH(DateKey) = 5 THEN 'FM2'
        WHEN MONTH(DateKey) = 6 THEN 'FM3'
        WHEN MONTH(DateKey) = 7 THEN 'FM4'
        WHEN MONTH(DateKey) = 8 THEN 'FM5'
        WHEN MONTH(DateKey) = 9 THEN 'FM6'
        WHEN MONTH(DateKey) = 10 THEN 'FM7'
        WHEN MONTH(DateKey) = 11 THEN 'FM8'
        WHEN MONTH(DateKey) = 12 THEN 'FM9'
        WHEN MONTH(DateKey) = 1 THEN 'FM10'
        WHEN MONTH(DateKey) = 2 THEN 'FM11'
        ELSE 'FM12'
    END AS FinancialMonth,
    CASE 
        WHEN MONTH(DateKey) IN (4, 5, 6) THEN 'Q1'
        WHEN MONTH(DateKey) IN (7, 8, 9) THEN 'Q2'
        WHEN MONTH(DateKey) IN (10, 11, 12) THEN 'Q3'
        ELSE 'Q4'
    END AS FinancialQuarter
FROM 
    DateTable;
    SELECT * FROM CalendarTable;
    3Q-------------------------------------------------------;
    select city , count(restaurantID) from `main (1)`
group by city;

select countryname , count(restaurantID) from `main (1)` as m 
left join `country (1)` as c on m.CountryCode =c.CountryID
group by countryname;

4Q-------------------------------------------------------------------------;

select distinct year(Date) as year ,count(*)
from `main (1)`
group by year(Date) order by year(Date);
select distinct monthname(Date) as month_name ,count(*)
from `main (1)`
group by monthname(Date) order by monthname(Date);
select distinct quarter(Date) as Quater ,count(*)
from `main (1)`
group by quarter(Date) order by quarter(Date);

5Q-----------------------------------------------------------;

select rating, count(*) as RestaurantCount
from `main (1)`
group by rating order by rating asc;

6Q-----------------------------------------------------------------;

select cost_range , count(*) as Totalrestaurants
from (select 
case 
when Average_Cost_for_two between 0 and 500 then '0-500'
when Average_Cost_for_two between 501 and 1000 then '501-1000'
when Average_Cost_for_two between 1001 and 1500  then '1001-1500'
when Average_Cost_for_two between 1501 and 430000 then '1501-430000'
else 'other'
End as cost_range
from `main (1)`) 
as subquery
group by cost_range;
7Q-------------------------------------------------------------------;

 SELECT 
    has_table_booking AS Has_Table_Booking,
    COUNT(*) AS Number_of_Restaurants,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `main (1)`)) AS Percentage_of_Restaurants
FROM 
    `main (1)`
GROUP BY 
    has_table_booking;
    
    8Q-------------------------------------------------------;
    
     SELECT 
    has_online_delivery AS Has_Online_Delivery,
  round(( COUNT(*)/ (SELECT COUNT(*) FROM `main (1)` ))*100,2) AS Percentage_of_Restaurants
FROM 
    `main (1)`
GROUP BY 
    has_online_delivery;
    
    9Q---------------------------------------------------------------;
    SELECT 
    cuisines,
    COUNT(*) AS num_restaurants
FROM 
    `main (1)`
GROUP BY 
    cuisines
ORDER BY 
    num_restaurants DESC;
    SELECT 
    cuisines,
    AVG(rating) AS avg_rating
FROM 
    `main (1)`
GROUP BY 
    cuisines
ORDER BY 
    avg_rating DESC;
    
    SELECT 
    city,
    COUNT(*) AS num_restaurants
FROM 
`main (1)`
GROUP BY 
    city
ORDER BY 
    num_restaurants DESC;
    SELECT 
    city,
    AVG(rating) AS avg_rating
FROM 
    `main (1)`
GROUP BY 
    city
ORDER BY 
    avg_rating DESC;
    
    10Q------------------------------------------------------;

    
    
    
    
    
    





    






