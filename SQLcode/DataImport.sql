-- this script import data in to the SWS database

show full tables;

-- filling the staff table
delete from Staff where staffId='';
INSERT INTO Staff(staffId,fName,lName,phone,isInstructor)
VALUES 
('STF0000001','Katie','Johnson',8917523,1),
('STF0000002','Dave','Wilson',8116590,1);
select * from staff;


-- filling the customer table
delete from Customer where customerId='CL00000002';
INSERT INTO Customer(customerId,fName,lName,phone,dateOfBirth,address)
VALUES 
('CUST000001','ZHI','HE',0450521617,null,'120 mary St, brisbane city, qld 4000'),
('CUST000002','MINGZHOU','YANG',0905100680,19970710,null),
('CUST000003','CHENGWEI','YU',1145141919,19970319,null),
('CUST000004','ZHENZHE','DAI',0905100680,19970710,null),
('CUST000005','MINGZHOU','YANG',0905100680,19970710,null),
('CUST000006','MINGZHOU','YANG',0905100680,19970710,null)
;
select * from Customer;


-- filling the Service table
delete from Service where serviceId='INS0000002';
INSERT INTO Service(serviceId,serviceName,duration,serviceFee,serviceDescription)
VALUES 
('KKH0000001','kayak_hiring',1,25,'hire a kayak with a lifejacket'),
('BSUP000001','basic_SUP_ 1h',1,25,'basic SUP board hire for 1 hour'),
('BSUP000002','basic_SUP_ 2h',2,40,'basic SUP board hire for 2 hour'),
('BSUP000003','basic_SUP_ 3h',3,55,'basic SUP board hire for 3 hour'),
('BSUP000004','basic_SUP_ 4h',6,90,'basic SUP board hire for 6 hour'),
('ADSUP00001','Private_lesson',1,45,'add-on service'),
('ADSUP00002','River_tour_with_instructor',1,50,'add-on service'),
('ADSUP00003','SUP_board_Yoga_lesson ',1,40,'add-on service'),
('SSL0000001','smurfinglesson_Beginner',2,200,'basic smurfing lesson'),
('SSL0000002','smurfinglesson_Intermediate',2,220,'Intermediate smurfing lesson'),
('SSL0000003','smurfinglesson_Advanced',2,240,'Advanced smurfing lesson')
;
select * from Service;

-- filling the Equipment table
delete from Equipment where equipmentId='';
INSERT INTO Equipment(equipmentId,equipmentType,isAllocated)
VALUES 
('EQKY000001','Kayak with a lifejacke',1),
('EQKY000002','Kayak with a lifejacke',0),
('EQKY000003','Kayak with a lifejacke',0),
('EQKY000004','Kayak with a lifejacke',0),
('EQSB000001','Basic SUP board',1),
('EQSB000002','Basic SUP board',1),
('EQSB000003','Basic SUP board',1),
('EQSB000004','Basic SUP board',0)
;
select * from Equipment;


-- filling the Site table
delete from Site where siteId='';
INSERT INTO Site(siteId,address)
VALUES 
('SITE000001','Maroochy River at Cotton Tree'),
('SITE000002','Noosa River Mouth at Noosa Heads'),
('SITE000003','Pumicestone Passage at Kings Beach')
;
select * from Site;


-- filling the Instructor table
delete from Instructor where instructorId='INS0000002';
INSERT INTO Instructor(instructorId,staffId,specialization)
VALUES 
('INS0000001','STF0000002','kite-surfing'),
('INS0000002','STF0000001','SUP board Yoga')
;
select * from Instructor;


-- filling the Booking table
delete from Booking where bookingId='SWS0000010';
INSERT INTO Booking(bookingId,customerId,instructorId,serviceId,numberOfService,siteId,equipmentId,startTime)
VALUES 
('SWS0000010','CUST000001',null,'KKH0000001',1,'SITE000001','EQKY000001','2021-05-29 17:00:00'),
('SWS0000012','CUST000002',null,'BSUP000001',1,'SITE000001','EQSB000001','2021-06-19 14:00:00'),
('SWS0000013','CUST000003','INS0000001','SSL0000001',1,'SITE000002','EQKY000001','2021-07-10 14:00:00'),
('SWS0000014','CUST000004','INS0000002','SSL0000002',1,'SITE000003','EQSB000004','2021-07-11 14:00:00'),
('SWS0000015','CUST000005',null,'BSUP000002',1,'SITE000003','EQSB000002','2021-05-12 14:00:00'),
('SWS0000016','CUST000006',null,'BSUP000004',1,'SITE000002','EQSB000003','2021-07-12 14:00:00')
;
select * from Booking;
