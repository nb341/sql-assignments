Create database ICCC;
Use ICCC;
CREATE TABLE STUDENT (
STUDENT_ID varchar (9),
SURNAME varchar (15) ,
FIRSTNAME varchar (15) NOT NULL,
BIRTHDATE date,
GENDER varchar (1),
PROGRAM varchar (25));

CREATE TABLE COURSE (
COURSE_CODE varchar (9) primary key,
COURSE_TITLE varchar (50),
HOURS integer (3),
CREDITS integer (3),
PREREQUISITE1 varchar (9),
PREREQUISITE2 varchar (9));

CREATE TABLE COURSE_REGISTRATION (
STUDENT_ID varchar (9) ,
COURSE_CODE varchar (9),
SECTION varchar (3),
SEMESTER varchar (3),
YEAR varchar (4),
GRADE integer (3));

CREATE TABLE CLASS_SECTION (
COURSE_CODE varchar (9),
SECTION varchar (3),
SEMESTER varchar (3),
YEAR varchar (4),
INSTRUCTOR_ID varchar (9),
CAPACITY integer (3) check (capacity <=100 and capacity >=0),
ENROLLMENT integer (3),
Primary key(course_code,section,semester,year));

CREATE TABLE FACULTY (
EMPLOYEE_ID varchar (9) primary key,
SURNAME varchar (15),
FIRSTNAME varchar (15),
BIRTHDATE date,
SENIORITY_DATE date,
SALARY decimal (8,2),
UNIT_NO integer (3)) ;

CREATE TABLE EXPERTISE (
EMPLOYEE_ID varchar (9),
COURSE_CODE varchar (9),
EXPERTISE_LEVEL integer (3) check (EXPERTISE_LEVEL between 0 and 10 ));

CREATE TABLE ORGANIZATIONAL_UNIT (
UNIT_TYPE varchar (15),
UNIT_NAME varchar (25),
UNIT_NO integer (3) primary key,
UNIT_SUPERVISOR varchar (9),
SUPERIOR_UNIT integer (3));

insert into STUDENT values (1, 'Adler', 'Philip','1960-02-23', 'M','Computer Technology');

insert into STUDENT values (2, 'Jenkins', 'Dorothy','1972-08-16', 'F', 'Power Engineering');

insert into STUDENT values (3, 'Caine', 'John','1975-03-31', 'M','Computer Technology');

insert into STUDENT values (4, 'Lorieaux', 'Marie','1976-05-01', 'F','Petroleum Engineering');

insert into COURSE values ('ACCT210', 'Introductory Accounting', 64, 4, null,null); 
insert into COURSE values ('ACCT240', 'Intermediate Accounting', 80, 5, 'ACCT210',null);
insert into COURSE values ('MATH215', 'Calculus I', 80, 5, null,null);
insert into COURSE values ('MATH235', 'Calculus II', 80, 5, 'MATH215',null);
insert into COURSE values ('CMPP201', 'Introductory Programming', 160, 8, null,null);
insert into COURSE values ('COMP202', 'Computer Fundamentals', 80, 5, null,null);
insert into COURSE values ('CMPP230', 'Introduction to Fourth Generation Languages', 80, 5,
'CMPP201',null);
insert into COURSE values ('CSYS325', 'Object Oriented Analysis', 64, 5, 'CMPP230',null);
insert into COURSE values ('CSYS300', 'Information Systems I', 128, 8, 'CMPP230',null);
insert into COURSE values ('CSYS350', 'Information Systems II', 176, 10, 'CSYS300',null);
insert into COURSE values ('CSYS302', 'Technical Systems I', 128, 8, 'CMPP230',null);
insert into COURSE values ('CSYS352', 'Technical Systems II', 176, 10, 'CSYS302',null);
insert into COURSE values ('ENGL201', 'English Literature', 80, 5, null,null);
insert into COURSE values ('ENGL240', 'English Composition', 80, 5, 'ENGL201',null);
insert into COURSE values ('PHYS211', 'Heat and Thermodynamics', 64, 5, 'MATH235',null);
commit;

