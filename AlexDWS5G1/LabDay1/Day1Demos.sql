--T-SQL Command 
/*
 M-Line Comment 
 T-SQL Command Types
       DDL --> Create , Alter , Drop 
	   DML --> Insert , Update , Delete 
	   DQL --> Select 
	   DCL --> Deny
*/
--comment Line
print 10
print 'Hello World in sql'
print 10 + 4  -- + - * % / 
GO
Select 10
Print 10
GO
--To Change Database USE <Database Name>
use Northwind
GO

--Select <* | Column> from <Table>
Select * from Employees
SELECT * FROM Orders

Select 10 + 5

Select 10 + '5'

Select 10 + 'b5'

--Data Type
--Name Hiredate Salary True/false
 --Text  nvarchar
 --Number Int
 --decimal decimal
 --Date Datetime
 --boolean  bit 

 ---HOL Hand On Lab 

 --How to Create Database 
 --Create Database <database Name >
 Create Database MyDatabase
 GO
 USE MyDatabase
 GO
 --Create table <Table Name> (<ColumnName> Column Type  Property)
 Create table Employees (EmployeeId int Primary Key Identity,
                         Name nvarchar(100),
						 Salary Decimal(9,2),
						 HireDate DateTime,
						 Attend bit)
--Drop
drop table Employees

Select * from Employees

Insert into Employees values ('Ahmed ali',25000,'1-1-2025',1)
