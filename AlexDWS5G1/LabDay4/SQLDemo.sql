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


----------------------------------------------------------------------------------
--Module 6
--Working with SQL Server 2016 Data Types
--============================================
/*
          -- Lessons :-
		  --------------
		               1- Introducing SQL Server 2016 Data Types.
					   2- Working with Character Data.
					   3- Working with Date and Time Data.
--Working with SQL Server Data Types
--==================================================================================
									--Data type 
									--T-SQL Variables Overview :
									--system supplied Data Types
-----------------------------------------------------------------------------------------
--1-Character DataTypes:
/*
Non-Unicode character char[(n)]                     1-8000                          n bytes, padded
					  varchar[(n)]                  1-8000                          n+2 bytes
					  varchar(max)                  1-2^31-1 characters             Actual length + 2
					  text							0ñ2(GB)  Deprecated
----------------------------------------------------------------------------
Unicode character     nchar[(n)]                    1ñ4,000 characters             2*n bytes, padded
					  nvarchar[(n)]					1ñ4,000 characters             (2*n) +2 bytes
					  nvarchar(max)					1-2^31-1 characters             Actual length + 2
					  ntext							0-2(GB)  Deprecated
----------------------------------------------------------------------------
*/
--2-Exact Numeric Data Types
/*
													
					  tinyint						0 to 255			           1
					  smallint                      -32,768 to 32,767              2
                      int							-2^31 (-2,147,483,648) to      4
                                                     2^31-1 (2,147,483,647)              
					  bigint                        -2^63 to 2^63-1                8
					                                (+/- 9 quintillion)
					  bit                           1/0 or true/false              1
                     -----------------------------------------------------------------------------
                     decimal/numeric               - 10^38 +1 through 10^38 ñ 1    7-15
					                                when maximum precision is used
      
					 money                          -922,337,203,685,477.5808       8
					                                to 922,337,203,685,477.5807
                     smallmoney                     - 214,748.3648 to 214,748.3647  4
*/
---------------------------------------------------------------------------------------------------
--Note that while decimal is ISO standards-compliant, decimal and numeric
--are equivalent to one another. Numeric is kept for compatibility with earlier versions of SQL Server

-- decimal [ (p[ ,s] )] and numeric[ (p[ ,s] )] 
--p (precision)  : The maximum total number of decimal digits that can be stored
--s (scale)  : The maximum number of decimal digits that can be stored to the right of the decimal point
/*
Precision           Storage bytes
1 - 9               5
10-19               9
20-28               13
29-38               17
*/
----------------------------------------------------------------------------------------------------
--ex:
--Decimal(5)
--Decimal(100)
--Decimal(5,2)
--Money & small money are monetary DataTypes
----------------------------------------------------------------------------------------------------
--3-Approximate Numeric Types
/*
Approximate numeric  float[(n)]                                                     8
					 real                                                           4
----------------------------------------------------------------------------------------------------
-- float [ (n) ]
--it must be a value between 1 and 53. The default value of n is 53.


 n value             Precision          Storage size
 1-24               7 digits           4 bytes
 25-53              15 digits          8 bytes

Note: SQL Server treats n as one of two possible values. If 1<=n<=24, n is treated as 24. If 25<=n<=53, n is treated as 53.
*/
----------------------------------------------------------------------------------------------------
--real is equivalent to float(24)
--4-Date and Time Data Types
/*
Data type category    SQL Server system supplied      Number of bytes           Range                         Formate                     
					  data types
---------------------------------------------------------------------------------------------------------------------------------------------
Date and time        datetime						   8                        from January 1, 1753          YYYY-MM-DD hh:mm:ss[.nnn]
														                        to December 31, 9999
					
					datetime2                          6-8                      0001-01-01                    YYYY-MM-DD hh:mm:ss[.nnnnnnn]
					                                                            00:00:00.0000000 
					                                                            through 9999-12-31 
					                                                            23:59:59.9999999
									 
					
					 smalldatetime					   4                        from January 1, 1900          YYYY-MM-DD hh:mm:ss
														                        to June 6, 2079 
														 

					 Time							   3-5	                    00:00:00.0000000              hh:mm:ss[.nnnnnnn]
					                                                            through 23:59:59.9999999
	                      
                     date                              3                        0001-01-01 through 9999-12-31 YYYY-MM-DD
                     
                     datetimeoffset                    8-10                     0001-01-01 00:00:00.0000000   YYYY-MM-DD hh:mm:ss[.nnnnnnn] 
                                                                                through 9999-12-31            [+|-]hh:mm    
                                                                                23:59:59.9999999 (in UTC)
*/
--------------------------------------------------------------------------------------------------
--5-Binary Data Types
--Binary String Data Types
/*   
Data type category    SQL Server system supplied   Range                       Number of bytes
					  data types
------------------------------------------------------------------------------------------------------
Binary Strings		  binary[(n)]                   1-8000                         n bytes
				      varbinary[(n)]				1-8000                         n bytes + 2
					  varbinary(max)				1-2.1 billion (approx) bytes   actual length + 2
-------------------------------------------------------------------------------------------------------
Image				  image                         0ñ2(GB)                        
-------------------------------------------------------------------------------------------------------
--6-Other Data Types
Data type category    SQL Server system supplied   Range                       Number of bytes
					  data types
---------------------------------------------------------------------------------------------------------
                     uniqueidentifier               Auto-generated     				    16
 					 xml							0ñ2(GB)                             0-2 GB 
           			 SQl_variant					0-8000 bytes                        Depends on content
					 rowversion                     Auto-generated                      8					
                     table                          N/A                                 N/A
-----------------------------------------------------------------------------------------------------------	
*/
 -- Lesson 1) Introducing SQL Server 2016 Data Types :-
 -------------------------------------------------------
      -- SQL Server Data Types :-	
	  ---------------------------
	   - Data types specify the type, length, precision, and scale of data. 
	   - SQL Server associates columns, expressions, variables, and parameters with data types.
	   - Data types determine what kind of data can be held:-
                                       Integers, characters, dates, money, binary strings, etc.
	   - SQL Server supplies :- 
	   1) Built-in data types.  
	   2) User defined custom data types.

	   - SQL Server Data types Categories :-  -- Please See Images 
	   -------------------------------------

	                                   - Exact Numeric.
									   - Approximate Numeric.
									   - Data & Time.
									   - Character Strings.
									   - Unicode Characters.
									   - Binary Strings.
									   - Others
