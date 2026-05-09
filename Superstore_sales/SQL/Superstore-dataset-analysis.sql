
 
--KPI Overview — ³¹czna sprzeda¿, zysk, iloœæ zamówieñ, œrednia wartoœæ zamówieni
select
round (avg(sum_of_order), 2)  as avg_of_all,
count(*) all_orders,
 cast(cast(round(sum(sum_of_order) ,1) as decimal ) as varchar) + ' USD'  as all_sales, 
cast(cast(round(sum(sum_profit) ,1) as decimal ) as varchar)  +  ' USD'  as all_profit 
from(
select 
order_id,
sum(sales) as sum_of_order,
sum(Profit) as sum_profit

from superstore
group by Order_ID)gl


--Sprzeda¿ wg kategorii i sub-kategorii z % udzia³em w ca³oœci 

select
Category,
sub_category,
round(sales_per_Sub,2),
 cast(round(sales_per_Sub * 100 / (sum (sales_per_Sub) over (   )),2) as varchar)   + ' %' as percen_of_all
from (
select
	category,sub_category,/
	sum(sales) as sales_per_Sub
	
	from superstore
	group by category,sub_category
)
f order by (sales_per_Sub * 100 / (sum (sales_per_Sub) over (   )) ) desc


--Top 10 produktów wg zysku (ranking + % ³¹cznego zysku)

select 
top 10
product_name, 
sum_profit,
rank () over (order by sum_profit desc) rank_all,
cast(round(sum_profit * 100 / (sum(sum_profit) over ()),2) as varchar)   + '%' as percen_of_all
from 
(
select product_name, sum(profit) as sum_profit 
from superstore
group by product_name

)l

--Analiza regionalna — sprzeda¿, zysk, mar¿a % per region

select Region, round(sum(Sales),2) as sum_sales, round(sum(profit),2) as sum_profit, cast(round(sum(profit) * 100 / sum(sales),2 )as varchar) + ' %' as margin from superstore 
group by Region

--Trend miesiêczny sprzeda¿y + zmiana MoM % (window function)

select eomonth(Order_Date) as  month, sum(sales) sum_sales, 
cast(round( (sum(sales) - lag(sum(sales)) over (order by eomonth(Order_Date) asc))/ lag (sum(sales)) over (order by eomonth(Order_Date) asc) * 100 ,2) as varchar) + ' %' as sales_mom from superstore
group by eomonth(Order_Date)



--Analiza segmentów klientów (Consumer/Corporate/Home Office) wg LTV 

select
Segment,
round(avg(sales_per_segment),2) as LTV_sales,
round(avg(profit_per_cap),2) as LTV_profit
from(
	select Customer_ID, Segment,sum(Sales) as sales_per_segment, sum(Profit) as profit_per_cap from superstore
	group by Segment,Customer_ID
)t
group by Segment

 
 --Wp³yw rabatów na mar¿ê — korelacja Discount vs Profit
 
 select
 discount,
 round (avg(100 -((sales - profit) * 100 /sales)),2) as margin
 
 from  superstore        
 group by Discount
 order by Discount

--Produkty ze strat¹ (Profit < 0) — ile, które kategorie, ³¹czna strata

select
category,Product_Name,hoow_many_each, round(lost,2),count(Product_Name) over() how_many_of_all, sum(lost) over () how_much_of_all
from
(
	 select category, Product_Name  , count(Product_Name ) as hoow_many_each,sum(profit) as lost from superstore
	 group by Category,product_name
)t 
where lost < 0
order by lost


--Analiza czasu dostawy (Ship Date - Order Date) wg Ship Mode

select 
Ship_Mode,
avg(datediff (day,order_date, Ship_Date)) ship_time

from superstore
group by Ship_Mode


--Cohort klientów — nowi vs powracaj¹cy klienci per kwarta³


with Rank_dssd as (
select 
customer_id,
min(Order_Date) over (partition by customer_id  ) first_order_date,
Sales,
order_date
from superstore
)

select
year(order_date) ,datepart(QUARTER , order_date),type_of_client,  COUNT(DISTINCT customer_id)
from
	(
	select customer_id , datepart(QUARTER , first_order_date) as sss , order_date,sales,
		case 
		when datepart(QUARTER , order_date )  = datepart(QUARTER , first_order_date ) and YEAR (first_order_date) = year(order_date) then 'nowy'
		else   'powracaj¹cy'
		end as type_of_client
	from  Rank_dssd
	)d
	group by year(order_date) ,datepart(QUARTER , order_date),type_of_client

