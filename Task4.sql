Show tables;
Desc sales;
select * from sales;
select SaleDate, Amount, Customers from sales;
select Amount, Customers, GeoID from sales;

select SaleDate, Amount, Boxes, Amount/boxes from sales;
select SaleDate, Amount, Boxes, Amount/boxes as 'Amt per Box' from sales;
select * from sales where Amount > 10000;

select * from sales where Amount > 10000 order by Amount; 
select * from sales where Amount > 10000 order by Amount desc;
select * from sales where GeoID ='g1' order by PID, Amount asc;

select * from sales where Amount > 10000 and SaleDate >= '2020-01-01' ;
select SaleDate, Amount from sales where Amount > 10000 and year(SaleDate) = 2022 order by Amount desc;

select * from sales where boxes > 0 and boxes <=50 order by boxes asc;
select * from sales where boxes between 0 and 50 ;

select SaleDate, Amount, Boxes, weekday(SaleDate) as 'Day of week'
from sales where weekday(SaleDate)=4 ;

select * from people where team ='Delish' or team='Yummies';
select * from people where team in ('Delish', 'jucies');

select * from people where Salesperson like 'B%';
select * from people where Salesperson like '%B%';
select * from people where Salesperson like '%t';

select * from sales;
select SaleDate, Amount, 
		case when amount < 1000 then 'Under 1k'
			when amount < 5000 then 'Under 5k'
			when amount < 10000 then 'Under 10k'
		else '10k or More'
	end as 'Amount Category'
from sales;

select * from sales;
select * from people;
select s.SaleDate, s.amount, p.Salesperson, s.SPID, p.SPID
from sales s
join people p on p.SPID = s.SPID;

select s.SaleDate, s.Amount, s.PID, pr.product
from sales s
left join products pr on pr.pid = s.pid;

select s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.pid = s.pid;

select s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.pid = s.pid
where s.amount < 100;

select s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.pid = s.pid
where s.amount < 500
and p.Team = 'Delish';

select s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.pid = s.pid
where s.amount < 500
and p.Team = '';

select s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.pid = s.pid
join geo g on g.geoid = s.geoid
where s.amount < 500
and p.Team = ''
and g.Geo in ('New Zealand','India')
order by saleDate ;

select geoID, sum(amount) from sales group by geoID;
select geoID, avg(amount) from sales group by geoID;

select geoID, sum(amount), avg(amount), sum(boxes) 
from sales 
group by geoID;

select g.geo, sum(amount), avg(amount), sum(boxes) 
from sales s
join geo g on s.GeoID = g.geoID
group by g.geo;

select pr.category, p.team, sum(boxes), sum(amount)
from sales s 
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
group by pr.category, p.team
order by pr.category, p.team;

select pr.Product, sum(s.amount) as 'Total Amount'
from sales s
join products pr on pr.pid = s.pid
group by pr.Product
order by 'Total Amount' desc
limit 5;


    
    