---------------------------------------------------------------------------------------------------
		 Numeric Data Types :-
		--------------------------
           1) Exact Numeric:-
		   -------------------
			  - Integers :-    TinyInt , SmallInt , Int , BigInt .

			  - Decimal Or Numeric :-  Decimal Is ANSI Standard ,
			                           Numeric is kept for compatibility with earlier versions of SQL Server.

			  - Money & SmallMoney :- Money(8byte) Smallmoney(4byte) are also exact and map to Decimal and have 4 decimal points.

			  - Bit :-  1 , 0 OR NULL . 
		  2) Approximate Numeric :-
		   -------------------------
			  - Float :-  Like DECIMAL but only 6 right point of the decimal ,
			              Will Approximate values .
			         FLOAT(24) :- range 1 to 24 = 4bytes
			         FLOAT(53) :- range 25 to 53 = 8bytes

			  - Real :-  ISO synonym for float(24) = 4bytes
*/
--Examples For Numeric Data Types :-
---------------------------------------
--TinyInt -- (0) TO (255) 1byte
DECLARE @TinyInt TINYINT = 300   --erro if try 300
SELECT @TinyInt 
GO
--SmallInt -- (-32,768) TO (+32,768) 2bytes
DECLARE @SMALLINT SMALLINT = -32769   -- error if try 33000
SELECT @SMALLINT
GO
--Int  -- (-2,147,483,648) TO (+2,147,483,647) 4bytes
DECLARE @INT INT = 200000000000000  -- error if try 3000000000
SELECT @INT
GO
--BigInt  -- (-9,223,372,036,854,775,808) TO (+9,223,372,036,854,775,807) 8bytes
DECLARE @BIGINT BIGINT = 9000000000000000  --error if try 10000000000000000000
SELECT @BIGINT
GO

-- SmallMoney -- (-213,748.3648) TO (+213,748.3647) 4bytes
DECLARE @SMALLMONEY SMALLMONEY = 200123.3212     --error if try 300,2000.2134
SELECT @SMALLMONEY 
GO
-- Money -- (-922,337,203,685,477.5808) TO (-922,337,203,685,477.5807) 8bytes
DECLARE @MONEY MONEY = 900400300200100.1234    --error if try 950400300200100.1234
SELECT @MONEY 
GO
--Bit -- (0) Or (1) Or (NULL) 1byte
DECLARE @BIT BIT = NULL     --if try any other number will show 1
SELECT @BIT 
GO
/*
 DECIMAL (P,S) & NUMERIC (P,S) 
--P (Precision) :- The maximum total number of decimal digits that can be stored(38).
--S (Scale) :- The maximum number of decimal digits that can be stored to the right of the decimal point.
--Both have (18, 0) as default (precision,scale) parameters in SQL server.
Storage :-
-----------
Precision           Storage bytes
1 - 9               5
10-19               9
20-28               13
29-38               17
*/

--Example DECIMAL 1)
DECLARE @DECIMAL DECIMAL(4,2) = 42.12  --error if try 321.21
SELECT @DECIMAL
GO
--Example DECIMAL 2)
DECLARE @DECIMAL DECIMAL(6,1) = 23.231  --error if try 1234221.22
SELECT @DECIMAL
GO
--Example DECIMAL 3)
DECLARE @DECIMAL DECIMAL = 23.231  -- no (0) so default will be (18.0)
SELECT @DECIMAL
GO
--Example DECIMAL 4)
DECLARE @DECIMAL DECIMAL(30,10) = 3123123.123123  --error if try more than 30 digits.
SELECT @DECIMAL
GO
-- DECIMAL = NUMERIC 
-- Example NUMERIC 
DECLARE @NUMERIC NUMERIC(5,4) = 2.121133 --error if try 22.22
SELECT @NUMERIC
GO
-- Example FLOAT 
DECLARE @FLOAT FLOAT(24) = 2.1211367
SELECT @FLOAT
GO
-- Example REAL 
DECLARE @REAL REAL = 2.1211367 -- REAL not using (n) because it always (24) 
SELECT @REAL
GO
/*
-- 3) Binary String Data Types :-
---------------------------------
         - Binary string data types allow a developer to store binary information,
		   Such as serialized files, images, bytestreams, and other specialized data.

              - BINARY(n)       :- Fixed-width   = n bytes
              - VARBINARY(n)    :- Varying-width = n bytes + 2bytes
			  - VARBINARY(MAX)  :- MAX-Width 1-2.1 billion bytes = Actual length + 2bytes
*/
-- Example Binary
DECLARE @BINARY BINARY(4) = 123
SELECT @BINARY
GO
-- Example VarBinary
DECLARE @VARBINARY VARBINARY(5) = 12321
SELECT @VARBINARY
GO
-- Example VarBinary(max)
DECLARE @VARBINARY VARBINARY(MAX) = 12312111
SELECT @VARBINARY
GO
/*
-- 4) Other Data Types :-  -- Rarely Used
---------------------------
   - In addition to numeric and binary types, SQL Server also supplies some other data types,
     allowing you to store and process XML, generate globally unique identifiers (GUIDs),
	 represent hierarchies, and more. Some of these have limited use, others are more generally useful.

         - Rowversion       :-  Binary value, auto-incrementing when a row in a table is inserted or updated.

		 - Uniqueidentifier :-  Provides a mechanism for an automatically generated value that is unique across multiple systems.
		                        It is stored as a 16 byte value. by using the NEWID() system function.

		 - XML              :-  Allows the storage and manipulation of eXtensible Markup Language data. 
		                        This data type stores up to 2 GB of data per instance of the type. 
							    
		 - Cursors          :-  listed here for completeness. A SQL Server cursor is not a data type for storing data,
		                        But rather for use in variables or stored procedures .

		 - Hierarchyid      :-  Used to store hierarchical position data, such as levels of an organizational chart or bill of materials.
		                        SQL Server stores hierarchy data as binary data and exposes it through builtin functions. 
 
		 - SQL_variant      :-  Column data type that can store other common data types.
		                        Its use is not a best practice for typical data storage and may indicate design problems. 

		 - Table            :-  You will learn more about table types later in this course. 
		                        Note that table types cannot be used as a data type for a column (such as to store nested tables). 

*/

