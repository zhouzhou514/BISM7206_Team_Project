-- run this script to create the SWS database.
-- remember to drop each table before creating it!!!
-- see relational data model diagram for more information.
show full tables;


-- create customer table
drop table if exists Customer;
create table Customer(
customerId int not null unique,
fName varchar(20) not null,
lName varchar(20) ,
primary key (customerId)
);

-- create Staff table
drop table if exists Staff;
create table Staff(
StaffId int not null unique,
fName varchar(20) not null,
lName varchar(20) ,
primary key (staffId)
);

-- create Instructor table
drop table if exists Instructor;
create table Instructor(
instructorId int not null unique,
primary key (instructorId)
);

-- create Plan table
drop table if exists Plan;
create table Plan(
planId int not null unique,
primary key (planId)
);

-- create add on service table
drop table if exists AddOnService;
create table AddOnService(
serviceId int not null unique,
primary key (serviceId)
);

-- create equipment table
drop table if exists Equipment;
create table Equipment(
equipmentId int not null unique,
equipementType varchar(20) not null,
primary key (equipmentId)
);

-- create lesson table
drop table if exists Lesson;
create table Lesson(
lessonId int not null unique,
description varchar(255),
primary key (lessonId)
);

-- create site table
drop table if exists Site;
create table Site(
siteId int not null unique,
address varchar(255) not null, 
primary key (siteId)
);


-- create booking table
drop table if exists Booking;
create table Booking(
bookingId int not null unique,
customerId int not null, 
planId int not null,
instructorId int,
serviceId int,
siteId int not null,
primary key (bookingId),
foreign key (customerId) references customer(customerId),
foreign key (planId) references plan(planId),
foreign key (instructorId) references Instructor(instructorId),
foreign key (serviceId) references AddOnService(serviceId),
foreign key (siteId) references Site(siteId)
