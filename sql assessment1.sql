create database ASSIGNMENT;
use ASSIGNMENT;

CREATE TABLE SalesPeople
(
	Snum int,
	Sname varchar(40) unique,
	city varchar (40),
	comm int,
	primary key (Snum),
)
select * from SalesPeople

--insert data
INSERT INTO
SalesPeople (Snum,Sname,city,comm)
values(1001 ,'Peel', 'London',12),
	(1002 ,'serres', 'sanjose',13),
	(1004 ,'motika', 'London',11),
	(1007 ,'Rifkin', 'barcelona',15),
	(1003 ,'axelrod', 'newyork',10)

-- FIRST TABLE IS CREATED

CREATE TABLE Customers
(
	Cnum int,
	Cname varchar(30),
	city varchar(30) NOT NULL,
	Snum int,
	primary key (cnum),
	foreign key (Snum) references salespeople(Snum),
)
select * from Customers

-- INSERTING DATA
 INSERT INTO
Customers(Cnum,Cname,City,Snum)
values(2001,'Hoffman','London',1001),
(2002,'Giovanni','Rome',1003),
(2003,'Liu','Sanjose',1002)
(2004,'Grass','Berlin',1002)
(2006,'Clemens','London',1001)
(2008,'Cisneros','Sanjose',1007)
(2007,'Pereira','Rome',1004)

--SECOND TABLE CREATED

 
CREATE TABLE Orders(
Onum int,
primary key(Onum),
Amt int,
Odate varchar(50) not null,
Cnum int,
foreign key (Cnum)
references Customers(Cnum),
Snum int,
foreign key (Snum)
references SalesPeople(Snum)
)
select * from Orders

--INSERTING DATA
INSERT INTO 
Orders(Onum,Amt,Odate,Cnum,Snum)
values(3001 ,18.69 ,'3-10-1990' ,2008 ,1007),
(3003 ,767.19 ,'3-10-1990' ,2001 ,1001),
(3002 ,1900.10 ,'3-10-1990' ,2007 ,1004),
(3005,  5160.45, '3-10-1990' ,2003 ,1002),
(3006 , 1098.16 ,'3-10-1990' ,2008 ,1007),
(3009 ,1713.23 , '4-10-1990', 2002, 1003),
(3007 , 75.75, '4-10-1990', 2004 ,1002),
(3008 , 4273.00 ,'5-10-1990', 2006 ,1001),
(3010 , 1309.95, '6-10-1990' ,2004 ,1002),
(3011 , 9891.88 ,'6-10-1990', 2006, 1001),

--THIRD TABLE CREATED

--QUERIES
select count(Sname) as count from SalesPeople where Sname like 'a%' or Sname like 'A%';
select * from SalesPeople where Snum in (select Snum  from orders group by Snum having sum(Amt) > 2000);
select count(Sname) as count1 from SalesPeople where City='Newyork';
select count(Sname) as count2  from SalesPeople where City='London' or City='Paris';



	