--XML
Declare @x xml =
 '<authors>
    <au_id>409-56-7008</au_id>
    <au_lname>Bennet</au_lname>
    <au_fname>Abraham</au_fname>
  </authors>
'
Select @x

-- Example RowVersion 
CREATE TABLE ExampleTable1 (PKey int PRIMARY KEY, VersionCol rowversion) 
GO
INSERT ExampleTable1(PKey)VALUES(1),(2)
SELECT * FROM  ExampleTable1;
GO

-- Example Uniqueidentifier
DECLARE @GUID Uniqueidentifier = NEWID()   -- Run this again , result will change random
SELECT @GUID
GO

-- Example SQL_Variant      -- Accept all types of data , no recommended
DECLARE @SQL_V1 SQL_Variant = 0 ,
        @SQL_V2 SQL_Variant = '4/4/2000' ,
		@SQL_V3 SQL_Variant = $123.112 ,
		@SQL_V4 SQL_Variant = 32

SELECT @SQL_V1 AS BIT ,
       @SQL_V2 AS DATE,
	   @SQL_V3 AS MONEY,
	   @SQL_V4 AS INT
GO 
/*
  -- Data Type Precedence :- 
  --------------------------
      - Which data type will be chosen when expressions of different types are combined.
      - Data type with the lower precedence will implicitly converted to the data type with the higher precedence.
      - Conversion to  lower precedence must be made explicitly Using (CAST OR CONVERT functions)
      - 1. XML 2. Datetime2 3. Date 4. Time 5. Decimal 6. Int 7. Tinyint 8. Nvarchar 9. Char 
*/
-- Example 
DECLARE @TINYINT  TINYINT = 100
DECLARE @SMALLINT  SMALLINT = 1000
SELECT  @TINYINT + @SMALLINT
DECLARE @RESULT sql_variant = @TINYINT + @SMALLINT
SELECT  @RESULT
SELECT	sql_variant_property(@RESULT, 'BaseType')  -- To Show The Result data type will be SMALLINT
GO
/*
-- Convert Data Type To another :- 
------------------------------------
    - Data type conversion scenarios :- 
                 A) When data is moved, compared, or combined with other data.
                 B) During variable assignment.
                 C) When using any operator that involves two operands of different types.
                 D) When T-SQL code explicitly converts one type to another, using a CAST or CONVERT function.
	- Conversion Types :-
	             A) Implicit conversion :- When comparing data of one type to another, Transparent to user.
				 B) Explicit conversion :- Uses CAST or CONVERT functions
    - Not all conversions allowed by SQL Server.
*/
-- Example for Implicit Conversion Working 
DECLARE @myTinyInt TINYINT = 25,
        @myInt INT = 1000
SELECT @myTinyInt + @myInt
GO
-- Example for Implicit Conversion Failed 
DECLARE @char CHAR(3) = 'One',
        @int INT = 1 
SELECT @char + @int
GO
-- Example for Explicit Conversion Using CAST 
-- Syntax :- CAST('OldDataType' AS 'NewDataType') 
DECLARE @char CHAR(3) = 'One',
        @int INT = 1 
SELECT @char + CAST(@int AS CHAR(1))
GO
-- Example for Explicit Conversion Using CONVERT
-- Syntax :- CONVERT ('NewDataType','OldDataType')
DECLARE @char CHAR(3) = 'One',
        @int INT = 1 
SELECT @char + CONVERT(CHAR(1),@int)
GO
-- Another Examples 
SELECT CONVERT(CHAR(4),1000) + 'k' AS 'Explicit Conversion'
GO
SELECT CAST(1000 AS CHAR(4)) + 'k' AS 'Explicit Conversion'
GO
--Conversion to type of lower precedence must be made explicitly (with CAST function)
--Example (low to high):
--CHAR -> VARCHAR -> NVARCHAR -> TINYINT -> INT -> DECIMAL -> TIME -> DATE -> DATETIME2 -> XML
-----------------------------------------------------------------------------------------------------------------------------------
/*
 -- Lesson 2) Working with Character Data :-
 --------------------------------------------
 
     -- Character Data Types :-
	 ---------------------------
	               - Store 1 byte per character.
				   - 265 Possible character Only - Limits language support
				   - Inserting data with single quotes, such as 'SQL'
				   
				   Types :- 
                           Char(n)      :-  1-8000 character . Take (n) as fixed storage.
						   Varchar(n)   :-  1-8000 character.  Take the actual character as storage.
						   Varchar(max) :-  2GB per instance.
						   Text         :-  Use Varchar(Max) instead of Text .
*/
-- Example Char(n)
DECLARE @Char CHAR(6) = 'Ahmed'  -- error if try 'AhmedAliMohamed'
SELECT @Char

-- Example Varchar(n)
DECLARE @VARChar VarChar(6) = 'Ahmed'  -- error if try 'AhmedAliMohamed'
SELECT @VARChar

-- Example Varchar(max)
DECLARE @VARCharMAX VARCHAR(Max) = 'One initial choice is character types based on a simple ASCII set versus Unicode'  
SELECT @VARCharMAX
/*
     -- Unicode Character Data Types :-
	 -----------------------------------
	               - Store 2 byte per character.
				   - 65000 Possible characters including special characters from many languages.
				   - Inserting data using this type have an N prefix (for National), such as N'SQL'. 
				   
				   Types :- 
                           NChar(n)      :-  1-8000 character . Take (n) as fixed storage.
						   NVarchar(n)   :-  1-8000 character.  Take the actual character as storage.
						   NVarchar(max) :-  2GB per instance.
						   NText         :-  Use NVarchar(Max) instead of NText 
*/
-- Example Nchar(n)
DECLARE @NCHAR NCHAR(10) = N'?hmed'
SELECT @NCHAR
-- Example NVARCHAR(n)
DECLARE @NVARCHAR NVARCHAR(10) = N'?hmed'
SELECT @NVARCHAR
-- Example NVARCHAR(max)
DECLARE @NVARCHARMAX NVARCHAR(MAX) = N'?hmed Íaaaaaa'
SELECT @NVARCHARMAX
GO
/* 
   -- String Concatenation :-
   ---------------------------
          - Using + (Plus) Or CONCAT() Function.
		  - When using + Concatenating a value with a NULL returns a NULL. 
		  - CONCATE() Converts NULL to empty string before concatenation.
*/
-- Example Concate Nulls using + (Plus) :-
USE Northwind
SELECT EmployeeID,City,Region,
       Country,( City + ', ' + region + ', ' + country ) AS Location
