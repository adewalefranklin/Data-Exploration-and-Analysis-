-- Print details of shipments (sales) where amounts are > 2,000 and boxes are <100?

select * from sales where amount > 2000 and boxes < 100;

-- How many shipments (sales) each of the sales persons had in the month of January 2022?

select p.Salesperson, count(*) as ‘Shipment Count’
from sales s
join people p on s.spid = p.spid
where SaleDate between ‘2022-1-1’ and ‘2022-1-31’
group by p.Salesperson;

-- Which product sells more boxes? Milk Bars or Eclairs?

select pr.product, sum(boxes) as ‘Total Boxes’
from sales s
join products pr on s.pid = pr.pid
where pr.Product in (‘Milk Bars’, ‘Eclairs’)
group by pr.product;

-- Which product sold more boxes in the first 7 days of February 2022? Milk Bars or Eclairs?

select pr.product, sum(boxes) as ‘Total Boxes’
from sales s
join products pr on s.pid = pr.pid
where pr.Product in (‘Milk Bars’, ‘Eclairs’)
and s.saledate between ‘2022-2-1’ and ‘2022-2-7’
group by pr.product;

-- Which shipments had under 100 customers & under 100 boxes? Did any of them occur on Wednesday?

select * from sales
where customers < 100 and boxes < 100;

-- Did any of them occur on Wednesday?

select *,
case when weekday(saledate)=2 then ‘Wednesday Shipment’
else ”
end as ‘W Shipment’
from sales
where customers < 100 and boxes < 100;



