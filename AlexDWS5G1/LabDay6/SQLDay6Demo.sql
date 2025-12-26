Use Northwind
GO
Select count(1),  Country
from Employees
Group by country 
Having count(1) > 4
--======================================================================================
									--Module 10
									--Using Subqueries
--======================================================================================
--using Sub Query 
--simple subquery
-- 1.Writing Basic Subqueries
-- --------------------------
/*
-- each query that you have written has been a single self-contained statement. 
SQL Server also provides the 
ability to nest one query within another—in other words, to form subqueries. 
In a subquery, the results of 
the inner query (subquery) are returned to the outer query. 
-- A subquery is a query that is nested inside a SELECT, INSERT, UPDATE, 
   or DELETE statement, or inside another subquery that can be used 
   anywhere an expression is allowed.
  
-- Why to Use Subqueries?
   - To break down a complex query into a series of logical steps
   - To answer a query that relies on the results of another query
       outerQuery (InnerQuery)

-- Why to Use Joins Rather Than Subqueries?
   - SQL Server executes joins faster than subqueries


 -- Subqueries can be self-contained or correlated
       1-Self-contained subqueries have no dependency on outer query
       2-Correlated subqueries depend on values from outer query
*/

Select * from Employees Where EmployeeID = 1


Select * From Orders  Where EmployeeID =(Select EmployeeID From Employees where FirstName = 'Nancy')


-- Using Subquery as Expression
-- ----------------------------
------------------------------------------------------------
SELECT CustomerID, orderid
FROM orders
WHERE CustomerID IN (SELECT CustomerID FROM Customers WHERE country ='Mexico')
-------------- same ex; by inner join-------------------
SELECT c.CustomerID, o.orderid
FROM Customers AS c JOIN Orders AS o
ON c.CustomerID = o.CustomerID
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
select top 5 * from orders order by OrderID desc

-- tabular
Use Northwind
select  c.CustomerID
from Customers c
where CustomerID IN (select CustomerID from orders)

select  c.CustomerID
from Customers c
where Exists (select CustomerID from orders)

select  c.CustomerID
from Customers c
where CustomerID Not IN (select CustomerID from orders)



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

Select * from Table1 
Select * from Table2

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
                            
--------------------------------------------------                
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


Select E.EmployeeId From Employees AS E 
Where EmployeeID IN( 
     Select o.EmployeeID 
	 From Orders as O
	 Where O.EmployeeID = e.EmployeeID
	 )


--Customer , Orders 
Select c.CustomerID , O.OrderID
from  Customers as C Join Orders as O 
ON C.CustomerID = o.CustomerID

Select CustomerID , OrderID
From Orders 
Where CustomerID in(Select CustomerID from Customers where Country = 'USA')

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

SELECT quantity
		     FROM [order details] AS od
             WHERE  od.productid = 23

--test
select quantity from  [order details]
where quantity >20 and productid=23



Select * from Orders AS O
Where exists (Select * From Employees e Where O.EmployeeID = e.EmployeeID AND  FirstName = 'Nancy')


select ProductName
from Products
where exists (
               select * 
			   from Categories 
			   where Categories.CategoryID=Products.CategoryID 
			   and CategoryName='Dairy Products')


Select OrderId ,
(Select ProductName From Products Where ProductID = Od.ProductID) , UnitPrice , Quantity ,Discount 
from [Order Details] As OD


--=================================================================		    
					--Module 11
					--Using Table Expressions

/*
					Using Views
					Using Inline TVFs
					Using Derived Tables
					Using CTEs
					Temp Table  # ##


--Lesson 1: Using Views
		Writing Queries That Return Results from Views
		Creating Simple Views
		Demonstration: Using Views

Views may be referenced in a SELECT statement just like a table
Views are named table expressions with definitions stored in a database
Like derived tables and CTEs, queries that use views can provide encapsulation and simplification
From an administrative perspective, views can provide a security layer to a database


*/
--=================================================================
--Creating Simple Views
-------------------------
--Views are saved queries created in a database by administrators and developers
--Views are defined with a single SELECT statement
--ORDER BY is not permitted in a view definition without the use of TOP, OFFSET/FETCH, or FOR XML
--To sort the output, use ORDER BY in the outer query
--View creation supports additional options beyond the scope of this class