FROM Employees
GO
-- Example Concate Nulls using CONCATE() :-
USE Northwind
SELECT EmployeeID,City,Region,
	   Country,CONCAT( City , ', ' , region , ', ' , country ) AS Location
FROM Employees
GO
/*
       -- Character String Functions :-
	   --------------------------------
	   - In addition to retrieving character data as-is from SQL Server,
	      you may also need to extract portions of text or determine the location of characters within a larger string. 
		  SQL Server provides a number of builtin functions to accomplish these tasks. Some of these functions include:-
*/
-- FORMAT() :- new to SQL Server 2012 - allows you to format an input value to a character string  
USE Northwind
SELECT TOP (3) orderid,
       OrderDate,
       FORMAT(orderdate,'d','en-us') AS US,
	   FORMAT(orderdate,'d','de-DE') AS DE 
FROM Orders
GO
----------------------------------------------------------------------
--Collation
-------------
/*
- In addition to size and character set, SQL Server character data types are assigned a collation.
- This assignment may be at one of several levels: the server instance,
   the database (default), or a collation assigned to a column in a table or in an expression.
- Collations are collections of properties that govern several aspects of character data:-
    ï Supported languages 
	ï Sort order 
	ï Case sensitivity 
	ï Accent sensitivity  

- Note A default collation is established during the installation of SQL Server but can be overridden on a per-database or per-column basis.
-  As you will see, you may also override the current collation for some character data by explicitly setting a different collation in your query.
*/


-- All SQL SERVER Collations
--Query MetaData
SELECT * FROM   fn_helpcollations()
GO

-- COLLATE Option to Force collation.
USE Northwind
SELECT EmployeeID,FirstName,lastname  
FROM   Employees 
WHERE FirstName = 'nancy'


SELECT EmployeeID,FirstName,lastname
FROM   Employees 
WHERE FirstName COLLATE Latin1_General_CS_AS = N'nancy'



SELECT EmployeeID,FirstName,lastname
FROM   Employees 
WHERE FirstName COLLATE Latin1_General_CS_AS = N'Nancy'
GO

-- Example For Collation Case InSensitive (CI) & Case Sensitive CS
USE tempdb
CREATE TABLE Table1
(
    CI VARCHAR(15) COLLATE Latin1_General_CI_AS,
    CS VARCHAR(14) COLLATE Latin1_General_CS_AS
) 
GO
INSERT Table1
VALUES ('Ahmed','Ali'),
       ('ahmed','ali'),
       ('mohamed','mohamed'),
       ('Mohamed','Mohamed');
GO

-- Retrieve Data
SELECT *FROM Table1
GO

-- Order By CI
SELECT * FROM Table1
ORDER BY CI
GO
-- Order By CS
SELECT * FROM Table1
ORDER BY CS
GO


-- Example of Width Sensitive (WS) and Width Insensitive (WI)
USE TempDB
GO
CREATE TABLE Table2
(IDWI NVARCHAR(100) COLLATE Latin1_General_CI_AI,
 IDWS NVARCHAR(100) COLLATE Latin1_General_CI_AI_WS)
GO
INSERT INTO Table2
VALUES ('E=mc≤ Albert Einstein',
        'E=mc≤ Albert Einstein')
GO
SELECT * FROM Table2
WHERE IDWI LIKE 'E=mc2%'
GO
SELECT *
FROM Table2
WHERE IDWS LIKE 'E=mc2%'


SELECT *
FROM Table2
WHERE IDWS LIKE 'E=mc≤%'


SELECT lastname
FROM employees
WHERE firstname = '√Õ„œ';

SELECT lastname
FROM employees
WHERE firstname  COLLATE Latin1_General_CS_AS = N'√Õ„œ';

SELECT lastname
FROM employees
WHERE firstname = N'√Õ„œ';


GO
--===================================================================================
--Character String Functions
---------------------------
-- SUBSTRING() :- for returning part of a character string given a starting point and a number of characters to return
SELECT SUBSTRING('Microsoft SQL Server',11,3) AS Result
-- LEFT() :- for returning the leftmost or rightmost characters, respectively, up to a provided point in a string 
SELECT LEFT('Microsoft SQL Server',9) AS Result
-- RIGHT() :- for returning the leftmost or rightmost characters, respectively, up to a provided point in a string
SELECT RIGHT('Microsoft SQL Server',10) AS Result
-- LEN() and DATALENGTH()  :-
-- Providing metadata about the number of characters or number of bytes stored in a string. Given a string padded with spaces
SELECT LEN('Microsoft SQL Server     ')   AS [LEN],
       DATALENGTH('Microsoft SQL Server     ')  AS [DATALEN]
-- CHARINDEX() :- for returning a number representing the position of a string within another string
SELECT CHARINDEX('SQL','Microsoft SQL Server') AS Result
-- REPLACE() for substituting one set of characters with another set within a string
SELECT REPLACE('Microsoft SQL Server Denali','Denali','2012') AS Result
--  UPPER() and LOWER() :- for performing case conversions 
SELECT UPPER('Microsoft SQL Server') AS 'Upper',
       LOWER('Microsoft SQL Server') AS 'Lower' 
GO
-----------------------------------------------------------------------------------------------------------------------------------
/*
The LIKE predicate can be used to check a character string for a match with a pattern
Patterns are expressed with symbols:-

    % (Percent) represents a string of any length
    _ (Underscore) represents a single character
   [<List of characters>] represents a single character within the supplied list
   [<Character> - <character>] represents a single character within the specified range
   [^<Character list or range>] represents a single character not in the specified list or range
   ESCAPE Character allows you to search for characters that would otherwise be treated as part of a pattern  - %, _, [, and ])
*/
-----------------------------------------------------------------------------------------------------------------------------------
/*
 -- Lesson 3) Working with Date and Time Data :-
 -----------------------------------------------
    -- Date and Time Data Types :-
	-------------------------------
	   - Older versions of SQL Server supported only DATETIME and SMALLDATETIME.
	   - DATE, TIME, DATETIME2, and DATETIMEOFFSET introduced in SQL Server 2008.
*/
-- DATETIME :- 'YYYYMMDD hh:mm:ss.nnn' 
DECLARE @DATETIME DATETIME ='20120212 12:30:15.123' 
SELECT @DATETIME

