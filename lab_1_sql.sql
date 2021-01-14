/*
Narindra Balkissoon
69147

*/


drop table airport CASCADE CONSTRAINTS;
drop table FLT_SCHEDULE CASCADE CONSTRAINTS;
drop table FLT_INSTANCE CASCADE CONSTRAINTS;
drop table airplane CASCADE CONSTRAINTS;
drop table customer CASCADE CONSTRAINTS;
DROP TABLE reservation CASCADE CONSTRAINTS;
drop table location CASCADE CONSTRAINTS;

CREATE TABLE Airport (
    airport_code int not null,
    name varchar2(2550),
     Location_ID int,
    PRIMARY KEY (airport_code)
    
); 
/* FLT_SCHEDULE{ flight#(PK), airline, dtime, from_airportcode, atime, to_airportcode, miles, price}  */

CREATE TABLE FLT_SCHEDULE(
    flight_num int not null,
    airline varchar2(2500),
    dtime varchar2(2500),
    from_airportcode int,
    atime varchar2(2500),
    to_airportcode int,
    miles decimal(15,2),
    price decimal(15,2)
);
ALTER TABLE FLT_SCHEDULE
ADD CONSTRAINT FLT_SCHEDULE_pk
PRIMARY KEY (flight_num);

ALTER TABLE FLT_SCHEDULE
ADD CONSTRAINT FLT_SCHEDULE_from_fk
FOREIGN KEY (from_airportcode) REFERENCES Airport(airport_code) ON DELETE CASCADE; 
ALTER TABLE FLT_SCHEDULE
ADD CONSTRAINT FLT_SCHEDULE_to_fk
FOREIGN KEY (to_airportcode) REFERENCES Airport(airport_code) ON DELETE CASCADE; 
/*FLT_INSTANCE{ flight#,date(PK), plane#, #avail_seats} */

CREATE TABLE FLT_INSTANCE(
    flight_num int not null,
    date_ varchar2(2500) not null,
    plane_num int,
    num_avail_seats int,
    PRIMARY KEY (flight_num, date_)
);

/* AIRPLANE{ plane#(PK), plane_type, total_seats} */

CREATE TABLE AIRPLANE(
    plane_num int not null,
    plane_type varchar2(2500),
    total_seats int,
    PRIMARY KEY(plane_num)
);
ALTER TABLE FLT_INSTANCE
ADD CONSTRAINT FLT_INSTANCE_pn_fk
FOREIGN KEY (plane_num) REFERENCES Airplane(plane_num) ON DELETE CASCADE; 

ALTER TABLE FLT_INSTANCE
ADD CONSTRAINT FLT_INSTANCE_fn_fk
FOREIGN KEY (flight_num) REFERENCES FLT_SCHEDULE(flight_num) ON DELETE CASCADE;
/*CUSTOMER{ cust#(PK), first, middle, last, phone#, street, city, state, zip} */

create table customer(
     customer_num int not null,
    first varchar(2500),
    middle varchar(2500),
    last varchar(2500),
    phone_num varchar2(2500),
    Location_ID int,
    PRIMARY KEY (customer_num)
);

/*RESERVATION{ flight#, date, cust#(PK), seat#, check_in_status, ticket#} */
create table reservation (
      flight_num int not null,
      date_ varchar2(2500) not null,
      customer_num int not null,
      seat_num int,
      check_in_status varchar2(2500),
      ticket_num  int
);
ALTER TABLE reservation
ADD CONSTRAINT reservation_pk
PRIMARY KEY (flight_num, date_,customer_num) ON DELETE CASCADE;
/*
ALTER TABLE reservation
ADD CONSTRAINT reservation_date_fk
FOREIGN KEY (date_) REFERENCES FLT_INSTANCE(date_) ON DELETE CASCADE;
*/
ALTER TABLE reservation
ADD CONSTRAINT reservation_fn_fk
FOREIGN KEY (flight_num) REFERENCES FLT_SCHEDULE(flight_num) ON DELETE CASCADE;

ALTER TABLE reservation
ADD CONSTRAINT reservation_cn_fk
FOREIGN KEY (customer_num) REFERENCES customer(customer_num) ON DELETE CASCADE;

create table location(
   Location_ID int not null,
   street varchar2(2500),
   city varchar2(2500),
   state varchar2(2500),
   zip int,
   PRIMARY KEY (Location_ID)

);

ALTER TABLE airport
ADD CONSTRAINT airport_loc_fk
FOREIGN KEY (location_id) REFERENCES location(location_id) ON DELETE CASCADE; 

