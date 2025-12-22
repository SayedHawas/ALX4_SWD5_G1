-- Day 4
--------------------------------------------------------
--Module 4
--Querying Multiple Tables
---------------------------

/*
Querying Multiple Tables :-
-----------------------------------------

    -- Lessons :- 
	----------------
	 
	        1- Understanding Joins .
			2- Querying with Inner Joins.
			3- Querying with Outer Joins.
			4- Querying with Cross Joins and Self-Joins.

Querying Multiple Tables            Done
 Inner Join    =(Join)              Done
 Outer Join                         Done
   - Left Outer Join                Done
   - Right Outer Join               Done
   - Full Outer Join                Done
Cross Join 
Self - Join 
*/
-- Join 
--inner join 
-- create dataBase DB 
-- create table department 
-- Create table Employees 
------------------------------
--EX Join 
------------------------------------------


--Lab



/*
-- 1) Understanding Joins :-
----------------------------
   - T-SQL joins are used to combine rows from two or more tables.
   A) The FROM Clause and Virtual Tables :- 
   -------------------------------------
    - Virtual table will hold the output of the FROM clause and,
	   will be used subsequently by other phases of the SELECT statement, such as the WHERE clause.
	- The virtual table created by a FROM clause is a logical entity only. In SQL Server 2016, no physical table is created.
	- Table aliases improves the readability of the query, without affecting the performance.
	- It is strongly recommended that you use table aliases in your multi-table queries. 
  B) Join Terminology: Cartesian Product :- 
  ---------------------------------------
   - Cartesian product is the product of two sets. The product of a set of 2 items and a set of 6 items is a set of 12 items.
   - The product of a table with 10 rows and a table with 100 rows is a result set with 1,000 rows.  
   - Cartesian product occurs when two input tables are joined without considering any logical relationships.  
  C) Overview of Join Types :- 
  ------------------------------
   - (CROSS JOIN) adds all possible combinations of the two input tables' rows to the virtual table. Any filtering of the                      rows will happen in a WHERE clause. this operator is to be avoided. 
   -  (INNER JOIN) creates a Cartesian product, then filters the results using the predicate supplied in the ON clause,                         removing any rows from the virtual table that do not satisfy the predicate.
                   inner join is a very common type of join for retrieving rows with attributes that match across tables,
	               such as matching Customers to Orders by a common custid.  
   - (OUTER JOIN) creates a Cartesian product, then filters the results to find rows that match in each table. However,
                  all rows from one table are preserved, added back to the virtual table after the initial filter is applied.                  NULLs are placed on attributes where no matching values are found.

  D) T-SQL Syntax Choices :- 
  ---------------------------
   
           - Through the history of versions of SQL Server, 
		     the product has changed to keep pace with changes in the ANSI standards for the SQL language.
		   - In ANSI SQL-89, no (ON) operator was defined. 

		   - This syntax of ANSI SQL-89 is still supported by SQL Server 2016.
		   - ANSI SQL-89-style joins can easily become Cartesian products and cause performance problems. 
		   - The ANSI SQL-92 standard, support for the ON clause was added.
		   - The logical relationship between the tables is represented with the ON clause.
		   - As performance of query optimizer in SQL Server does not favor one syntax over the other.
*/
--HOL 
USE Northwind
GO
Select * from Employees
Select * from Orders 

--Select Columns
--From <Source> Tables
--ON PK = FK 

--ANSI 89
Select e.FirstName , e.LastName ,o.OrderID, O.OrderDate , o.CustomerID 
From Employees AS E , Orders AS O 
Where e.EmployeeID = O.EmployeeID 

--ANSI 92
Select e.FirstName , e.LastName ,o.OrderID, O.OrderDate , o.CustomerID 
From Employees AS E Inner Join Orders AS O 
ON e.EmployeeID = O.EmployeeID

Select e.FirstName , e.LastName ,o.OrderID, O.OrderDate , o.CustomerID 
From Employees AS E  Join Orders AS O 
ON e.EmployeeID = O.EmployeeID
Where e.FirstName = 'Nancy'



USE Day3DB

Select * from Departments
Select * from Employees

--Select e.Name , e.JobTitle ,E.Salary ,d.Name AS [Department Name]
--From Departments as d , Employees as e
--Where d.departmentId = e.departmentId