insert into COURSE_REGISTRATION values (
'000612345', 'CMPP230', '1FC', '1', '1994', 82);
insert into COURSE_REGISTRATION values (
'000811111', 'CMPP230', '1FC', '1', '1994', 66);
insert into COURSE_REGISTRATION values (
'002502060', 'CMPP230', '1FC', '1', '1994', 66);
insert into COURSE_REGISTRATION values (
'000600189', 'PHYS211', '1FB', '2', '1993', 80);
insert into COURSE_REGISTRATION values (
'000600189', 'MATH235', '1FC', '2', '1994', 0);
insert into COURSE_REGISTRATION values (
'000612345', 'CSYS325', '2FB', '2', '1994', 0);
insert into COURSE_REGISTRATION values (
'000509082', 'PHYS211', '1FB', '2', '1993', 58);
insert into COURSE_REGISTRATION values (
'000811111', 'ACCT210', '1FC', '1', '1994', 93);
insert into COURSE_REGISTRATION values (
'000509082', 'MATH215', '1FB', '1', '1993', 49);
insert into COURSE_REGISTRATION values (
'000509082', 'MATH215', '1FB', '1', '1994', 45);
insert into COURSE_REGISTRATION values (
'001500026', 'ACCT210', '1FB', '1', '1994', 65);
insert into COURSE_REGISTRATION values (
'001500026', 'CMPP201', '1FC', '1', '1994', 66);
insert into COURSE_REGISTRATION values (
'001500026', 'CMPP230', '1FC', '1', '1994', 78);
insert into COURSE_REGISTRATION values (
'002502060', 'ENGL201', '1WA', '1', '1994', 41);
insert into COURSE_REGISTRATION values (
'002502060', 'ACCT210', '1FC', '1', '1994', 66);
insert into COURSE_REGISTRATION values (
'000427358', 'CMPP230', '1FC', '1', '1994', 69);
insert into COURSE_REGISTRATION values ('000600352', 'MATH235', '1FC', '2', '1994', 0);
insert into COURSE_REGISTRATION values (
'000600352', 'ENGL201', '1WA', '1', '1994', 87);
insert into COURSE_REGISTRATION values (
'000600352', 'PHYS211', '1FB', '2', '1993', 89);
insert into COURSE_REGISTRATION values (
'000612345', 'MATH215', '1FB', '1', '1994', 68);
insert into COURSE_REGISTRATION values (
'000612345', 'PHYS211', '1FB', '2', '1993', 71);
insert into COURSE_REGISTRATION values (
'000811111', 'CMPP201', '1FC', '1', '1994', 78);
insert into COURSE_REGISTRATION values (
'000427358', 'CMPP201', '1FC', '1', '1994', 63);
insert into COURSE_REGISTRATION values (
'000427358', 'MATH215', '1FB', '1', '1993', 82);
insert into COURSE_REGISTRATION values (
'000427358', 'MATH235', '1FA', 2, '1993', 71);
insert into COURSE_REGISTRATION values (
'000427358', 'PHYS211', '1FB', '2', '1993', 65);
insert into COURSE_REGISTRATION values (
'000427358', 'COMP202', '1FA', '2', '1993', 92);
insert into COURSE_REGISTRATION values (
'002502060', 'MATH235', '1FC', '2', '1994',42);
insert into COURSE_REGISTRATION values (
'000612345', 'MATH235', '1FA', '2', '1993', 40);
insert into COURSE_REGISTRATION values (
'000612345', 'MATH235', '1FC', '2', '1994', 35);
insert into COURSE_REGISTRATION values (
'000612345', 'MATH235', '1FA', '1', '1994', 40);
insert into COURSE_REGISTRATION values (
'001500026', 'PHYS211', '1FB', '2', '1993', 48);
insert into COURSE_REGISTRATION values (
'001500026', 'MATH215', '1FB', '1', '1993', 32);
insert into COURSE_REGISTRATION values (
'001500026', 'MATH215', '1FB', '1', '1994', 38);
insert into COURSE_REGISTRATION values (
'000811111', 'MATH235', '1FA', '2', '1993', 41);
insert into COURSE_REGISTRATION values (
'000811111', 'MATH235', '1FA', '2', '1994', 45);
commit;

