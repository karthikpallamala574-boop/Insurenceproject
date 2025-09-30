create database Insurence;
use insurence;
select * from invoice;
select * from meeting11;
select * from opportunity;


-- NO OF INVOICES BY ACCOUNT EXCEUTIVE
select * from invoice;
select acc_exec , count(invoice_number) as no_of_invoice_by_acc_exec from invoice group by acc_exec order by count(invoice_number) desc;

-- NO OF MEETINGS BY ACCOUNT EXEX
select * from meeting11;
select acc_exec , count(meeting_date) as meeting_count from meeting11 group by acc_exec;

-- STAGE FUNNEL BY REVENUE
select * from opportunity;
select stage , sum(revenue_amount) as total_revenue from opportunity group by stage order by total_revenue desc;

-- OPEN OPPERTUNITIES TOP 5
select * from opportunity;
select opportunity_name , revenue_amount from opportunity order by revenue_amount desc limit 5;

-- TOP 4 OPPERTUNITY BY REVENUE
select * from opportunity;
select opportunity_name , revenue_amount from opportunity order by revenue_amount desc limit 4;

-- OPPORTUNITY BY PRODUCT_GROUP
select * from opportunity;
select product_group , count(opportunity_id) as total_opportunities , sum(revenue_amount) as total_revenue
 from opportunity group by product_group order by total_revenue desc;

-- COUNT OF MEETING DATE
select year(meeting_date) as meeting_year , count(meeting_date) as total_meetings
from meeting11 group by year(meeting_date) order by meeting_year;

-- Target

select * from individual_budgets;

create table budgets as
select sum(`New budget`)as new, sum(`Cross sell bugdet`)as cross_sell,sum(`Renewal Budget`)as renewal
from individual_budgets;

select * from budgets;


create table target_fy as
select 'new' as income_class,cross_sell as amount from budgets
union all
select 'cross sell' as income_class,cross_sell as amount from budgets
union all
select 'renewal' as income_class,renewal as amount from budgets;

select * from target_fy;


-- invoice
select * from invoice;

create table invoice_achieve as
select income_class,sum(Amount)as invoice_amt
from invoice
group by income_class;

select
income_class,
sum(Amount) as invoiced_achievement
from invoice
group by income_class;


