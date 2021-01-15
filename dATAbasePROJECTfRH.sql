create database FRANKS_RECONSTRUCTION_HOSPITAL;
USE FRANKS_RECONSTRUCTION_HOSPITAL;

CREATE TABLE Laboratory (
lab_id varchar (10) primary key, 
Lab_name varchar (20) ,
Lab_location varchar (50) ,
Test_id varchar (50),
Test_name varchar (50),
PATIENT_ID varchar (50),
FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT (PATIENT_ID));


CREATE TABLE CARE_CENTER (
CARECENTER_ID varchar (50)primary key  ,
CARECENTER_name varchar (50)   ,
CARECENTER_location varchar (50) ,
TREATMENT_ID varchar (9), 
FOREIGN KEY (TREATMENT_ID) REFERENCES TREATMENT (TREATMENT_ID));

CREATE TABLE PATIENT (
PATIENT_ID varchar (50) primary key ,
FNAME VARCHAR (50) ,
LNAME VARCHAR (50) ,
DOB DATE NOT NULL,
TELE_NUMBER varchar (15),
STATUSOFRESIDENCE VARCHAR (50) ,
RETURNVISITS INT (50)  ,
COMMENTSONVISITS VARCHAR (50) ,
DATEOFADMIN DATE ,
PAT_address VARCHAR(200),
ITEM_ID varchar (10),
PHYSICIAN_ID varchar (10),
FOREIGN KEY (PHYSICIAN_ID) REFERENCES PHYSICIAN (PHYSICIAN_ID),
FOREIGN KEY (ITEM_ID) REFERENCES ITEM (ITEM_ID));


CREATE TABLE PHYSICIAN (
PHYSICIAN_ID varchar (10) primary key ,  
LNAME varchar (50) ,
FNAME varchar (50) ,
speciality varchar (50) ,
Tel_num varchar (20),
PHYS_address varchar (200) ,
pager_number varchar (20),
CARECENTER_ID varchar (50),
FOREIGN KEY (CARECENTER_ID) REFERENCES CARECENTER (CARECENTER_ID));  

CREATE TABLE BED (
BED_ID varchar (10) primary key ,
PATIENT_ID varchar (50) ,
ROOM_NUM   INT (50) ,
CARECENTER_ID varchar (50),
FOREIGN KEY (CARECENTER_ID) REFERENCES CARECENTER (CARECENTER_ID),
FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT (PATIENT_ID));

CREATE TABLE ITEM (
ITEM_ID varchar (10) primary key ,  
I_DESCRIPTION varchar (50) ,
I_UNITCOST DECIMAL (5,2),
quantity int (100),
Vendor varchar (100) );

CREATE TABLE DEPARTMENT (
Dept_no varchar (10) primary key,
Qualification varchar (100),
Skill varchar (100),
Job_description varchar (100),
GROUP_ID VARCHAR (10),
EMPLOYEE_ID varchar (9),
FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE (EMPLOYEE_ID));

CREATE TABLE EMPLOYEE_GROUP (
GROUP_ID VARCHAR (10) primary key,
EMP_GROUP VARCHAR (50));


CREATE TABLE EMPLOYEE (
EMPLOYEE_ID varchar (9) primary key,
FNAME VARCHAR (50) ,
LNAME VARCHAR (50) ,
DOB DATE NOT NULL,
JOB VARCHAR (50),
SALARY decimal (7,2),
TELE_NUMBER varchar (50) ,
EMP_ADDRESS VARCHAR (50) ,
DATE_HIRED DATE,
GROUP_ID VARCHAR (50),
Dept_no varchar (10),
lab_id varchar (10),
FOREIGN KEY (Dept_no) REFERENCES DEPARTMENT (Dept_no),
FOREIGN KEY (GROUP_ID) REFERENCES EMPLOYEE_GROUP (GROUP_ID),
FOREIGN KEY (lab_id) REFERENCES Laboratory (lab_id));


CREATE TABLE TREATMENT (
TREATMENT_ID varchar (9) primary key,
TREATMENT_NAME varchar (50),
TREATMENT_DESCRIPTION VARCHAR (50),
PATIENT_ID varchar (50),
PHYSICIAN_ID varchar (50),
FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT (PATIENT_ID),
FOREIGN KEY (PHYSICIAN_ID) REFERENCES PHYSICIAN (PHYSICIAN_ID));

