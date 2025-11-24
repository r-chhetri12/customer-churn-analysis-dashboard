--finding the duplicates
WITH Duplicate_cte As(
select *, ROW_NUMBER() OVER(partition by Customer_ID,Gender,Country, Offer,Internet_Type, Contract,Customer_status,Churn_Category ORDER BY Customer_ID)
as duplicate

from cust_info
)
select * from Duplicate_cte 
where duplicate > 1;


--removing the duplicates
WITH Duplicate_cte As(
select *, ROW_NUMBER() OVER(partition by Customer_ID,Gender,Country, Offer,Internet_Type, Contract,Customer_status,Churn_Category ORDER BY Customer_ID DESC)
as duplicate

from cust_info
)
delete from Duplicate_cte 
where duplicate > 1;



-- Standardize the data

select * from cust_info 
select  Distinct Churn_Category ,TRIM(Churn_Category)
from cust_info
order by 1;

select * from cust_info
where City LIKE 'Big Be%';

UPDATE cust_info
SET 
	Customer_ID = TRIM(Customer_ID),
	Gender = TRIM(Gender),
	Senior_Citizen=TRIM(Senior_Citizen),
	Country = TRIM(Country),
	State = TRIM(State),
	City = TRIM(City),
	Offer= TRIM(Offer),
	Internet_Type=TRIM(Internet_Type),
	Contract = TRIM(Contract),
	Payment_Method = TRIM(Payment_Method),
	Customer_Status =TRIM(Customer_Status),
	Churn_Category =TRIM(Churn_Category)

-- finding the null values

select 
	sum (case when Customer_ID IS NULL THEN 1 ELSE 0 END ) AS Cust,
	sum (case when Gender IS NULL THEN 1 ELSE 0 END ) AS Gender,
	sum (case when Age IS NULL THEN 1 ELSE 0 END ) AS Age,
	sum (case when Country IS NULL THEN 1 ELSE 0 END ) AS Cust,
	sum (case when State IS NULL THEN 1 ELSE 0 END ) AS Cust,
	sum (case when City IS NULL THEN 1 ELSE 0 END ) AS Cust,
	sum (case when Zip_Code IS NULL THEN 1 ELSE 0 END ) AS Cust,
	sum (case when Tenure_in_Months IS NULL THEN 1 ELSE 0 END ) AS Cust,
	sum (case when Offer IS NULL THEN 1 ELSE 0 END ) AS Cust,
	sum (case when Internet_Type IS NULL THEN 1 ELSE 0 END ) AS Cust,
	sum (case when Contract IS NULL THEN 1 ELSE 0 END ) AS Cust,
	sum (case when Payment_Method IS NULL THEN 1 ELSE 0 END ) AS Cust,

	sum (case when Customer_Status IS NULL THEN 1 ELSE 0 END ) AS Cust,
	sum (case when Churn_Label IS NULL THEN 1 ELSE 0 END ) AS Cust,
	sum (case when Churn_Category IS NULL THEN 1 ELSE 0 END ) AS Cust,
	sum (case when Churn_Reason IS NULL THEN 1 ELSE 0 END ) AS Cust


from cust_info;

-- Replace the null values 
Update cust_info
set Churn_Reason = 'Active Customer'
where Churn_Reason IS NULL;