Select e.Name , e.JobTitle ,E.Salary ,d.Name AS [Department Name]      --4
From Departments as d INNER JOIN Employees as e                        --1
ON d.departmentId = e.departmentId                                     --2
Where  d.Name = 'IT'                                                   --3


Select e.Name , e.JobTitle ,E.Salary ,d.Name AS [Department Name]      
From Departments as d Left Outer Join Employees as e                        
ON d.departmentId = e.departmentId   

Select e.Name , e.JobTitle ,E.Salary ,d.Name AS [Department Name]      
From Departments as d Left Join Employees as e                        
ON d.departmentId = e.departmentId   

Select e.Name , e.JobTitle ,E.Salary ,d.Name AS [Department Name]      
From Departments as d right Join Employees as e                        
ON d.departmentId = e.departmentId   

Select e.Name , e.JobTitle ,E.Salary ,d.Name AS [Department Name]      
From Departments as d full outer Join Employees as e                        
ON d.departmentId = e.departmentId   



--89  -->92
Select * 
from Departments as d  cross Join  Employees as e 
where d.DepartmentId = e.departmentId


USE Northwind
GO
Select * from Employees

Select e1.* 
FROM Employees as e1  cross Join  Employees as e2 
where e1.EmployeeID <> e2.EmployeeID AND e1.HireDate = e2.HireDate
-----------------------------------
--Self Join 
USE Northwind
GO
Select EmployeeID, firstName , LastName , ReportsTo from Employees

--Mis Join 
Select e.EmployeeID, e.firstName , e.LastName , e.ReportsTo , M.FirstName AS Manager
From Employees as E Join Employees as M
ON e.EmployeeID = M.ReportsTo


Select e.EmployeeID, e.firstName , e.LastName , e.ReportsTo ,ISNULL( M.FirstName,'CEO') AS Manager
From Employees as E left Join Employees as M
ON M.EmployeeID = e.ReportsTo



-----------------------------------------
--Function 
Select getdate() --Function Without Parameters
Select year('1-1-2026')
Select IsNull(region,'No Region')  From Employees

GO
--Scalar Function 
Create Function Fn_GetDate()
returns datetime
as 
begin 
   return Getdate()
End
GO
Select dbo.Fn_GetDate()

GO
Create Function Fn_MNumbers(@number1 int  ,@number2 int )
returns int
as 
	begin 
	     return @number1 * @number2
	end 
GO

Select dbo.Fn_MNumbers(100,33)


Select Quantity , UnitPrice , dbo.Fn_MNumbers(Quantity,UnitPrice) As Total
from [Order Details]


--TVF Table value Function 
---------------------------
GO
alter  function fn_getAllOrders(@employeeId int)
returns table
as

    return select OrderID , OrderDate , CustomerID from Orders where EmployeeID = @employeeId
GO

Select * from Fn_getAllOrders(1)
Select * from Fn_getAllOrders(2)
Select * from Fn_getAllOrders(3)


drop Function fn_getAllOrders
--* Not Inculding DML Insert , Update , Delete 
--Just Select  



/*
-- Module 8) Using Built-In Functions :- 
 -----------------------------------------
   -- Lessons :-
   -------------
          - Writing Queries with Built-In Functions.
		  - Using Conversion Functions.
		  - Using Logical Functions.
		  - Using Functions to Work with NULL.
-----------------------------------------------
-- What is Functions in T-SQL ?
--------------------------------
 - A T-SQL routine that accepts parameters, performs an action, such as a complex calculation,
     and returns the result of that action as a value.
 - Functions hide the steps and the complexity from other code.
 - Function Operate  
                      A)- (Deterministic = return same result)
                      B)- (Non-Deterministic = may return different result each time) 
					  
-- Why We use Functions ? 
--------------------------
   - Functions can Use & Run almost anywhere .
   - To replace a stored procedure . 
   
   -- Functions Types :-
-------------------------
 1)- User-defined Functions :-       "Developing Course"

                             A) Scalar        :- Return a single value.
							 B) Table-Valued  :- Return a table.

 
 2)- Built-in Function :-   
                             A) Scalar    :- Working on a single row To return a single Value.             " Module Focus "
							 B) Aggregate :- Take one or more input To return a single summarizing value.  " Next Module "
							 C) Window    :- Working on sets of rows.                                      " In This Course"
							 D) Rowset    :- Return a virtual table can be used in a T-SQL statement.      "Admin Course"
*/
----------------------------------------------------------------------------------------------------------------------------------
-- Simple Examples For The Types of Built-in Functions That we will use :-
-- 1) Scalar Simple Example 
SELECT orderid,orderdate,YEAR(orderdate) AS orderyear   -- Scalar
FROM   Orders

