--Lesson 10 – Aggregations (COUNT, SUM, AVG, GROUP BY)
--SECTION 1 – COUNT Aggregations (10 Questions)
--1. How many total properties are in the database?

SELECT Count(*) AS Total_Property FROM property24

--2. How many properties are listed in each province?


SELECT province, COUNT(*) AS property_count
FROM Property24
GROUP BY province;

--3. How many properties are listed in each city?

SELECT CITY, COUNT(*) AS City_count
FROM Property24
GROUP BY CITY

--4. How many properties have more than 2 bedrooms?

SELECT COUNT(*) AS properties_with_more_than_2_bedrooms
FROM Property24
WHERE bedrooms > 2

--5. How many properties have 2 or more bathrooms?

SELECT COUNT(*) AS properties_with_2_or_more_bathrooms
FROM Property24
WHERE bathrooms >= 2


--6. How many properties have parking for at least 2 cars?


SELECT COUNT(*) AS properties_parking
FROM Property24
WHERE PARKING >= 2


--7. How many properties are priced above R3,000,000?


SELECT COUNT(*) AS Properties_Price
FROM Property24
WHERE PROPERTY_PRICE > 3000000;


--8. How many properties are in Gauteng?

SELECT COUNT(*) AS Property_Gauteng
FROM Property24
WHERE PROVINCE = 'Gauteng' 


SELECT * FROM Property24

--9. How many properties per province have floor size greater than 200?

SELECT 
    PROVINCE,
    COUNT(*) AS Property_Size
FROM Property24
WHERE FLOOR_SIZE > 200
GROUP BY PROVINCE;

--10. How many distinct provinces are in the table?

SELECT COUNT(DISTINCT PROVINCE) AS distinct_provinces
FROM Property24;

--SECTION 2 – SUM Aggregations (10 Questions)
--11. What is the total value of all properties combined?

SELECT
  SUM(PROPERTY_PRICE) AS total_property_value
FROM Property_24

--12. What is the total property value per province?
SELECT * FROM Property24


SELECT
  PROVINCE,
  SUM(PROPERTY_PRICE) AS total_property_value
FROM Property24
GROUP BY PROVINCE
ORDER BY total_property_value DESC, PROVINCE;


--13. What is the total property value per city?

SELECT
  CITY,
  SUM(PROPERTY_PRICE) AS total_property_value
FROM Property24
GROUP BY CITY
ORDER BY total_property_value DESC, CITY;

--14. What is the total monthly repayment for all properties?

SELECT
  SUM(Monthly_Repayment) AS total_monthly_repayment
FROM Property24;

--15. What is the total monthly repayment per province?

SELECT
  PROVINCE,
  SUM(Monthly_Repayment) AS total_monthly_repayment
FROM Property24
GROUP BY PROVINCE
ORDER BY total_monthly_repayment DESC, PROVINCE;


--16. What is the total once-off cost for all properties?


SELECT
  SUM(Total_Once_off_Costs) AS total_once_off_costs
FROM Property24

--17. What is the total once-off cost per province?

SELECT
  PROVINCE,
  SUM(Total_Once_off_Costs) AS total_once_off_costs
FROM Property24
GROUP BY PROVINCE
ORDER BY total_once_off_costs DESC, PROVINCE;

--18. What is the total property value for Gauteng?

SELECT
  SUM(PROPERTY_PRICE) AS total_property_value_gauteng
FROM Property24
WHERE PROVINCE = 'Gauteng';

--19. What is the total property value for properties priced above R4,000,000?

SELECT
  SUM(PROPERTY_PRICE) AS total_value_above_4m
FROM Property24

--20. What is the total minimum gross monthly income required per province?

SELECT
  PROVINCE,
  SUM(Min_Gross_Monthly_Income) AS total_min_gross_monthly_income
FROM Property24
GROUP BY PROVINCE
ORDER BY total_min_gross_monthly_income DESC, PROVINCE;

--SECTION 3 – AVG Aggregations (10 Questions)
--21. What is the average property price overall?

SELECT
  AVG(PROPERTY_PRICE) AS avg_property_price
FROM Property24

--22. What is the average property price per province?

SELECT
  PROVINCE,
  AVG(PROPERTY_PRICE) AS avg_property_price
FROM Property24
GROUP BY PROVINCE
ORDER BY avg_property_price DESC, PROVINCE;

--23. What is the average property price per city?

SELECT
  CITY,
  AVG(PROPERTY_PRICE) AS avg_property_price
FROM Property24
GROUP BY CITY
ORDER BY avg_property_price DESC, CITY;

--24. What is the average number of bedrooms per province?

SELECT
  PROVINCE,
  AVG(BEDROOMS) AS avg_bedrooms