-- SMALLDATETIME 'YYYYMMDD hh:mm'  
DECLARE @SMALLDATETIME SMALLDATETIME ='20120212 12:30' 
SELECT @SMALLDATETIME

-- DATETIME2 'YYYY-MM-DD' 
DECLARE @DATETIME2 DATETIME2 ='2012-02-12'
SELECT @DATETIME2

-- DATE 'YYYYMMDD' 'YYYY-MM-DD' 
DECLARE @DATE DATE ='20120212' 
SELECT @DATE

-- TIME 'hh:mm:ss.nnnnnnn' 
DECLARE @TIME TIME ='12:30:15.1234567' 
SELECT @TIME

-- DATETIMEOFFSET 'YYYYMMDD hh:mm:ss.nnnnnnn [+|-]hh:mm'  
DECLARE @DATETIMEOFFSET DATETIMEOFFSET = '20120212 12:30:15.1234567 +02:00'  
SELECT @DATETIMEOFFSET


-- Datetime Column :
-- ------------------
 SELECT 
     Convert(time(7),'2007-05-08 12:35:29. 1234567' )  AS '( Time ) new in 2008' 
    ,Convert(date,'2007-05-08 12:35:29. 1234567'    )  AS '( Date ) new in 2008' 
    ,Convert(smalldatetime,'2007-05-08 12:35:29.123')  AS 'Smalldatetime' 
    ,Convert(datetime,'2007-05-08 12:35:29.123'     )  AS 'Datetime' 
    ,Convert(datetime2(7),'2007-05-08 12:35:29. 1234567 +12:15') AS 
        '( Datetime2 ) new in 2008'
    ,Convert(datetimeoffset(7),'2007-05-08 12:35:29.1234567 +12:15' ) AS 
        '( Datetimeoffset ) new in 2008'

 --======================================================================================================================
declare @id uniqueidentifier
set @id = NEWID()
select @id
--=====================
--Conversion 
 ------------

 --Step 2: Use implicit conversion in a query
--Demonstrate implicit conversion from the lower type (varchar)
-- to the higher (int)
SELECT 1 + '2' AS result;

--Step 3: Use implicit conversion in a query
--Demonstrate implicit conversion from the lower type (varchar) 
-- to the higher (int)
--NOTE: THIS WILL FAIL

SELECT 1 + 'abc' AS result;

--Step 4: Use explicit conversion in a query

SELECT CAST(1 AS VARCHAR(10)) + 'abc' AS result;

SELECT CAST('09/15/2000' AS datetime2) AS [Using CAST Function]
SELECT CONVERT(datetime2, '09/15/2000') AS [Using CONVERT Function]

--------------------------------------------------
--Conversion
--Implicit
DECLARE @myTinyInt  TINYINT = 25;
DECLARE @myInt  INT = 9999;
SELECT @myTinyInt + @myInt;

--check this?
DECLARE @somechar CHAR(5) = '6';
DECLARE @someint INT = 1
SELECT @somechar + @someint;

--what about this??
DECLARE @somechar CHAR(3) = 'six';
DECLARE @someint INT = 1
SELECT @somechar + @someint;

--Explicit
DECLARE @somechar CHAR(3) = 'six';
DECLARE @someint INT = 1
SELECT @somechar + cast( @someint as char(1)) ;

declare @date date = getdate();
select @somechar + cast ( @date AS nvarchar);
----------------------------------------------------------------------

 /*
-- Module 9) Grouping and Aggregating Data :-
---------------------------------------------
   -- Lessons :-
      ----------         1)- Aggregation Functions. 
	                     2)- Group By Clause.
						 3)- Having Clause.
----------------------------------------------------------------------------------------------------------------------
-- Lesson 1) Aggregation Functions :-
--------------------------------------
		       - Take one or more input To return a single summarizing value.
			   - Examples :- AVG(), MAX(), MIN(), SUM(), COUNT().
		       - Can be used in ( SELECT, HAVING, and ORDER BY ) clauses .
			   - Frequently  used with GROUP BY clause. 
*/
-- AVG :- Averages all non-NULL numeric values in a column.
-- AVG(<Expression>)

SELECT AVG(Quantity) AS Quantity_Average
FROM   [Order Details]
GO

-- SUM :- Totals all the non-NULL numeric values in a column.
-- SUM(<Expression>)
SELECT SUM(Quantity) AS Quantity_Total_Sum
FROM   [Order Details]
GO	   

-- COUNT(<Expression>) 
-- COUNT(*)  "Include NULLS"
SELECT COUNT(*) AS Count_All_Rows_With_NULL,
       COUNT(region) AS Count_Region_No_NULL
FROM   Customers
GO

-- MIN :-Returns the smallest number.
-- MIN(<Expression>)
SELECT MIN(Quantity) AS Quantity_Minimum
FROM   [Order Details]
GO

-- MAX :- Returns the largest number.
-- MAX(<Expression>)
SELECT MAX(Quantity) AS Quantity_Maximum
FROM   [Order Details]
GO	   

-- Note :-
-- MAX() & MIN() Works with Date & String
SELECT MIN(CustomerID) AS First_Customer_A_Z,
       MAX(CustomerID) AS Last_Customer_Z_A,
	   MIN(YEAR(OrderDate)) AS earliest_Date,
	   MAX(YEAR(OrderDate)) AS Latest_Date
FROM   Orders
GO
/*			   
			   - Use DISTINCT with aggregate functions to summarize only unique values.
			   - DISTINCT aggregates eliminate duplicate values, not rows (unlike SELECT DISTINCT).
*/

SELECT COUNT(ProductID) AS ProductID_Rows,
       COUNT(DISTINCT ProductID) AS Unique_ProductID_Rows
FROM   [Order Details]

/*
			   - Ignore NULLs except in COUNT(*).
			   - NULL may produce incorrect results
			   - Use ISNULL or COALESCE to replace NULLs before aggregating.
*/
-- Create table for example
CREATE TABLE Temp1
(
  ID INT, Score INT
)
-- Insert Data
INSERT Temp1
VALUES (1,20),(2,40),(3,60),(4,NULL)
GO
-- Show table
SELECT *
FROM Temp1

-- See Null not count
SELECT Min(Score) AS Score_Min
FROM   Temp1

