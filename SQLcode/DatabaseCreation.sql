-- run this script to create the SWS database.
-- remember to drop each table before creating it!!!
-- see relational data model diagram for more information.
show full tables;


-- create customer table
drop table if exists Customer;
create table Customer(
  customerId char(10) not null unique,
  fName varchar(50) not null,
  lName varchar(50),
  dateOfBirth varchar(20),
  Address varchar(50),
  Phone varchar(10) not null,
  primary key (customerId)
);

-- create Staff table
drop table if exists Staff;
create table Staff(
  StaffId char(10) not null unique,
  fName varchar(50) not null,
  lName varchar(50),
  position varchar(20), -- job title
  City varchar(50),
  Street varchar(50),
  Postcode varchar(6),
  Phone varchar(10) not null,
  isInstructor bit not null,
  primary key (staffId)
);

-- create Instructor table
drop table if exists Instructor;
create table Instructor(
  instructorId char(10) not null unique,
  staffId char(10) not null,
  specialization varchar(50),
  primary key (instructorId),
  foreign key (staffId) references Staff(staffId)
);


-- create basic service table
--  equipment hiring and any kinds of lesson are considered as service
drop table if exists Service;
create table Service(
  ServiceId char(10) not null unique,
  ServiceName varchar(50) not null,
  duration int,
  ServiceFee int not null,
  ServiceDescription varchar(255),
  primary key (ServiceId)
);


-- create equipment table
drop table if exists Equipment;
create table Equipment(
  equipmentId char(10) not null unique,
  equipmentType varchar(50),
  isAllocated bit,
  primary key (equipmentId)
);


-- create site table
drop table if exists Site;
create table Site(
  siteId char(10) not null unique,
  address varchar(255) not null, 
  primary key (siteId)
);


-- create booking table
drop table if exists Booking;
create table Booking(
  bookingId char(10) not null unique,
  customerId char(10) not null, 
  instructorId char(10),
  ServiceId char(10) not null,
  siteId char(10) not null,
  equipmentId char(10),
  startTime datetime,
  primary key (bookingId),
  foreign key (customerId) references customer(customerId),
  foreign key (instructorId) references Instructor(instructorId),
  foreign key (ServiceId) references Service(ServiceId),
  foreign key (siteId) references Site(siteId),
  foreign key (equipmentId) references Equipment(equipmentId)
);
