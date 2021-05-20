-- run this script to create the SWS database.
-- remember to drop each table before creating it!!!
-- see relational data model diagram for more information.
drop table if exists plan,lesson,basicservice;

show full tables;


-- create customer table
drop table if exists Customer;
create table Customer(
  customerId char(10) not null unique,
  fName varchar(50) not null,
  lName varchar(50),
  dateOfBirth varchar(20),
  address varchar(50),
  phone varchar(10) not null,
  primary key (customerId)
);

-- create Staff table
drop table if exists Staff;
create table Staff(
  staffId char(10) not null unique,
  fName varchar(50) not null,
  lName varchar(50),
  position varchar(20), -- job title
  city varchar(50),
  street varchar(50),
  postcode varchar(6),
  phone varchar(10) not null,
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
  foreign key (staffId) references Staff(staffId) on delete cascade on update cascade
);


-- create basic service table
--  equipment hiring and any kinds of lesson are considered as service
drop table if exists Service;
create table Service(
  serviceId char(10) not null unique,
  serviceName varchar(50) not null,
  duration int,
  serviceFee int not null,
  serviceDescription varchar(255),
  primary key (ServiceId)
);


-- create equipment table
drop table if exists Equipment;
create table Equipment(
  equipmentId char(10) not null unique,
  equipmentType varchar(50),
  isallocated bit(10),
  primary key (equipmentId)
);
/*create trigger tr_eq AFTER UPDATE on Equipment FOR EACH ROW 
BEGIN
	RAISEERROR('New Equipment has arrived!', 18, 18)
END;
*/
-- create site table
drop table if exists Site;
create table Site(
  siteId char(10) not null unique,
  address varchar(255) not null, 
  primary key (siteId)
);


-- create booking table
-- if a customer hire a equipment and a add on service, it will generate 2 booking record
drop table if exists Booking;
create table Booking(
  bookingId char(10) not null unique,
  customerId char(10) not null, 
  instructorId char(10),
  serviceId char(10) not null,
  numberOfService int,
  siteId char(10) not null,
  equipmentId char(10),
  startTime datetime,
  primary key (bookingId),
  foreign key (customerId) references customer(customerId) on delete cascade on update cascade,
  foreign key (instructorId) references Instructor(instructorId) on delete cascade on update cascade,
  foreign key (ServiceId) references Service(ServiceId) on delete cascade on update cascade,
  foreign key (siteId) references Site(siteId) on delete cascade on update cascade,
  foreign key (equipmentId) references Equipment(equipmentId) on delete cascade on update cascade
);