-- Using isnull or coalesce To make it count
SELECT Min(ISNULL(Score,0)) AS Score_Min
FROM   Temp1
GO
----------------------------------------------------------------------------------------------------------------------
/*
-- Lesson 2) Group By Clause :-
--------------------------------------
       - GROUP BY creates groups for output rows, according to unique combination of values specified in the GROUP BY clause.
	   - GROUP BY calculates a summary value for aggregate functions in subsequent phases.
	   - All columns in SELECT, HAVING, and ORDER BY must appear in GROUP BY clause or be inputs to aggregate expressions.
	   - Aggregate functions are commonly used in SELECT clause, summarize per group.
	   - Aggregate functions may refer to any columns, not just those in GROUP BY clause.
*/
-- GROUP BY Example 1)
-- Show every Employee with how many rows he have.
SELECT EmployeeID, COUNT(*) AS Rows_For_Employee
FROM   Orders
GROUP BY EmployeeID
GO

-- GROUP BY Example 2)
-- Error Will Show Because :-
-- All columns in SELECT, HAVING, and ORDER BY must appear in GROUP BY clause or be inputs to aggregate expressions.
SELECT EmployeeID,YEAR(OrderDate) AS OrderYear, COUNT(*) AS Rows_For_Employee
FROM   Orders
GROUP BY EmployeeID
GO

-- To make it work add date to group by
SELECT EmployeeID,YEAR(OrderDate) AS OrderYear, COUNT(*) AS Rows_For_Employee
FROM   Orders
GROUP BY EmployeeID , YEAR(OrderDate)
GO

-- Group By Example 3)
SELECT ProductID, MAX(Quantity) AS largest_order 
FROM   [Order Details]
GROUP BY productid
ORDER BY largest_order DESC
GO
----------------------------------------------------------------------------------------------------------------------
/*
-- Lesson 3) Having Clause :-
-------------------------------------
      - HAVING clause provides a search condition that each group must satisfy.
	  - HAVING clause is processed after GROUP BY.
	  - WHERE  :- filters rows before groups created
      - HAVING :- filters groups Controls which groups are passed to next logical phase.
*/
-- Having Example 1)
-- Customers make more than 10 orders
SELECT CustomerID,COUNT(*) AS Count_Orders 
FROM   Orders 
GROUP BY CustomerID
HAVING COUNT(*) > 10
GO

-- Having Example 2)
-- Employees done more than 50 order 
-- and employeeID > 4
SELECT EmployeeID, COUNT(*) AS OrderCount
FROM   Orders
WHERE  EmployeeID > 4
GROUP BY EmployeeID
HAVING COUNT(*) > 50
GO
-------------------------------------------------------------------------------------------
--Lab (HOL)
------------
select COUNT(*)
from Employees
----------------------------------------------------------------
select COUNT(FirstName)
from Employees
----------------------------------------------------------------
--Testing Nulls
select count( Country)
from Employees
----------------------------------------------------------------
select count(ISNULL( Country,' '))
from Employees
----------------------------------------------------------------
select SUM(quantity) as [Product Qty],ProductID
from [Order Details]
where ProductID!=23
group by ProductID
order by ProductID
----------------------------------------------------------------
select SUM(quantity) as total ,max(quantity) as MAX ,min(quantity) as MIN ,avg(quantity) as AVG ,ProductID
from [Order Details]
where ProductID!=23
group by ProductID
order by ProductID
----------------------------------------------------------------
select SUM(quantity) as total ,ProductID
from [Order Details]
where ProductID!=23
group by ProductID
having SUM(quantity)>1000
order by ProductID
-----------------------------------------------------------------
--test this 
select quantity 
from [Order Details]
having Quantity >100 
-------------------------------------------------------------
select SUM(quantity)
from [Order Details]
having SUM(quantity)>1000
--================================================================================================
 --************************************************************************************************
 --                                 Using Aggregate Functions
 --************************************************************************************************
-------------------------------------------------------------------------------------------------------------
-- The CUBE and ROLLUP operators are useful in generating reports that contain subtotals and totals. 
-- There are extensions of the GROUP BY clause.
-------------------------------------------------------------------------------------------------------------
--ñ CUBE generates a result set that shows aggregates for all combinations of values in the selected columns.
--ñ ROLLUP generates a result set that shows aggregates for a hierarchy of values in the selected columns.
-------------------------------------------------------------------------------------------------------------
--Rollup
select SUM(quantity),ProductID,OrderID
from [Order Details]
group by ProductID,OrderID

select SUM(quantity),ProductID,OrderID
from [Order Details]
group by rollup( ProductID,OrderID)

-- test this 
select SUM(quantity),ProductID,OrderID
from [Order Details]
group by rollup( ProductID,OrderID)
having OrderID is null 
-------------------------------------------------------------
--Cube
select SUM(quantity),ProductID,OrderID
from [Order Details]
group by cube( ProductID,OrderID)
 

select SUM(quantity),ProductID,OrderID
from [Order Details]
group by cube( ProductID,OrderID)
having ProductID is null 
-------------------------------------------------------------
--Window Functions
select Categoryid ,productname,unitprice
from Products

select Max (unitprice) from products
---????
select *, Max (unitprice) from products  ---??
--select *,Max (unitprice) from products order by * --Error

select * ,rank()over(order by unitprice desc) from products 
------------------------------------------------------------------------------------------------------
select categoryid,productname,unitprice,RANK()over(partition by categoryid order by unitprice)
from Products
------------------------------------------------------------------------------------------------------
select categoryid,productname,unitprice,dense_RANK()over(partition by categoryid order by unitprice)
from Products
-------------------------------------------------------------------------------------------------------
select categoryid,productname,unitprice,row_number()over(partition by categoryid order by unitprice)
from Products
-------------------------------------------------------------------------------------------------------
select categoryid,productname,unitprice,ntile(4)over(partition by categoryid order by unitprice)
from Products
-------------------------------------------------------------------------------------------------------
---- Join with Grouping 
------------------------------------------------------------------------------------
select mgr.FirstName as manager , emp.FirstName as employee
from Employees as emp left outer join Employees as mgr
on emp.ReportsTo=mgr.EmployeeID
-------------------------------------------------------------------------------------
select mgr.FirstName as manager,COUNT(emp.firstname) [number of employees]
from Employees as emp left outer join Employees as mgr
on emp.ReportsTo=mgr.EmployeeID
group by mgr.FirstName
------------------------------------------------------------
select mgr.FirstName as manager,COUNT(emp.firstname)
from Employees as emp left outer join Employees as mgr
on emp.ReportsTo=mgr.EmployeeID
group by mgr.FirstName
-----------------------------------------------------------------------------------------
--======================================================================================
									--Module 10
									--Using Subqueries
