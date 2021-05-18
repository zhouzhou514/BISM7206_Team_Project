-- run this script to create the SWS database.
-- remember to drop each table before creating it!!!
-- see relational data model diagram for more information.
show full tables;
select * from testsample;

-- create customer table
drop table if exists Customer;
create table Customer(
customerId int,
primary key (customerId)
);

-- create Staff table
drop table if exists Staff;
create table Staff(
StaffId int,
primary key (staffId)
);

-- create Instructor table
drop table if exists Instructor;
create table Instructor(
instructorId int,
primary key (instructorId)
);

-- create Plan table
drop table if exists Plan;
create table Plan(
planId int,
primary key (planId)
);

-- create add on service table
drop table if exists AddOnService;
create table AddOnService(
serviceId int,
primary key (serviceId)
);

-- create equipment table
drop table if exists Equipment;
create table Equipment(
equipmentId int,
primary key (equipmentId)
);

-- create lesson table
drop table if exists Lesson;
create table Lesson(
lessonId int,
primary key (lessonId)
);

-- create site table
drop table if exists Site;
create table Site(
siteId int,
primary key (siteId)
);


-- create booking table
drop table if exists Booking;
create table Booking(
bookingId int,
customerId int, 
planId int,
instructorId int,
serviceId int,
siteId int,
primary key (bookingId),
foreign key (customerId) references customer(customerId),
foreign key (planId) references plan(planId),
foreign key (instructorId) references Instructor(instructorId),
foreign key (serviceId) references AddOnService(serviceId),
foreign key (siteId) references Site(siteId)
);