insert into CLASS_SECTION values (
'ACCT210', '1FB', '1', '1994', '000030002', 35, 0);
insert into CLASS_SECTION values (
'ACCT210', '1FC', '1', '1994', '002300123', 35, 0);
insert into CLASS_SECTION values (
'ACCT210', '1WA', '2', '1994', '000030002', 40, 0);
insert into CLASS_SECTION values (
'ACCT210', '1WB', '2', '1994', '000030002', 35, 0);
insert into CLASS_SECTION values (
'MATH215', '1FB', '1', '1994', '002300137', 30, 0);
insert into CLASS_SECTION values (
'MATH215', '1FC', '1', '1994', '000018012', 25, 0);
insert into CLASS_SECTION values (
'MATH215', '1FB', '1', '1993', '002300137', 28, 0);
insert into CLASS_SECTION values (
'MATH215', '1WA', '2', '1994', '000296257', 35, 0);
insert into CLASS_SECTION values (
'MATH215', '1WB', '2', '1994', '000018012', 30, 0);
insert into CLASS_SECTION values (
'MATH235', '1FC', '2', '1994', '000296257', 35, 0);
insert into CLASS_SECTION values (
'CMPP230', '1FC', '1', '1994', '000130006', 40, 0);
insert into CLASS_SECTION values (
'CMPP230', '1FB', '1', '1994', '000130006', 40, 0);
insert into CLASS_SECTION values (
'CSYS325', '2FB', '2', '1994', '000012345', 10, 0);
insert into CLASS_SECTION values (
'CMPP201', '1FC', '1', '1994', '000012346', 40, 0);
insert into CLASS_SECTION values (
'PHYS211', '1FB', '2', '1993', '000000001', 20, 0);
insert into CLASS_SECTION values (
'ENGL201', '1WA', '1', '1994', '000220159', 30, 0);
insert into CLASS_SECTION values (
'MATH235', '1FA', '2', '1993', '000018012', 20, 0);
insert into CLASS_SECTION values (
'CMPP201', '1FA', '2', '1993', '000012346', 35, 0);
insert into CLASS_SECTION values (
'COMP202', '1FA', '2', '1993', '000000006', 35, 0);
insert into CLASS_SECTION values (
'MATH235', '1FA', '2', '1994', '002300137', 30, 0);
insert into CLASS_SECTION values (
'MATH235', '1FA', '1', '1994', '002300137', 30, 0);
commit;

insert into FACULTY values (001, 'Curie', 'Marie','1950-07-12', '1978-09-01', 49000, 100);

insert into FACULTY values (002, 'Sienko','Michael','1945-05-10','1976-07-03',49500, 100);

insert into FACULTY values (003, 'Plane', 'Robert','1939-09-08','1967-09-20', 50000, 130);

insert into EXPERTISE values ('000030002', 'ACCT210', 9);
insert into EXPERTISE values ('002300123', 'ACCT210', 7);
insert into EXPERTISE values ('000018012', 'MATH215', 8);
insert into EXPERTISE values ('000018012', 'MATH235', 8);
insert into EXPERTISE values ('000018012', 'PHYS211', 7);
insert into EXPERTISE values ('000018012', 'ENGL201', 6);
insert into EXPERTISE values ('002300137', 'MATH235', 7);
insert into EXPERTISE values ('002300137', 'MATH215', 7);
insert into EXPERTISE values ('000296257', 'MATH215', 7);
insert into EXPERTISE values ('000296257', 'MATH235', 8);
insert into EXPERTISE values ('000296257', 'PHYS211', 7);
insert into EXPERTISE values ('000130006', 'CMPP230', 7);
insert into EXPERTISE values ('000012345', 'CSYS325', 8);
insert into EXPERTISE values ('000012346', 'CMPP201', 8);
insert into EXPERTISE values ('000030002', 'ENGL201', 5);
insert into EXPERTISE values ('000000001', 'PHYS211', 10);
insert into EXPERTISE values ('000000011', 'ACCT240', 3);
insert into EXPERTISE values ('000000011', 'ACCT210', 2);
insert into EXPERTISE values ('000000006', 'COMP202', 10);
insert into EXPERTISE values ('000130006', 'CSYS325', 7);
insert into EXPERTISE values ('000130006', 'CSYS300', 8);
insert into EXPERTISE values ('000130006', 'CSYS350', 7);
insert into EXPERTISE values ('000130006', 'CSYS302', 8);
insert into EXPERTISE values ('000000005', 'CSYS300', 3);
commit;

