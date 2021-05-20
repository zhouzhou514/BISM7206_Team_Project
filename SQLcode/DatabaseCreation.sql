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
-- such as SUP board hire
drop table if exists BasicService;
create table BasicService(
  basicServiceId char(10) not null unique,
  basicServiceName varchar(50) not null,
  duration int,
  basicServiceFee int not null,
  basicServiceDescription varchar(255),
  primary key (basicServiceId)
);

-- create add on service table
-- three types of extra services
drop table if exists AddOnService;
create table AddOnService(
  addOnServiceId char(10) not null unique,
  addOnServiceName varchar(255) not null,
  duration int,
  addOnServiceFee int not null,
  addOnServiceDescription varchar(255),
  primary key (addOnServiceId)
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
  basicServiceId char(10) not null,
  addOnServiceId char(10),
  siteId char(10) not null,
  equipmentId char(10),
  startTime datetime,
  primary key (bookingId),
  foreign key (customerId) references customer(customerId),
  foreign key (instructorId) references Instructor(instructorId),
  foreign key (basicServiceId) references BasicService(basicServiceId),
  foreign key (addOnServiceId) references AddOnService(addOnServiceId),
  foreign key (siteId) references Site(siteId),
  foreign key (equipmentId) references Equipment(equipmentId)
);