--Object  Table , View SQL Query 
--MVVM  GUI
--MVC Model View Controller 
Select * from Employees
GO
Alter View VW_ShowInfoEmployee
AS 
   Select EmployeeID , FirstName , LastName ,Country  From Employees
   Where EmployeeID >2
go

Drop View VW_ShowInfoEmployee


--Injection SQL 

--Select 
--FROM <Source> Table , View ,Tables JOIN 

Select * from VW_ShowInfoEmployee
Where EmployeeID >5
GO

Create view VW_ShowEmployees
as
select EmployeeId , Firstname , Lastname ,Country  
from employees
where EmployeeId >5
go

--Now You Can call view 
select * from VW_ShowEmployees
--With Where 
select * from VW_ShowEmployees where country='UK'
--With Order By
select * from VW_ShowEmployees where country='UK' order by Firstname


--Insert Into VW_ShowEmployees Values ()

--Delete From VW_ShowEmployees Where EmployeeID = 7




Select * into EmployeeTest from Employees
GO
Create view VW_Empltest
AS 
Select * from  EmployeeTest
GO

Select * from VW_Empltest

Delete from VW_Empltest Where EmployeeID = 2 


Execute sp_help 'nvarchar'
Execute sp_help 'Employees'

Execute sp_helptext 'VW_Empltest'



Execute sp_helptext 'sp_help'


--Scalar Single Return
--TVF    Retuurn table 
GO
Create Function fn_Sum(@number1 int , @number2 int)
returns int
AS
    Begin 
	      return @number1 + @number2
	END

GO

Select dbo.fn_Sum(10,20)


GO
--Function TVF
Create Function Fn_ShowOrders (@employeeId int)
returns table
AS
     return Select OrderID , OrderDate  
	 From Orders Where EmployeeID = @employeeId
GO

Select * From Fn_ShowOrders(2)

Select * From Fn_ShowOrders(5)


--Table 
--View  (Select) 
--TVF Parameters & Order   Not (Insert , Update , Delete ) input Param
--Sp Procedure  Insert , update output / input

--============================================================================
--Lesson 2: Using Inline TVFs
--------------------------------
--Writing Queries That Use Inline TVFs
--Creating Simple Inline TVFs
--Retrieving from Inline TVFs
--Demonstration: Inline TVFs

--Writing Queries That Use Inline TVFs
---------------------------------------
--TVFs are named table expressions with definitions stored in a database
--TVFs return a virtual table to the calling query
--SQL Server provides two types of TVFs:
--Inline, based on a single SELECT statement
--Multi-statement, which creates and loads a table variable
--Unlike views, TVFs support input parameters
--Inline TVFs may be thought of as parameterized views


--Creating Simple Inline TVFs:-
--------------------------------
--TVFs are created by administrators and developers
--Create and name function and optional parameters with CREATE FUNCTION
--Declare return type as TABLE
--Define inline SELECT statement following RETURN

go
Create function Fn_test(@OID int)
returns table 
as 
return select orderId ,Quantity ,UnitPrice,cast(quantity * unitprice as decimal(9,2)) as Total
       from [Order Details]
	   where OrderID = @OID;
go
select * from fn_test(10248) 


-----------------  ----Demo on Function ----------------------------------
-- string Function
  go 
  create function Fun_MyStringFun(@x nvarchar(100))
  returns nvarchar(100)
  begin 
   return (Concat(Upper( substring(ltrim(@x),1,1)) ,lower(substring (ltrim(@x),2,len(@x)))))
  end 
go
Select firstname ,[dbo].[Fun_MyStringFun](firstname + lastname)from Employees 
--=================================================================================================
--Lesson 3: Using Derived Tables
---------------------------------
--Writing Queries with Derived Tables
--Guidelines for Derived Tables
--Using Aliases for Column Names in Derived Tables
--Passing Arguments to Derived Tables
--Nesting and Reusing Derived Tables
--Demonstration: Using Derived Tables

--Writing Queries with Derived Tables
--------------------------------------
--Derived tables are named query expressions created within an outer SELECT statement
--Not stored in database—represents a virtual relational table
--When processed, unpacked into query against underlying referenced objects
--Allow you to write more modular queries