-- 2) Aggregate Simple Example 
SELECT COUNT(Quantity) AS RowsCount, AVG(Quantity) AS QuantityAverage
FROM  [Order Details]


Select count(*) from Employees

Select Max(Unitprice) , Min(Unitprice) , AVG(Unitprice) from Products
-- 3) Window Simple Example 
SELECT TOP(10) productid, productname,unitprice,
	   RANK() OVER(ORDER BY unitprice DESC) AS 'Rank By Price' 
FROM   Products 
ORDER BY 'Rank By Price' 



Select OrderId,ProductID , Quantity ,UnitPrice ,
RANK() Over(partition by ProductId   Order By Quantity) from [Order Details]
-------------------------------------------------------------------------------------------------------------------------------------
/*
-- Using Conversion Functions :-
--------------------------------
  - Implicit conversion occurs automatically :- Follows data type precedence rules.
  - Use explicit conversion :-
                                A) When implicit would fail or is not permitted.
                                B) To override data type precedence.
 - Conversion Functions :- 
                           A) CAST    :-  To convert a value from one data type to another . " ANSI-Standard "
						   B) CONVERT :-  To convert a value from one data type to another . " SQL SERVER ONLY "
						   C) PARSE  :-  Converts strings to date, time, number types.     " SQL SERVER ONLY "  
						   D) TRY_PARS & TRY_CONVERT :-  like PARSE and CONVERT, But when failed conversions return NULL. 
*/

Select 1 +5

Select 'total ' + cast( 5 as nvarchar(5))

Select 'Date :' + Cast(Getdate() as nvarchar(50))

-- 1) CAST Syntax 
----------------
-- CAST(<Expression> AS DataType)
---------------------------------
-- CAST Example 1)   -- from DateTime to date
SELECT orderid,orderdate AS OrderDateTime,
	   CAST(orderdate AS DATE) AS OrderDateOnly  
FROM   Orders 

-- CAST Example 2)    -- from Int to String
SELECT CAST(1 AS Varchar(1))    AS RESULT 

-- CAST Example 2)    -- from String to Decimal
SELECT CAST('20.33' AS decimal(4,2))    AS RESULT 

---------------------------------------------------
-- 2) Convert Syntax 
------------------
-- 1) Normal             CONVERT(DataType , <Expression> ), "Optional Format")
-- 2) With Format        CONVERT(DataType , <Expression> , "Optional Format Number")
--------------------------------------------------------


Select 'total ' + convert(nvarchar(5), 5 )

Select 'Date :' +Convert( nvarchar(50) , Getdate() )
-- CONVERT Example 1)   -- from DateTime to date
SELECT orderid,orderdate AS OrderDateTime,CONVERT(DATE , orderdate , 110) AS OrderDateOnly  
FROM Orders 

-- CONVERT Example 2)    -- from Int to String
SELECT CONVERT(Varchar(1) , 1)  AS RESULT 

-- CONVERT Example 2)    -- from String to Decimal
SELECT CONVERT(Decimal(4,2) , '20.33' )   AS RESULT 
------------------------------------------------------------
-- 3) Parse Syntax 
-----------------
-- 1) Normal          PARS (<String> AS DataType)
-- 2) With Culture    PARS (<String> AS DataType USING 'Culture Name') 
-----------------------------------------------------
-- Parse Example Normal
SELECT PARSE('02/12/2012' AS datetime2) AS Result

-- Parse Example Using Culture
SELECT PARSE('02/12/2012' AS datetime2 USING 'ar-EG') AS Result
-------------------------------------------------------------------------
/*
-- Why Try_Parse & Try_Convert ? 
---------------------------------
   - Some Conversion Never works 
   - If the data types are incompatible, 
   - such as attempting to convert a date to a numeric value,
   - (CAST,CONVERT,Parse)  will return an error.
   - So Try_Parse & Try_Convert Will Act Like (CONVERT,Parse) ,
   - AND When Conversion Failed Return NULL instead of Error.
   - Try_Parse Syntax = Parse Syntax
   - Try_Convert Syntax = Convert Syntax
*/
-- Conversion Failed with error like :-
-- CAST Error
SELECT CAST ( '12/12/2012' AS INT )