insert into ORGANIZATIONAL_UNIT values ('Faculty','Faculty of Science', 100, '000012357', null);
insert into ORGANIZATIONAL_UNIT values ('Department', 'Mathematics', 110, '002300137', 100);
insert into ORGANIZATIONAL_UNIT values ('Department', 'Physics', 120, '000000001', 100);
insert into ORGANIZATIONAL_UNIT values ('Department', 'Chemistry', 130, '000000002', 100);
insert into ORGANIZATIONAL_UNIT values ('Department', 'Computing Science', 140, '000012345',
100);
insert into ORGANIZATIONAL_UNIT values ('Section', 'Finite Mathematics', 111, '000018012',
110);
insert into ORGANIZATIONAL_UNIT values ('Section', 'Calculus', 112, '000296257', 110);
insert into ORGANIZATIONAL_UNIT values ('Section', 'Statistics', 113, '000000004', 110);
insert into ORGANIZATIONAL_UNIT values ('Section', 'Programming', 141, '000130006', 140);
insert into ORGANIZATIONAL_UNIT values ('Section', 'Systems', 142, '000000005', 140);
insert into ORGANIZATIONAL_UNIT values ('Section', 'Fundamentals and Literacy', 143,
'000000006', 140);
insert into ORGANIZATIONAL_UNIT values ('Faculty', 'Faculty of Arts', 200, '000000010', null);
insert into ORGANIZATIONAL_UNIT values ('Department', 'English', 210, '000220159', 200);
insert into ORGANIZATIONAL_UNIT values ('Faculty', 'Faculty of Business', 300, '000000011',
null);
insert into ORGANIZATIONAL_UNIT values ('Department', 'Accounting', 310, '002300123', 300);
commit;

Select *
from expertise;
select course_code,
course_title
from course
where credits = 5;

select course_code,
course_title
from course
where credits = 5
order by course_title;

select EMPLOYEE_ID, SURNAME, SALARY
from faculty
order by SALARY DESC;

select EMPLOYEE_ID, SURNAME, FIRSTNAME
from faculty
where FIRSTNAME like ('M%');

select EMPLOYEE_ID, SURNAME, FIRSTNAME
from faculty
where FIRSTNAME like null;

select EMPLOYEE_ID, SURNAME, FIRSTNAME
from faculty
where unit_no is not null;

select EMPLOYEE_ID, SURNAME, FIRSTNAME, SALARY
from faculty
where SALARY between 49000 and 50000;

select EMPLOYEE_ID, SURNAME, FIRSTNAME, SALARY
from faculty
where SALARY not between 49000 and 50000;

select EMPLOYEE_ID, SURNAME, FIRSTNAME, SALARY
from faculty
where SALARY in(47000,48000,50000);

select STUDENT_ID, SURNAME, FIRSTNAME
from  student
where BIRTHDATE>='1974-01-01'
and gender = 'f';

select STUDENT_ID, SURNAME, FIRSTNAME
from  student
where PROGRAM like ('Technology%') or ('engineering');

select EMPLOYEE_ID, SURNAME, FIRSTNAME, SALARY
from faculty
where SURNAME ='Sienko'
and firstname = 'Michael';

select EMPLOYEE_ID, SURNAME, FIRSTNAME, SALARY
from faculty
where SALARY>49500;

select Student_id 
from course_registration
where grade > 
(select grade 
from course_registration
where course_code = 'ACCT210' AND student_id = '002502060');

select BIRTHDATE
from faculty
where birthdate = 
                 (select BIRTHDATE
                  from faculty
                  where firstname = 'Clifford' and surname = 'James');   

select firstname, surname
from faculty
where unit_no = 
(select unit_no
from faculty
where firstname =
'Plane' AND surname = 'Robert');

select avg(birthdate/12)
        as average_birthdat
from faculty
where unit_no is not null;  

select count(*)
from faculty
where unit_no is not null;

select a.student_id, firstname, surname, AVG(grade)
from student a, course_registration b
where a.student_id = b.student_id
AND year = '1993'
Group by a.student_id, firstname, surname
Having count(*) >=2;

select student_id , semester, year, AVG(grade)
from course_registration
where year = '1993' 
and '1994';

select avg(grade) as average_grade
from course_registration
where course_code = 'CMPP230';

select max(grade)
As highest_mark
from course_registration;

Select a.course_code , COURSE_TITLE
from course a , course_registration b 
where a.COURSE_CODE = b.COURSE_CODE
AND grade > 
(select MAX(grade)
from course_registration);

select unit_name , count(*)
from faculty a , organizational_unit b
where a.unit_no = b.unit_no
group by unit_name;