insert into Laboratory values 
(1001, 'Radiology', 'Preventing and Testing Wing','TESTRD', 'Xrays and Radiation Treatment','PAT05');
insert into Laboratory values 
(1002, 'Hematology', 'Preventing and Testing Wing','TESTHT', 'Blood Testing','N/A');
insert into Laboratory values 
(1003, 'Microbiology', 'Preventing and Testing Wing','TESTMB', 
'Testing for Infectious Diseases and Parasites','N/A');
insert into Laboratory values
(1004, 'Maternity', 'Preventing and Testing Wing','TESTMTN', 'Prenatal and Maternity Testing','N/A');
insert into Laboratory values 
(1005, 'Chemistry', 'Preventing and Testing Wing', 'TESTCHEM', 'Drugs and Substances','N/A');

insert into CARE_CENTER values 
('ER001','Emergency Room','East Wing, Level 1','Varies');
insert into CARE_CENTER values 
('PD002','Pediatric Care','East Wing, Level 2','Varies');
insert into CARE_CENTER values 
('CAN003','Cancer Center','West Wing, Level 1','TR001');
insert into CARE_CENTER values 
('NR004','Neurology','East Wing, Level 3','Spinal, Pain and Brain related Treatments');
insert into CARE_CENTER values 
('DR003','Dental Care','West Wing, Level 2','TR002');

insert into PATIENT values
('PAT01','Luck','Andrew','1990/09/24','1-868-245-7467','Yes',0,'ACL tear(surgery)','2015/3/4','#23 Coconut Drive, Williamsville','ITEM001','PHY01');
insert into PATIENT values 
('PAT02','Manning','Manning','1978/03/18','1-868-563-5242','Yes',0,'To Check on spine','2015/2/4','#1 Gopaul Drive, Marabella','N/A','PHY02');
insert into PATIENT values 
('PAT03','Cruz','Victor','1986/11/11','1-868-724-2421','No',0,'Treat Toothache','2014/11/4','#17 Kenneth Drive, Marabella','ITEM001','PHY01');
insert into PATIENT values 
('PAT04','Beckham Jr.','Odell','1986/11/11','1-868-341-4245','No',0,'To treat broken Arm','2015/3/24','#19 High Street , San Fernando','ITEM001','PHY01');
insert into PATIENT values 
('PAT05','Mohan.','James','1993/01/20','1-868-453-2421','No',8,'Treat Cancer','2014/5/10','#125 Gordon Avenue , Gasparillo','N/A','PHY01');

insert into PHYSICIAN values
('PHY01', 'Price', 'Harry', 'Orthopedic Surgeon','1-868-462-4356','#54 Baisil Road, Curepe', '1-868-134-4532','MULTIPLE');
insert into PHYSICIAN values
('PHY02', 'Khan', 'HJ', 'Neurosurgeon','1-868-245-6645','#5 Basil Road, Curepe', '1-868-123-2425','NR004');
insert into PHYSICIAN values
('PHY03', 'Dickerson', 'John', 'Orthodontist Surgeon','1-868-254-5436','#2 Mocorapo Road, San Fernando','1-868-133-2475','DR003');
insert into PHYSICIAN values
('PHY04', 'Hynoski', 'Henry', 'Obstetrics-gynecology','1-868-265-3353','#4 St James Street, Port-of-Spain', '1-868-143-2765','PD002');
insert into PHYSICIAN values
('PHY05', 'Amukamara', 'Prince', 'Pediatrics','1-868-265-3525','#24 St James Street, Port-of-Spain', '1-868-145-3525','PD002');


insert into BED values
('BED01', 'PAT01', 10, 'ER001');
insert into BED values
('BED02', 'PAT02', 13, 'NR004');

insert into ITEM values
('ITEM001', 'Morphine', 40.00,100, 'Chungs Pharmacy and Supplies');
insert into ITEM values
('ITEM002', 'Tracrium', 50.00,100, 'Chungs Pharmacy and Supplies');
insert into ITEM values
('ITEM003', 'Cyclobenzaprine',100, 35.00, 'Chungs Pharmacy and Supplies');
insert into ITEM values
('ITEM004', 'Orabase', 30.00,20, 'Chungs Pharmacy and Supplies');
insert into ITEM values
('ITEM005', 'Anastrozole', 55.00,49, 'Chungs Pharmacy and Supplies');

insert into EMPLOYEE_GROUP values
('NUR001', 'Nurse');
insert into EMPLOYEE_GROUP values
('TECH001', 'Technicians');
insert into EMPLOYEE_GROUP values
('STF001', 'Staff');