--======================================================================================
--using Sub Query 
--simple subquery
-- 1.Writing Basic Subqueries
-- --------------------------
/*
-- each query that you have written has been a single self-contained statement. SQL Server also provides the 
ability to nest one query within anotheróin other words, to form subqueries. In a subquery, the results of 
the inner query (subquery) are returned to the outer query. 
-- A subquery is a query that is nested inside a SELECT, INSERT, UPDATE, 
   or DELETE statement, or inside another subquery that can be used 
   anywhere an expression is allowed.
  
-- Why to Use Subqueries?
   - To break down a complex query into a series of logical steps
   - To answer a query that relies on the results of another query

-- Why to Use Joins Rather Than Subqueries?
   - SQL Server executes joins faster than subqueries


 -- Subqueries can be self-contained or correlated
       1-Self-contained subqueries have no dependency on outer query
       2-Correlated subqueries depend on values from outer query
*/

-- Using Subquery as Expression
-- ----------------------------
------------------------------------------------------------
SELECT custid, orderid
FROM Sales.orders
WHERE custid IN (SELECT custid FROM Sales.Customers WHERE country ='Mexico')
-------------- same ex; by inner join-------------------
SELECT c.custid, o.orderid
FROM Sales.Customers AS c JOIN Sales.Orders AS o
ON c.custid = o.custid
WHERE c.country = 'Mexico'
-------------------------------------------------------------
/*
- A subquery is also called an inner query or inner select, 
  while the statement containing a subquery is also called an 
  outer query or outer select.

-- Many Transact-SQL statements that include subqueries can be  formulated as joins
-- Joins better performance than subquery but generate the same result

*/
-- Scalar & Tabular Subqueries (Single Row subQ , Multiple Row SubQ)
-- ---------------------------  ----------------------------------
-- A scalar subquery is a subquery that returns a single row of data,
-- while a tabular subquery is one that returns multiple rows
-- If inner query returns an empty set, result is converted to NULL
------------------------------------------------------------------------------
-- scalar
select top 1 * from orders order by OrderID desc

-- tabular
Use Northwind
select  c.CustomerID
from Customers c
where CustomerID IN (select CustomerID from orders)

-- SELECT statement built using a subquery:
-- ----------------------------------------
SELECT  e.EmployeeID
FROM    Employees e
WHERE   e.EmployeeID IN(SELECT o.EmployeeID FROM   Orders o)

-- SELECT statement built using a join that returns the same result set:
-- --------------------------------------------------------------------
SELECT  distinct e.EmployeeID
FROM    Employees e join Orders o
ON e.EmployeeID = o.EmployeeID
/*
-- Notes :
-----------
- The SELECT query of a subquery is always enclosed in parentheses. 
- It cannot include a COMPUTE , and may only include an ORDER BY clause when a TOP clause is also specified.
- It can include An optional GROUP BY clause,An optional WHERE clause  
*/
--==================================================================================
-- Using the ANY, ALL, and SOME Operators
-- --------------------------------------
SELECT  c.CustomerID
FROM    Customers c
WHERE   c.CustomerID in(SELECT o.CustomerID FROM   Orders o)
/*
-- WHERE expression comparison_operator [ANY | ALL] (subquery)
  -- Using the > comparison operator, 
  --   >ALL means greater than every value (greater than the maximum value):EX: >ALL (1, 2, 3) means greater than 3.
  --   <ALL Means less than the minimum.
  --   >ANY means greater than at least one of the values in the list of values returned by the subquery :
  --   >ANY (1, 2, 3) means greater than 1 (minimum).
  --   <ANY means less than the maximum.
  --   =ANY operator is equivalent to IN.
  --   <>ANY operator means not = a, or not = b, or not = c.
  --   NOT IN means not = a, and not = b, and not = c.
  --   <>ALL means the same as NOT IN     .          
*/
-----------------------------------------------------------------------------------------------------
use Northwind
select *from [Order Details] where ProductID = 23 ;

select orderid,customerid from orders as or1
where 20<(select quantity from [order details] as od
where or1.OrderID=od.OrderID and od.ProductID=23)
---------------------------------------------------------
select ProductName,UnitPrice,SupplierID
from Products 
where UnitPrice > (select AVG(unitprice) from Products)
-----------------------------------------------------------
use Northwind
select ProductName,UnitPrice,SupplierID
from Products 
where SupplierID in (select SupplierID from Products where ProductID>50)
------------------------------------------------------------
select ProductName,UnitPrice
from Products 
where CategoryID in (select CategoryID from Categories where CategoryName='Dairy Products')
------------------------------------------------------------
select ProductName,UnitPrice,(select max(UnitPrice) from Products) as maximum,UnitPrice-(select min(UnitPrice) from Products) as Diff
from Products 
where productID=1
------------------------------------------------------------
select  sum(unitprice),OrderID 
from [Order Details]  
group by OrderID 
------------------------------------------------------------
select productname,UnitPrice
from Products
where UnitPrice !=all(select  sum(unitprice) from [Order Details]  group by OrderID )
------------------------------------------------------------
select productname,UnitPrice
from Products
where UnitPrice >=all(select  sum(unitprice) from [Order Details] where OrderID=10923  group by OrderID )
------------------------------------------------------------
select productname,UnitPrice
from Products
where UnitPrice <=any(select  sum(unitprice) from [Order Details] where OrderID=10923  group by OrderID )
------------------------------------------------------------
--Key words All Any 
 -- Lets create two tables and inser values
CREATE TABLE Table1 (Id int)
GO
INSERT INTO Table1 VALUES (1), (2), (3), (4), (5)

CREATE TABLE Table2 (Id int)
GO
INSERT INTO Table2  VALUES (1), (3), (5)

SELECT Id FROM Table1 
WHERE Id =ANY (SELECT Id FROM Table2)