-- CONVERT Error
SELECT CONVERT ( INT , '12/12/2012' )
-- Parse Error
SELECT Parse ( '12/12/2012' AS INT )
-- USING Try_Parse    -- No Error
SELECT Try_Parse ( '12/12/2012' AS INT ) AS Result

SELECT Try_Parse ( '100' AS INT ) AS Result

-- USING Try_Convert  -- No Error
SELECT Try_Convert ( INT , '12/12/2012' ) AS Result

Select ISNUMERIC(100) --1
SELECT ISNUMERIC ('12/12/2012') --0

Select Isdate('2-2-2025') --1
SELECT Isdate ('2-30-2025') --0
-----------------------------------------------------------------------------------------
/* 
  -- Logical Functions :- 
  -------------------------
    - Logical functions that evaluate an expression and return a scalar result.
	- Logical functions :- 
	                      A) ISNUMERIC() :- 
						               - Tests whether an input expression is a valid numeric data type.
						               - Returns a 1 when the input evaluates to any valid numeric type.
									   - Returns 0 otherwise
  
						  B) IIF()  :- 
						               - IIF returns one of two values, depending on a logical test.
									   - Like two-outcome CASE expression.
									   - You may nest a IIF function within another IIF, a maximum level 10.
									   - IIF give error if values NULL.

						  C) CHOOSE() :-
						               - returns an item from a list as specified by an index value.
									   - if the index value not a value in the list, will return a NULL.
*/

-- ISNUMERIC Syntax :-
-- ISNUMERIC ( <Expression> )
------------------------------
-- ISNUMERIC() Example 1)
SELECT ISNUMERIC('SQL') AS Result  -- 'SQL' Not numeric so result = 0
-- ISNUMERIC() Example 2)
SELECT ISNUMERIC('12') AS Result  -- '12' INT so result = 1
-- ISNUMERIC() Example 3)
SELECT ISNUMERIC('100.50') AS Result  -- '100.50' Decimal so result = 1

-- Logical Tests functions 
SELECT ISNUMERIC('SQL') AS isnmumeric_result;
select Isdate(getdate())  --return 1 because its a date
select Isdate('kkk')   -- return 0   because its not a date
select isnumeric ('dfd')  --returns 0 casue its not numeric value
select isnumeric (5)  --returns 1 casue its numeric value

-------------------------------------------------------------------------
-- IIF() Syntax
-- IIF (<Boolean_Expression> , 'Value if true' , 'value if false or unknown')
----------------------------------------------------------------------------
--IIF() Example 1)  -- Like Case Statement
SELECT productid,unitprice, IIF(unitprice > 50,'high','low') AS pricepoint
FROM   Products

--IIF() Example 2) 
SELECT IIF(1 > 10, 'TRUE', 'FALSE' ) AS Result

--IIF() Example 3)  -- Error because NULL Values
SELECT IIF ( 45 > 30, NULL, NULL ) AS Result

-- IIF() Example 4)  -- Nested IIF
SELECT IIF ( 45 = 30, 'True', IIF(1>2,'Yes','No') ) AS Result
------------------------------------------------------------------------
-- CHOOSE() Syntax
-- CHOOSE (<Index_number>,Value_list)
--------------------------------------
-- CHOOSE() Example 1)  -- Simple Example
SELECT CHOOSE(1,'Spring','Summer','Autumn','Winter') AS Result
-- CHOOSE() Example 2)  -- Null because index number not in values list
SELECT CHOOSE(5,'Spring','Summer','Autumn','Winter') AS Result
-- CHOOSE() Example 3)  -- error if index Char.
SELECT CHOOSE('One','Spring','Summer','Autumn','Winter') AS Result
-- CHOOSE() Example 4)  --  string implicitly converted to INT
SELECT CHOOSE('2','Spring','Summer','Autumn','Winter') AS Result 
-- CHOOSE() Example 5)  -- If index value is numeric, it will be implicitly converted to INT.
SELECT CHOOSE(3.1,'Spring','Summer','Autumn','Winter') AS Result
------------------------------------------------------------------------------------------------------
/*
  --  Functions to Work with NULL :-
  ------------------------------------
      A)- ISNULL()   :-
	               - ISNULL replaces NULL with a specified value.
				   - ISNULL Not ANSI standard.


	  B)- COALESCE() :-
	               - COALESCE is ANSI standard.
				   - returns the first non-NULL value in a list.
				   - If all arguments are NULL, COALESCE returns NULL.

	  C)- NULLIF()  :-
	              - NULLIF is ANSI standard.
	              - NULLIF compares two expressions.
				  - Returns NULL if both are equal.
				  - Returns the first expressions if both not equal.
*/

