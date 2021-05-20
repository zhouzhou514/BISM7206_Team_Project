-- this script query the database to answer questions about the business

show full tables;
drop table testsample;



-- Which lesson or service is mostly welcomed by the customers?
select bk.serviceId,count(*),sv.serviceName from booking bk 
inner join Service sv on sv.serviceId=bk.serviceId
group by bk.serviceId
order by count(*);
-- this script above shows the most frequently selected lession or plan selected by customer