SELECT Id FROM Table1 
WHERE Id =ALL (SELECT Id FROM Table2)
 
 SELECT Id FROM Table1 
 WHERE Id >=ANY (SELECT Id FROM Table2)

 SELECT Id FROM Table1 
 WHERE Id >=ALL (SELECT Id FROM Table2)

SELECT Id FROM Table1 
 WHERE Id !=ALL (SELECT Id FROM Table2)
--------------------------------------------------------------------------------
 select id from table2 where exists(select Id from table1)
--=====================  exists  ===========================
select ProductName
from Products
where exists (select * from Categories where Categories.CategoryID=Products.CategoryID and CategoryName='Dairy Products')

------------------------------------------------------------
-- Using Subquery as Expression
-- ----------------------------

USE Pubs
SELECT title, price
FROM titles
WHERE price = (SELECT MAX(price) FROM titles)


USE Pubs
SELECT title, price,type
     ,( SELECT AVG(price) FROM titles) AS average
     ,price-(SELECT AVG(price) FROM titles) AS difference
 FROM titles
 WHERE type='popular_comp'

GO





-- scalar
USE Pubs
SELECT title, price
FROM titles
WHERE price = (SELECT MAX(price) FROM titles)


-- tabular
Use Northwind
select  c.CustomerID
from Customers c
where CustomerID IN (select CustomerID from orders)



SELECT  e.EmployeeID
FROM    Employees e
WHERE   e.EmployeeID IN
             (SELECT o.EmployeeID
              FROM   Orders o)



SELECT  distinct e.EmployeeID
FROM    Employees e join Orders o
ON e.EmployeeID = o.EmployeeID




-- Using the ANY, ALL, and SOME Operators
-- --------------------------------------
SELECT  c.CustomerID
FROM    Customers c
WHERE   c.CustomerID in               -- the same result with =Any ,=Some
             (SELECT o.CustomerID
              FROM   Orders o)

/*
-- WHERE expression comparison_operator [ANY | ALL] (subquery)
  -- Using the > comparison operator, 
  --   >ALL means greater than every value (greater than the maximum value):
       EX: >ALL (1, 2, 3) means greater than 3.
  --   <ALL Means less than the minimum.
  
  --   >ANY means greater than at least one of the values in the list
        of values returned by the subquery :
  --   >ANY (1, 2, 3) means greater than 1 (minimum).
  --   <ANY means less than the maximum.
  
  --   =ANY operator is equivalent to IN.
  
  --   <>ANY operator means not = a, or not = b, or not = c.
  --   NOT IN means not = a, and not = b, and not = c.
  --   <>ALL means the same as NOT IN     .          

*/


SELECT  c.CustomerID
FROM    Customers c
WHERE   c.CustomerID <> ALL            -- = Not In
             (SELECT o.CustomerID
              FROM   Orders o)
                            
                
Create  Table Depts
(empid int,jobid varchar(50),salary int)

insert Depts values
                                              
        (103, 'IT_PROG',          9000),                                              
        (104, 'IT_PROG',          6000),                                              
        (105, 'IT_PROG',          4800),                                               
        (106, 'IT_PROG',          4800),                                              
        (107, 'IT_PROG',          4200),                                               
        (108, 'FI_MGR' ,         12000),                                              
        (109, 'FI_ACCOUNT',       9000),                                              
        (110, 'FI_ACCOUNT',      8200),                                                                                                                                  
        (122, 'ST_MAN'    ,       7900),                                                                                           
        (123, 'ST_MAN'    ,      6500),                                              
        (124, 'ST_MAN'    ,       5800),                                              
        (143, 'ST_CLERK'  ,      2600),                                             
        (144, 'ST_CLERK'   ,      2500),                                                                                            
        (145, 'SA_MAN'     ,     14000),                                              
        (146, 'SA_MAN'     ,    13500),                                             
        (147, 'SA_MAN'     ,     12000),                                             
        (148, 'SA_MAN'     ,     11000),                                              
        (159, 'SA_REP'      ,     8000),                                              
        (160, 'SA_REP'      ,     7500),                                              
        (161, 'SA_REP'      ,     7000),                                               
        (162, 'SA_REP'       ,   10500),                                               
        (163, 'SA_REP'      ,     9500),                                               
        (171, 'SA_REP'      ,     7400),                                               
        (187, 'SH_CLERK'    ,     3000),                                               
        (188, 'SH_CLERK'    ,     3800),                                                                                             
        (189, 'SH_CLERK'    ,     3600)                                               
       


SELECT empid, JOBID, SALARY
FROM   Depts
WHERE  SALARY < ANY
                    (SELECT SALARY
                     FROM Depts
                     WHERE JOBID = 'IT_PROG')          -- 9000, 6000,4800,4200

AND JOBID <> 'IT_PROG'                               -- 9000(IT_PROG is the max)
                     


SELECT empid, JOBID, SALARY
FROM   Depts
WHERE  SALARY < ALL
                    (SELECT SALARY
                     FROM   Depts
                     WHERE  JOBID = 'IT_PROG')    -- 9000, 6000,4800,4200

AND JOBID <> 'IT_PROG'




--======================================================================================================

-- 2.Writing Correlated Subqueries
-- -------------------------------
/*
-- Many queries can be evaluated by executing the subquery once and 
   substituting the resulting value or values into the WHERE clause of 
   the outer query, turning the subquery into a correlated, or repeating, 
   subquery.
-- This means that the subquery is executed repeatedly, 
   once for each row that might be selected by the outer query.
-- correlated subquery cannot stand alone, as it depends on the outer query
-- A correlated subquery is an inner subquery whose information is referenced by the  main,outerquery
-- RETURNS A MORE THAN ONE ROW
-- use a multiple-row operator (IN,not in,ALL,ANY,between)    IN ---> =ANY
-- Behaves as if inner query is executed once per outer row

          
*/


--EX:
----
SELECT  e.employeeid
FROM    employees e
WHERE   e.employeeid IN
  (SELECT    o.employeeid
             FROM   orders o
   WHERE     o.employeeid =  e.employeeid)



--EX:
-----
USE northwind
SELECT orderid, customerid 
FROM orders AS o 
WHERE 20 < (SELECT quantity
		     FROM [order details] AS od
             WHERE o.orderid = od.orderid
             AND  od.productid = 23)
GO


--test
select quantity from  [order details]
where quantity >20 and productid=23

--===========================================================================================
                    




