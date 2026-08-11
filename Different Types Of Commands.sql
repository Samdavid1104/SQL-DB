---- 1.Create a database,schema and sample table in sql---


create database Assignmnent_2;
use  Assignmnent_2;
create schema Student_info;
create table Student_info.Class_X (
Student_id int primary key,
Student_name varchar (50),
Gender varchar (15)
);
select * from[Student_info].[Class_X] ;



                                  ----2.Explain DDL vs DML ,Truncate vs Delete----
--DDL- Data Definiion Language It will create and change the data structure but not inside of data .The command include here is CREATE,ALTER,TRUNCATE,DROP,RENAME. 
--DML- Data Manipulation Language It will edit and change inside of the data but not change the structure .The command include here is INSERT,DELETE,UPDATE.     
--Truncate -It will comes under DDL because it will delete the selected entire row  without reading inside of the data.In this command entire data will delete we cannot rollback. 
--Delete-It will comes under DML because it will delete only the details inside of the data.


----3.Create 5 tables of your own , each table should have one primary key and one other constraint so each table should have 2 constraint----

                   ------------1.Table contain PRIMARY KEY & NOT NULL CONSTRAINT------------

create table Students (
Student_ID INT, 
Student_Name varchar(35) NOT NULL,
Gender VARCHAR(10),
Dept_ID Int primary key,
);


Insert into Students (Student_ID,Student_Name,Gender,Dept_ID)
Values
(01,'Ram','Male',001),
(02,'Sam','Male',002),
(03,'Shwetha','Female',003),
(04,'Reshma','Female',004),
(05,'Auguz','Male',005);

Select * from Students;


                     ------------2.Table contain PRIMARY KEY & FOREIGN KEY CONSTRAINT------------

CREATE TABLE DEPARTMENT (
Counseller_ID INT,
Dept_ID INT Primary key,
Dept_Name VARCHAR(50),
Fees Int,

Foreign key (Dept_ID)
References Students(Dept_ID)
);

Insert into DEPARTMENT 
values
(5,001,'Data Engineering',40000),
(6,002,'Data science',50000),
(7,003,'Data Analystics',60000),
(8,004,'Machine Learning',70000),
(9,005,'Software Engineer',50000);

select * from DEPARTMENT


                       ----3.Table contain PRIMARY KEY & UNIQUE CONSTRAINT----


create table EMPLOYEE (
Employee_ID INT PRIMARY KEY,
Employee_Name VARCHAR (50),
Employee_Mailid Varchar(40) UNIQUE
);

Insert into EMPLOYEE(Employee_ID,Employee_Name,Employee_Mailid)
Values
(321,'venu','venugopalvenu@gmail.com'),
(213,'Nithish','Nithishnithish321@gmail.com'),
(456,'Priya','priyasharon1432@gmail.com'),
(654,'Reshma','Reshmakumar2412@gmail.com'),
(789,'Sharon','Sharonmark189@gmail.com');

Select * From EMPLOYEE;


                      ----4.Table contain PRIMARY KEY & DEFAULT CONSTRAINT----

Create table Salary(
Salary_REFNO Int Primary Key,
Employee_Name Varchar(50),
Salary_Amount INT,
Salary_Status VARCHAR(10) DEFAULT 'PENDING'
);


INSERT INTO Salary(Salary_REFNO,Employee_Name,Salary_Amount,Salary_Status)
VALUES
(12345,'venu',40000,'Done'),
(12346,'Nithish',40000,'Done'),
(12347,'Priya',40000,'Done'),
(12348,'Reshma',40000,'Done'),
(12349,'Sharon',40000,'Done');

Select * From Salary;


                         ----5.Table contain PRIMARY KEY & CHECK CONSTRAINT----
create table Placement(
student_id INT Primary key,
Student_Name VARCHAR (50),
Age int check (age >=21),
Package decimal(10,2)check(package>1.5)
);

insert into Placement
values
(01,'Ram',21,10.2),
(02,'Sam',25,6.5),
(03,'Shwetha',21,7),
(04,'Reshma',25,10),
(05,'Auguz',28,10);

Select * from Placement;

                  -----4.Insert data into 5 tables and do a update in 2 table-----
                                       ---Insert Done---

insert into Placement
values
(01,'Ram',21,10.2),
(02,'Sam',25,6.5),
(03,'Shwetha',21,7),
(04,'Reshma',25,10),
(05,'Auguz',28,10);

Update Placement
Set Age = 27
Where student_id=2;

Select * From Placement;

INSERT INTO Salary(Salary_REFNO,Employee_Name,Salary_Amount,Salary_Status)
VALUES
(12345,'venu',40000,'Done'),
(12346,'Nithish',40000,'Done'),
(12347,'Priya',40000,'Done'),
(12348,'Reshma',40000,'Done'),
(12349,'Sharon',40000,'Done');

update salary 
Set Employee_Name ='Naresh'
Where Salary_Status='Pending';

Select * From Salary;


                              -------5.Do a TCL using savepoint on a table-------

Select * From Salary;

Begin Transaction;
update Salary 
Set Employee_Name='Samson'
Where Salary_REFNO=12345;
Select * From Salary;---Done

Save transaction sal_up_1;


Select * From Salary;

update Salary
set Employee_Name='Venu'
Where Salary_REFNO=12345;---Done

Rollback transaction sal_up_1;


--------Perform basic DQL operation on any one of the created table which has data--------
Select * from Students;
Select Student_name from Students;

select * from Students
where Gender='Female';

select * from Students
where student_Id >2;

Select * from Students
order by Student_name ASC;

Select * from Students
order by Student_Id desc;

Select DISTINCT Gender
from Students ;

select Top(2) * from Students;
select Top(2) student_id from Students;

                                           ------THE END------