insert into DEPARTMENT values
('DEPT001', 'Certificate RN', null, 'provide medical and nursing care to patients in the hospital', 'NUR001');
insert into DEPARTMENT values
('DEPT002', 'Accounting Administrator', null, 'To keep record of Medication and supplies purchased', 'STF001');
insert into DEPARTMENT values
('DEPT003', 'Certificate in Phlebotomy', 'Diagnostic Testing' , 'perform diagnostic tests using specialized equipment', 'TECH001');



insert into EMPLOYEE values
('EMP001', 'Maple', 'Gordon', '1985/02/23', 'Nurse', 1500.00, 868-764-2334, '#21 Hillside Road, Mayaro', '2008/03/12', 'NUR001','DEPT001','N/A');
insert into EMPLOYEE values
('EMP002', 'Ellen', 'Allgeier', '1982/06/16', 'Nurse', 2300.00, 868-634-0921, '#433 Crest Avenue, Victoria', '2006/04/26', 'NUR002','DEPT001','N/A');
insert into EMPLOYEE values
('EMP003', 'Norman', 'Broachr', '1978/03/05', 'Nurse', 2700.00, 868-763-2365, '#54 Roberts Road, Calcutta', '2004/06/02', 'NUR003','DEPT001','N/A');
insert into EMPLOYEE values
('EMP004', 'Simon', 'Pride', '1980/08/25', 'Technician', 5000.00, 868-425-7836, '#78 Adams Street, Thornton', '2009/02/09', 'TECH001','DEPT003',1001);
insert into EMPLOYEE values
('EMP005', 'Simon', 'Pride', '1980/08/25', 'Staff', 4500.00, 868-233-5642, '#78 Adams Street, Thornton', '2009/02/09', 'STF001','DEPT003','N/A');
insert into EMPLOYEE values
('EMP006', 'Gomez', 'Gary', '1984/12/09', 'Staff', 4600.00, 868-743-4534, '#45 Garston Road, Couva', '2005/05/04', 'STF002','DEPT003','N/A');

insert into TREATMENT values 
('TR001','Chemotherapy','Cancer Treatment','PAT05','PHY01');
insert into TREATMENT values 
('TR002','Orthodontic','Tooth ache','PAT03','PHY03');
insert into TREATMENT values 
('TR003','Physiotherapy','rehabilitating ACL injury','PAT01','PHY01');
insert into TREATMENT values 
('TR003','Physiotherapy','rehabilitating elbow injury','PAT04','PHY01');



select *
FROM DEPARTMENT;

SELECT FNAME,LNAME,JOB,SALARY
FROM EMPLOYEE;

SELECT FNAME, LNAME, SALARY
FROM EMPLOYEE 
WHERE SALARY>2850.00;

SELECT FNAME,LNAME,SALARY
FROM EMPLOYEE
WHERE SALARY NOT BETWEEN 1500 and 2850;

select FNAME,LNAME,JOB
FROM EMPLOYEE
where JOB='clerk';


select FNAME, LNAME, Dept_no
from EMPLOYEE, department
where EMPLOYEE_ID='7369';

SELECT FNAME, LNAME, JOB, DATE_HIRED
FROM EMPLOYEE
ORDER BY DATE_HIRED BETWEEN '20-Feb-1981' AND '01-May-1981';

SELECT FNAME, LNAME, Dept_no
FROM EMPLOYEE, DEPARTMENT
WHERE Dept_no = '10' OR Dept_no = '20' ORDER BY LNAME;

SELECT FNAME, LNAME, Dept_no
FROM EMPLOYEE, DEPARTMENT
WHERE SALARY >1500 AND Dept_no = '10' OR Dept_no = '30';

SELECT*
FROM laboratory;

SELECT*
FROM care_center;

SELECT*
FROM patient;

SELECT*
FROM physician;

SELECT*
FROM Employee;

SELECT*
FROM Department;

SELECT*
FROM employee_group;

SELECT*
FROM ITEM;

SELECT*
FROM treatment;

create view PHYSPATIENT as
select  PATIENT_ID
from PATIENT, PHYSICIAN
where PHYSICIAN_ID ='PHY01';

select *
from PHYSPATIENT;

SELECT FNAME, LNAME, PATIENT_ID
FROM PATIENT
ORDER BY LNAME;

select A.EMPLOYEE_ID, A.FNAME, A.LNAME, B.EMP_GROUP, B.GROUP_ID
from  EMPLOYEE A, employee_group B
where A.GROUP_ID = b.GROUP_ID;