--SELECT <column_list>
--FROM	(
--	<derived_table_definition>
--	) AS <derived_table_alias>;

--Scope of a derived table is the query in which it is defined
/*
--Notes 



-------
--Derived Tables Must:-
------------------------
1-Have an alias
2-Have names for all columns
3-Have unique names for all columns
4-Not use an ORDER BY clause (without TOP or OFFSET/FETCH)
5-Not be referred to multiple times in the same query

Derived Tables May:-
---------------------
1-Use internal or external aliases for columns
2-Refer to parameters and/or variables
3-Be nested within other derived tables

*/

--Select 
--From Table , View , TVF , (Derived Table)
--Column aliases may be defined inline:
SELECT orderyear, COUNT(DISTINCT customerID) AS cust_count
FROM (SELECT YEAR(orderdate) AS orderyear, CustomerID FROM Orders) AS derived_year
GROUP BY orderyear;


Select Years,COUNT(DISTINCT CustomerId) 
From (Select customerId , Year(OrderDate) as Years From Orders) as MyDate
Group by Years


--Column aliases may be defined externally:
SELECT orderyear, COUNT(DISTINCT custid) AS cust_count
FROM (SELECT YEAR(orderdate), CustomerID FROM Orders) AS derived_year(orderyear, custid)
GROUP BY orderyear;
----------------------------------------------------------------------------------------------
--Passing Arguments to Derived Tables
--Derived tables may refer to arguments
--Arguments might be:
--Variables declared in the same batch as the SELECT statement
--Parameters passed into a table-valued function or stored procedure

DECLARE @empid INT = 9;
SELECT orderyear, COUNT(DISTINCT CustomerID) AS cust_count
FROM (SELECT YEAR(orderdate) AS orderyear, customerID FROM Orders WHERE EmployeeID=@empid) AS derived_year
GROUP BY orderyear;
--==============================================================================================================
--Lesson 4: Using CTEs :-
--=========================
							/*
							Writing Queries with CTEs
							Creating Queries with Common Table Expressions
							*/
--


With Cte_table 
as 
(
  Select * from [Order Details] Where OrderID = 10290
)
Select * from Cte_table 

/*
CTE Common Table Exprssion 
Writing Queries with CTEs
CTEs are named table expressions defined in a query
CTEs are similar to derived tables in scope and naming requirements
Unlike derived tables, CTEs support multiple definitions, multiple references, and recursion

Syntax-
-------------------------------------
WITH <CTE_name> 
AS (
	<CTE_definition>
)
<outer query referencing CTE>;
--------------------------------------
To create a CTE:-
-----------------
Define the table expression in a WITH clause
Assign column aliases (inline or external)
Pass arguments if desired
Reference the CTE in the outer query


Scope --> View 
      --> TFV 
	  --> D-Table (Into Block Of code   Function)
	  --> CTE     (Into Block Of code   Function)
*/
select * from orders
go 
with Ctp_year
as
(
select year(orderDate) as OrderYear ,customerID from orders
)
select orderyear,count(distinct customerid)as CustCount
from Ctp_year 
Group By orderyear



GO

Create Function Fn_ShowResult (@year int)
returns table
As 
    return 
			    with Ctp_year
				as
				(
				select year(orderDate) as OrderYear ,customerID from orders
				)
				select orderyear,count(distinct customerid)as CustCount
				from Ctp_year 
				Where Ctp_year.OrderYear = @year
				Group By orderyear
GO

Select * from Fn_ShowResult (1997)




select year(orderDate) as OrderYear ,customerID 
into t1 from orders


Select * from T1


--Local temp table 
select year(orderDate) as OrderYear ,customerID 
into #t1 from orders

Select * from #t1


--Global temp table 
select year(orderDate) as OrderYear ,customerID 
into ##t1 from orders

Select * from ##t1

Drop table ##t1


---View Store SQL Query Not Parameter , Order by  (Select)    Object in Databse
---TFV Store SQL Query Parameter Order by (Just Only select)  Object in Databse
---CTE           Expression As table Just Script (Part Of Block Of Code)  From
---Drived table  Expression As table Just Script (Part Of Block Of Code)  From
---#table        Temp Table Per Session         
---##table       Temp Table For All sessions 
---SP            Select Insert Update Delete  Fast , input / output 