ALTER TABLE customer
ADD CONSTRAINT customer_loc_fk
FOREIGN KEY (location_id) REFERENCES location(location_id) ON DELETE CASCADE; 

INSERT INTO airport
VALUES (1001, 'Portland International Airport',5006 ); 
INSERT INTO airport
VALUES (1002, 'John F. Kennedy International Airport', 5005 ); 
INSERT INTO airport
VALUES (1003, 'Salt Lake City International Airport', 5004); 
INSERT INTO airport
VALUES (1004, 'O’Hare International Airport', 5003); 
INSERT INTO airport
VALUES (1005, 'George Bush Intercontinental Airport', 5002); 
INSERT INTO airport
VALUES (1006, 'Hartsfield-Jackson Atlanta International ', 5001);

INSERT INTO FLT_SCHEDULE
VALUES (2001, 'Delta','13:00',1001,'17:00',1002, 50,200); 
INSERT INTO FLT_SCHEDULE
VALUES (2002, 'American Airlines','14:00',1003,'18:00',1001, 70,300); 
INSERT INTO FLT_SCHEDULE
VALUES (2003, 'BWIA','15:00',1004,'19:00',1005, 510,500); 
INSERT INTO FLT_SCHEDULE
VALUES (2004, 'JetBlue','16:00',1006,'20:00',1001, 509,100); 
INSERT INTO FLT_SCHEDULE
VALUES (2005, 'Caribbean Airlines','17:00',1002,'21:00',1004, 501,500); 
INSERT INTO FLT_SCHEDULE
VALUES (2006, 'Alaskan Airlines','18:00',1005,'22:00',1003, 178,100); 


insert into FLT_INSTANCE
VALUES(3001,'28/9/2019',7001,5);
insert into FLT_INSTANCE
VALUES(3002,'28/9/2019',7002,6);
insert into FLT_INSTANCE
VALUES(3003,'28/9/2019',7003,8);
insert into FLT_INSTANCE
VALUES(3004,'28/9/2019',7004,9);
insert into FLT_INSTANCE
VALUES(3005,'28/9/2019',7005,4);
insert into FLT_INSTANCE
VALUES(3006,'28/9/2019',7006,3);


insert into customer
values(4001, 'abc', 'efg', 'hij', '124-5678',5001);
insert into customer
values(4002, 'asd', 'fgh', 'hjk', '124-5679',5002);
insert into customer
values(4003, 'se', 'fgdsf', 'dfdfd', '124-5680',5003);
insert into customer
values(4004, 'ds', 'dfd', 'fdfds', '124-5681',5004);
insert into customer
values(4005, 'fdf', 'fdsfd', 'fsdf', '124-5682',5005);
insert into customer
values(4006, 'fdsd', 'fdf', 'dfdsf', '124-5683',5006);


insert into reservation
values(3001,'28/9/2019',4001,145,'Pending',8003);
insert into reservation
values(3002,'28/9/2019',4002,146,'Pending',8004);
insert into reservation
values(3003,'28/9/2019',4003,148,'Pending',8007);
insert into reservation
values(3004,'28/9/2019',4004,147,'Pending',8009);
insert into reservation
values(3005,'28/9/2019',4005,144,'Pending',8001);
insert into reservation
values(3006,'28/9/2019',4006,165,'Pending',8002);


insert into location
values(5001,'1 Dis Street','Portland','Oregon',10101);
insert into location
values(5002,'2 Wis Street','New York','New York',27185);
insert into location
values(5003,'3 Lis City','Salt Lake City','Utah',48342);
insert into location
values(5004,'4 Gitto Street','Chicago','Illinois',42124);
insert into location
values(5005,'5 Mitto Street','Atlanta','Georgia',24145);
insert into location
values(5006,'7 Hitto Street','Houston','Texas',47643);


insert into airplane
values(7001,'Commercial',200);
insert into airplane
values(7002,'Commercial',206);
insert into airplane
values(7003,'Commercial',260);
insert into airplane
values(7004,'Commercial',250);
insert into airplane
values(7005,'Commercial',270);
insert into airplane
values(7006,'Commercial',200);

DESCRIBE airport;
DESCRIBE flt_schedule;
DESCRIBE flt_instance;
DESCRIBE location;
DESCRIBE reservation;
DESCRIBE airplane;
DESCRIBE customer;

SELECT * from airport;
SELECT * from flt_schedule;
SELECT * from flt_instance;
SELECT * from location;
SELECT * from reservation;
SELECT * from airplane;
SELECT * from customer;