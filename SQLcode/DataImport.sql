-- this script import data in to the SWS database

show full tables;

-- filling the staff table
delete from Staff where staffId='STF0000';
INSERT INTO Staff(staffId,fName,lName,phone,isInstructor)
VALUES 
('STF0000001','Katie','Johnson',8917523,1),
('STF0000002','Dave','Wilson',8116590,1);
select * from staff;


-- filling the customer table
delete from Customer where customerId='STF0000';
INSERT INTO Customer(customerId,fName,lName,phone,dateOfBirth,address)
VALUES 
('CL00000001','ZHI','HE',0450521617,null,'120 mary St, brisbane city, qld 4000'),
('CL00000002','MINGZHOU','YANG',0905100680,19970710,null);
select * from Customer;