-- ISNULL() Syntax
-- ISNULL(<expression_to_check> , 'replacement_value')
---------------------------------------------------
-- ISNULL() Example 1)
SELECT EmployeeID,city,Region,ISNULL(region, 'N/A') AS New_Region,country 
FROM Employees 
GO
-- ISNULL() Example 2)  -- ISNULL inside another function
SELECT AVG(ISNULL(quantity, 50)) AS Average
FROM [Order Details]
GO
--------------------------------------------------
-- COALESCE() Syntax
-- COALESCE(<expression_to_check> , 'replacement_value')
-------------------------------------------------------
-- COALESCE() Example 1)  -- Working Like ISNULL()
SELECT country,region,city, country + ',' + COALESCE(region, ' ') + ', ' + city as location
FROM   Employees

-- COALESCE() Example 2)   -- Get First not null value
CREATE TABLE COAL( ID INT, FirstName varchar(20),MiddleName varchar(20), LastName Varchar(20))
 
INSERT INTO COAL VALUES (1,'Ahmed',NULL,'Ali'),
                        (1,NULL,'Mohamed',NULL),
		                (1,NULL,NULL,'Walid')
GO
SELECT * FROM COAL
GO
SELECT ID,COALESCE(FirstName,MiddleName,LastName) AS Name
FROM COAL
GO
-------------------------------------------------------------------------
-- NULLIF() Syntax
-- NULLIF ( <expression1> , <expression2> )
-------------------------------------------
-- NULLIF() Example 1)
SELECT NULLIF(1,1) AS RESULT

-- NULLIF() Example 2)
SELECT NULLIF(1,2) AS RESULT

-- NULLIF() Example 3)
SELECT NULLIF(2,1) AS RESULT

---------------------------------------------------
--Date Format (Lab HOL)
--------------
create database Module8
go
use Module8
Select Format(GetDate(),'dddd dd MMMM yyyy hh:mm:ss')
go
Create table Employees(ID int primary key identity, Name nvarchar(50),DOB Date ,attendTime Time);
insert into Employees values('Ahmed',getdate(),getdate());
select * from Employees
select * ,FORMAT(DOB,'dd/MM/yyyy') as [Date] ,Format(attendTime,'hh:mm:ss') as [Time] from Employees -- 
select * ,FORMAT(DOB,'dd/MM/yyyy') as [Date] ,left(attendTime,5) as [Time] from Employees
select format (getdate(),'hh:mm:ss');
select 'this is My DOB '+ convert(varchar(25),format(getdate(),'dddd-MMMM-dd-yyyy')) ;

USE Northwind
GO
Select Format(Hiredate,'dddd dd MMMM yyyy hh:mm:ss') from employees
-----------------------------------------------------------------------------------------------
--format(value,format,culture)
DECLARE @date DATETIME = GETDATE()
SELECT @date AS 'GETDATE()',
       FORMAT( @date, 'd', 'en-US') AS 'DATE IN US Culture',
       FORMAT( @date, 'd', 'en-IN') AS 'DATE IN INDIAN Culture',
       FORMAT( @date, 'd', 'de-DE') AS 'DATE IN GERMAN Culture',
	   FORMAT( @date, 'd', 'ar-EG') AS 'DATE IN GERMAN Culture'

DECLARE @Price INT = 40
SELECT FORMAT(@Price,'c','en-US') AS 'CURRENCY IN US Culture', 
       FORMAT(@Price,'c','de-DE') AS 'CURRENCY IN GERMAN Culture',
       FORMAT( @Price, 'c', 'ar-EG') AS 'DATE IN Egypt Culture'