FROM Property24
GROUP BY PROVINCE
ORDER BY avg_bedrooms DESC, PROVINCE;

--25. What is the average number of bathrooms per province?

SELECT
  PROVINCE,
  AVG(BATHROOMS) AS avg_bathrooms
FROM Property24
GROUP BY PROVINCE
ORDER BY avg_bathrooms DESC, PROVINCE;

--26. What is the average floor size per province?

SELECT
  PROVINCE,
  AVG(FLOOR_SIZE) AS avg_floor_size
FROM Property24
GROUP BY PROVINCE
ORDER BY avg_floor_size DESC, PROVINCE;

--27. What is the average monthly repayment per province?

SELECT
  PROVINCE,
  AVG(Monthly_Repayment) AS avg_monthly_repayment
FROM Property24
GROUP BY PROVINCE
ORDER BY avg_monthly_repayment DESC, PROVINCE;

--28. What is the average once-off cost per province?

SELECT
  PROVINCE,
  AVG(Total_Once_off_Costs) AS avg_once_off_costs
FROM Property24
GROUP BY PROVINCE
ORDER BY avg_once_off_costs DESC, PROVINCE;

--29. What is the average minimum gross monthly income per province?

SELECT
  PROVINCE,
  AVG(Min_Gross_Monthly_Income) AS avg_min_gross_monthly_income
FROM Property24
GROUP BY PROVINCE
ORDER BY avg_min_gross_monthly_income DESC, PROVINCE;

--30. What is the average property price for properties above R3,000,000?

SELECT
  AVG(PROPERTY_PRICE) AS avg_price_above_3m
FROM Property24
WHERE PROPERTY_PRICE > 3000000;

--SECTION 4 – GROUP BY + Filtering (10 Questions)
--31. Which province has the highest average property price?

SELECT
  PROVINCE,
  AVG(PROPERTY_PRICE) AS avg_price
FROM Property24
GROUP BY PROVINCE
ORDER BY avg_price DESC, PROVINCE ASC
LIMIT 1;         

--32. Which province has the lowest average property price?

--33. Which city has the highest total property value?

SELECT
  CITY,
  SUM(PROPERTY_PRICE) AS total_value
FROM Property24
GROUP BY CITY
ORDER BY total_value DESC, CITY
LIMIT 1;

--34. Which city has the lowest average property price?

SELECT CITY, AVG(PROPERTY_PRICE) AS avg_price
  FROM Property24
  GROUP BY CITY
)
SELECT CITY, avg_price
FROM avgs
WHERE avg_price = (SELECT MIN(avg_price) FROM avgs)
ORDER BY CITY;

--35. How many properties per province are priced above R2,000,000?

SELECT
  PROVINCE,
  COUNT(*) AS properties_above_2m
FROM Property24
WHERE PROPERTY_PRICE > 2000000
GROUP BY PROVINCE
ORDER BY properties_above_2m DESC, PROVINCE;

--36. What is the average floor size per province for properties above R3,000,000?

SELECT
  PROVINCE,
  AVG(FLOOR_SIZE) AS avg_floor_size_above_3m
FROM Property24
WHERE PROPERTY_PRICE > 3000000
GROUP BY PROVINCE
ORDER BY avg_floor_size_above_3m DESC, PROVINCE;

--37. What is the total property value per province for properties with 3 or more bedrooms?

SELECT
  PROVINCE,
  SUM(PROPERTY_PRICE) AS total_value_3plus_bed
FROM Property24
WHERE BEDROOMS >= 3
GROUP BY PROVINCE
ORDER BY total_value_3plus_bed DESC, PROVINCE;

--38. What is the average monthly repayment per province for properties above R4,000,000?

SELECT
  PROVINCE,
  AVG(Monthly_Repayment) AS avg_monthly_repayment_above_4m
FROM Property24
WHERE PROPERTY_PRICE > 4000000
GROUP BY PROVINCE
ORDER BY avg_monthly_repayment_above_4m DESC, PROVINCE;

--39. How many properties per city have parking for 2 or more cars?

SELECT
  CITY,
  COUNT(*) AS properties_with_2plus_parking
FROM Property24
WHERE PARKING >= 2
GROUP BY CITY
ORDER BY properties_with_2plus_parking DESC, CITY;

--40. What is the average minimum gross monthly income per province for properties above
--R5,000,000?

SELECT
  PROVINCE,
  AVG(Min_Gross_Monthly_Income) AS avg_min_income_above_5m
FROM Property24
WHERE PROPERTY_PRICE > 5000000
GROUP BY PROVINCE
ORDER BY avg_min_income_above_5m DESC, PROVINCE;