GO
Create Procedure Sp_ShowData @id int
As 
begin 
 if(@id <9)
    begin 
	     drop table #t1
	     Select * into #t1 from Employees Where EmployeeID = @id

	end 
	Else
	begin 
	      Select * from Orders Where EmployeeID = @id
	end      
end 

GO
Exec Sp_ShowData 2

Exec Sp_ShowData 9


GO


--=================================================================================================
/*
Module 15 
Executing Stored Procedures
------------------------------

				Querying Data with Stored Procedures
				Passing Parameters to Stored Procedures
				Creating Simple Stored Procedures
				Working with Dynamic SQL


Lesson 1: Querying Data with Stored Procedures
-----------------------------------------------
			Examining Stored Procedures
			Executing Stored Procedures


Examining Stored Procedures
	- Stored procedures are collections of T-SQL statements stored in a database
	- Procedures can return results, manipulate data, and perform administrative actions on the server
	- With other objects, procedures can provide a trusted application programming interface to a database,
	   insulating applications from database structure changes
			* Use views, functions, and procedures to return data
			* Use procedures to modify and add new data
			* Alter procedure definition in one place, rather than update application code

Executing Stored Procedures
      -Invoke a stored procedure using EXECUTE or EXEC
      -Call procedure with two-part name
      -Pass parameters in @name=value form, using appropriate data type
*/
use Northwind
go
--Create Procedure
Create Proc sp_ShowEmployees
as 
begin 
   select employeeId , FirstName,Lastname,Country from employees
end

--call Procedure 
exec sp_ShowEmployees
------------------------------------------------------------------------------------------------
--Lesson 2: Passing Parameters to Stored Procedures
-------------------------------------------------------
			--Passing Input Parameters to Stored Procedures

/*
Parameters are defined in the header of the procedure code, including name, data type and direction (input is default)
Parameters are discoverable using SQL Server Management Studio and the sys.parameters view
To pass parameters in an EXEC statement, use names defined in procedure

*/
go
Create  Proc sp_ShowEmployeesByCountry @Country nvarchar(50) 
as 
begin 
   select employeeId , FirstName,Lastname,Country 
   from employees
   where Country = @Country
end
go

exec sp_ShowEmployeesByCountry 'usa'
exec sp_ShowEmployeesByCountry 'UK'
-------------------------------------------------------------------------------
Declare @Quary nvarchar(50) = 'Select * from Employees'

Exec sp_executesql @Quary 

/*
Writing Queries with Dynamic SQL

 - Using sp_executesql
			- Accepts string as code to be run
			- Supports input, output parameters for query
			- Allows parameterized code while minimizing risk of SQL injection
			- Can perform better than EXEC due to query plan reuse

Syntax:-
--------
DECLARE @sqlcode AS NVARCHAR(256) = 	N'<code_to_run>';
EXEC sys.sp_executesql @statement = @sqlcode;

DECLARE @sqlcode AS NVARCHAR(256) = N'SELECT GETDATE() AS dt';
EXEC sys.sp_executesql @statement = @sqlcode;



*/
DECLARE @sqlcode AS NVARCHAR(256) = N'SELECT GETDATE() AS dt';
EXEC sys.sp_executesql @statement = @sqlcode;

declare @Database nvarchar(100) = 'Northwind';
declare @Table nvarchar(100) = 'Employees';
declare @Columns nvarchar(200) = 'EmployeeId , FirstName,LastName , Country ';
declare @Condition nvarchar(100) = 'country = ''usa''';

declare @Command  nvarchar(max) = 'use '+ @database +';'+' select '+ @Columns + ' From ' + @table + ' Where ' + @condition;  
EXEC sys.sp_executesql  @command


GO
Create Proc DynamicSQL  
@Database nvarchar(100),
@Table nvarchar(100) ,
@Columns nvarchar(200) ,
@Condition nvarchar(100) 
As 
begin 

	declare @Command  nvarchar(max) = 
	'use '+ @database +';'
	+' select '+ @Columns 
	+ ' From ' + @table 
	+ ' Where ' + @condition; 
	
	EXEC sys.sp_executesql  @command
end 


Exec DynamicSQL 'MyDatabase','Employees' ,'*','1=1 '



--=======================================================================