DECLARE @Price DECIMAL(5,3) = 40.356
SELECT FORMAT( @Price, 'C') AS 'Default',
       FORMAT( @Price, 'C0') AS 'With 0 Decimal',
       FORMAT( @Price, 'C1') AS 'With 1 Decimal',
       FORMAT( @Price, 'C2') AS 'With 2 Decimal',
       FORMAT( @Price, 'C3') AS 'With 3 Decimal'

DECLARE @Percentage float = 0.35674
SELECT FORMAT( @Percentage, 'P') AS '% Default',
       FORMAT( @Percentage, 'P0') AS '% With 0 Decimal',
       FORMAT( @Percentage, 'P1') AS '% with 1 Decimal',
       FORMAT( @Percentage, 'P2') AS '% with 2 Decimal',
       FORMAT( @Percentage, 'P3') AS '% with 3 Decimal'

----------------------------------------------------------------------------------
--String Function
-- Use string functions in a query
SELECT SUBSTRING('Microsoft SQL Server',11,3) AS Result;
SELECT LEFT('Microsoft SQL Server',9)  AS Result;
SELECT RIGHT('Microsoft SQL Server',6);
SELECT LEN('Microsoft SQL Server     ') AS [LEN];
SELECT DATALENGTH('Microsoft SQL Server     ');
SELECT CHARINDEX('SQL','Microsoft SQL Server');
SELECT REPLACE('Microsoft SQL Server 2008','2008','2012');
SELECT UPPER('Microsoft SQL Server');
SELECT LOWER('Microsoft SQL Server');
select firstname , reverse(firstname) as rever from Employees

--Demo On Nested function 
declare @x varchar(200) = '   mIcroSoft sQL SerVER 2016    '
select Concat(Upper( substring(ltrim(@x),1,1)) ,lower(substring (ltrim(@x),2,len(@x))))
--------------------------------------------------------------------------------------------
--Date & Time Functions
select GETDATE()
select GETUTCDATE()
select CURRENT_TIMESTAMP
select SYSDATETIME()
select SYSUTCDATETIME()
select SYSDATETIMEOFFSET()
select DATEPART(day,'1/29/2014')
select DATEPART(MONTH,'1/29/2014')
select DATEPART(YEAR,'1/29/2014')
select DATEFROMPARTS ( 2014, 1, 29 )
select TIMEFROMPARTS(13,26,44,0,0) -- 5 argu


DECLARE @date DATETIME = '12/1/2011';
SELECT EOMONTH ( @date ) AS Result;
GO
DECLARE @date DATETIME = GETDATE();
SELECT EOMONTH ( @date ) AS 'This Month';
SELECT EOMONTH ( @date, 1 ) AS 'Next Month';
SELECT EOMONTH ( @date, -1 ) AS 'Last Month';
GO
SELECT DAY('20120212') AS [Day], MONTH('20120212') AS [Month],YEAR('20120212') AS [Year];


-- Use ISDATE to check validity of inputs:
SELECT ISDATE('20120212'); --is valid
SELECT ISDATE('20120230'); --February doesn't have 30 day
------------------------------ new 
select datepart (q,'1/1/2015') --quarter in Year 
select DATEPART(q,getdate());
select datepart(DW,'8/1/2015') --Day in Week
select Datepart(dw,getdate());
Select datepart(DY,'8/1/2015') --Day in year 
select datepart(dy,getdate()); 
select datepart(WW,getdate());  --Week in Year
-----------------------------------------
-- Using Built-In Functions
-- Scalar Functions
---------------------------------
SELECT ABS(-1.0), ABS(0.0), ABS(1.0);
--Metadata Function
SELECT DB_NAME() AS current_database;
--global variable
select @@VERSION as Edition 

---------------------------------------------------------------------------------
--Nest Join 
USE Northwind
GO
Select * from Orders 
Select * From [Order Details]
Select * from Products


Select Top(5) o.OrderDate,e.FirstName, c.CompanyName, OD.OrderID , P.ProductName , OD.UnitPrice , Od.Quantity,
OD.UnitPrice * Od.Quantity As Total
From Products as p Join [Order Details] as Od
ON p.ProductID = od.ProductID Join Orders as O
ON O.OrderID = Od.OrderID Join Employees as E
ON e.EmployeeID = O.EmployeeID Join Customers as C
ON c.CustomerID = o.CustomerID 
where e.FirstName = 'Steven'
Order by UnitPrice desc


Select * from Employees




