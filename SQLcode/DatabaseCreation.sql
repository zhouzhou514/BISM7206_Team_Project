-- run this script to create the SWS database.
show full tables;
select * from testsample;
-- create customer table
create table Customer(
customerId int,
primary key (customerId)
);