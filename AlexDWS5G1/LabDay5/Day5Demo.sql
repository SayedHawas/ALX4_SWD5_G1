--
USE Northwind
GO

Select O.OrderDate , O.OrderID , c.CompanyName
from Customers as C Inner Join Orders as O 
ON c.CustomerID = O.CustomerID


Select O.OrderDate , O.OrderID , c.CompanyName
from Customers as C Left Join Orders as O 
ON c.CustomerID = O.CustomerID
Where O.OrderID Is NULL


SELECT O.OrderDate, O.OrderID, C.CompanyName, E.FirstName, P.ProductName, od.Quantity, od.UnitPrice, C.City
FROM     Customers AS C INNER JOIN
                  Orders AS O ON C.CustomerID = O.CustomerID INNER JOIN
                  [Order Details] AS od ON O.OrderID = od.OrderID INNER JOIN
                  Products AS P ON P.ProductID = od.ProductID INNER JOIN
                  Employees AS E ON E.EmployeeID = O.EmployeeID
WHERE  (od.Quantity > 100)



--Editor
SELECT Customers.CompanyName, Orders.OrderID, Orders.OrderDate, [Order Details].Quantity, [Order Details].UnitPrice, Products.ProductName AS Name, Employees.FirstName
FROM     Customers INNER JOIN
                  Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                  Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN
                  [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
                  Products ON [Order Details].ProductID = Products.ProductID
WHERE  ([Order Details].Quantity > 100)
ORDER BY [Order Details].UnitPrice
---------------------------------------------
Declare @name nvarchar(50) = 'Ahmed'
Declare @name2 varchar(50) = '????'
Select @name , @name2

--> Create Table Columns   Name  Age  Salary 




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
*/
Declare @x char(5) = 'sdvjfvjvds'
Declare @y varchar(5) ='Ahmed'
declare @t varchar(max) = 'jdjhdsjf'
Select @x

Declare @xAr Nchar(5)=N'????' --1-4000
Declare @yAr nvarchar(5) = N'????'
declare @t Nvarchar(max) = 'jdjhdsjf'
Select @xAr

--MetaDataQuery 
Exec Sp_Help nvarchar
Exec Sp_Help varchar

Declare @Salary Decimal(9,2)  --1234567.89


Declare  @unq uniqueidentifier = NewId()
Select @unq

--Int 
--big Int 

--1-Character DataTypes: String text 
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
/*
--Extent Markup language   XML , JSON 
Select * from Employees for xml auto
Select * from Employees for xml path

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
Module 7
Using DML to Modify Data
---------------------------------------------------------------------
						-Adding Data to Tables
						-Modifying and Removing Data
						-Generating Automatic Column Value
---------------------------------------------------------------------
*) Adding Data to Tables
-----------------------------
		Using INSERT to Add Data
		Using INSERT with Data Providers
		Using SELECT INTO
		using Output
*/
--Using INSERT to Add Data
Create database TestDB
go 
use TestDB
go
Create table Students(ID int Primary Key Identity,
                      Name nvarchar(50)Not Null,
					  Course nvarchar(30),
					  [Level] int)
go

Select * from Students

---Select 
Insert Into Students  (Level,name, Course)  Values (1,'sayed','sql')

Insert into Students(Name,Course,level)values ('Retaj','SQL Query',1);
 
Insert into Students values ('Mariam','SQL Query',1);

Insert into Students values ('Osama',1); --Error
Insert into Students (name, level) values ('Osama',1); 
Insert into Students(Name , Level) values ('Osama',1); 
select * from students 
--Add multi Rows 
Insert into Students values ('Tammer','SQL Query',1),
                            ('Ahmed','SQL Query',1),
							('Ramy','SQL Query',1)

-- test
Select * from Students
select @@ROWCOUNT


---Select  Into 
Select * into NewStudents from Students Where Id >3

Select * from NewStudents
--Insert ...Select 
Insert Into Students Select Name,Course,Level from NewStudents

Go
Create Function fn_getdata()
returns table 
as
  return Select Name , Course , Level From NewStudents
GO


Insert Into Students Select * from fn_getdata()


-- Insert Partial Data
-- -------------------

select * from Students 
---------------------------------------------------------------------------------------------
--INSERT ... SELECT to insert rows from another table:
use Northwind
go
Create table EmployeesShortTable (ID int primary key identity,
                                  Fname nvarchar(50) ,
								  Lastname nvarchar(50) ,
								  Country nvarchar(50))
go
insert into EmployeesShortTable select firstname ,lastname ,Country from Employees

select * from Employees
select * from EmployeesShortTable

--------------------------------------------------
--TVF table Value Function
------------

truncate table EmployeesShortTable
select * from EmployeesShortTable
go
Create function Fn_selectEmployees()
returns table
as
return select firstname ,lastname ,Country from Employees
go
insert into EmployeesShortTable select * from Fn_selectEmployees() 
select * from EmployeesShortTable
--------------------------------------------------
--INSERT ... EXEC
------------------ 
truncate table EmployeesShortTable
select * from EmployeesShortTable

go
Create Proc sp_Insert
as
begin 
   select firstname ,lastname ,Country from Employees
end
go

insert into EmployeesShortTable exec sp_insert

select * from EmployeesShortTable

-----------------------------------------------------------------
--Using SELECT INTO
/*
*)The new table is based on query column structure
     - Uses column names, data types, and null settings
     - Does not copy constraints or indexes
*/
select * from Employees Where EmployeeID >5

select EmployeeID ,FirstName ,LastName ,BirthDate into emps
from Employees Where EmployeeID >5
-------------------------------------------------------------------
--Use the OUTPUT keyword with INSERT Or Delete with Select 

USE Northwind
GO
SELECT * FROM [Order Details] WHERE ProductID = 70	


--1
SELECT * INTO NewOrderDetails 
FROM [Order Details] WHERE ProductID = 70		
--2
select * from NewOrderDetails

truncate table NewOrderDetails


--Just one 
--Insert
INSERT into NewOrderDetails OUTPUT INSERTED.* SELECT * FROM [Order Details] where ProductID =50

select * from NewOrderDetails

-- Delete 
DELETE FROM NewOrderDetails 		
OUTPUT DELETED.*
WHERE UnitPrice >15 

select * from NewOrderDetails
--------------------------------------------------------------------------------------------------------
-- Truncate Table
-- --------------
--TRUNCATE TABLE is functionally the same to the DELETE statement without a WHERE clause
--TRUNCATE TABLE Statement Deletes All Rows in a Table
--TRUNCATE TABLE has the following advantages:-
------------------------------------------------
/*
1-Faster than delete Statement

2-Removes all rows from a table without logging the individual row deletions,
  (nonlogged method of deleting all rows in a table)

3-can not put a where clause 

4-The DELETE statement removes rows one at a time and records an entry in the transaction log
  for each deleted row.TRUNCATE TABLE removes the data by deallocating the data pages used to 
  store the table

5-after a DELETE statement is executed, the table can still contain empty pages
  with TRUNCATE zero pages are left in the table

6-TRUNCATE TABLE removes all rows from a table, 
  but the table structure and its columns, constraints, indexes, and so on remain(Use Drop table)

7- You cannot use TRUNCATE TABLE on tables that are referenced by a FOREIGN KEY constraint
*/
Truncate Table table2
--================================================================================================================================
--=================================================
--Lesson 2: Modifying and Removing Data
--=================================================		
					--Using UPDATE to Modify Data
					--Using MERGE to Modify Data
/*
--Using UPDATE to Modify Data
------------------------------
UPDATE changes all rows in a table or view
Unless rows are filtered with a WHERE clause or constrained with a JOIN clause
Column values are changed with the SET clause 
*/

--One Row 
UPDATE Products
   SET   unitprice = (unitprice * 1.04)
WHERE   Productid =  1

--More than One Row 
UPDATE Products
   SET   unitprice = (unitprice * 1.04)
WHERE   categoryid =  1 AND discontinued = 0

--Using 
-- assignment operators *=
UPDATE Products
   SET     unitprice *= 1.04 
			 -- Using compound
			 -- assignment operators 
WHERE   categoryid =  1 AND discontinued = 0;

------------------------------------------------
--join
select count(OrderID),e.employeeId
FROM   Orders AS o INNER JOIN Employees AS e
ON 	e.employeeID = O.employeeID 
group by e.employeeId
having count(orderId)> 100;
--------------------------------------------------------------------------------------------------
--Updating Data in One Table Based on a Join to Another
 --Join 
select p.ProductName ,od.Quantity
FROM Products AS P INNER JOIN  [Order Details] AS od
ON 	p .ProductID =  od.ProductID AND od.Quantity > 100;

UPDATE Products  -- Notice use of Alias to make reading better 
	   SET ProductName += ' ?' 
FROM Products AS P INNER JOIN  [Order Details] AS od
ON 	p .ProductID =  od.ProductID AND od.Quantity > 100;
-------------------------------------------------------------------------------------------------- 
--Using Join & SubQuery 
UPDATE employees   -- Notice use of Alias to make reading better 
	SET FirstName += 'p' 
FROM   Orders AS o INNER JOIN Employees AS e
ON 	e.employeeID = O.employeeID 
where e.employeeID in (select employeeID from orders group by employeeId having count(orderid )>150)

select * from employees
----------------------------------------------------------------------------------------
--Using MERGE to Modify Data
--==============================
/*
MERGE modifies data based on a condition
When the source matches the target
When the source has no match in the target
When the target has no match in the source


MERGE TOP (10) 
INTO	Store 		AS Destination
USING	StoreBackup 	AS StagingTable
	ON(Destination.Key = StagingTable.Key)

WHEN NOT MATCHED THEN
	INSERT (C1,..)
	VALUES (Source.C1,..)
WHEN MATCHED THEN 
	UPDATE SET Destination.C1 = StagingTable.C1,..;
*/

Create table MonthTrans
(
 id int , Name nvarchar(50),total decimal(9,2), Gtotal decimal(9,2)
)
go
Create table DayTrans
(
 id int , Name nvarchar(50),total decimal(9,2)
)

insert into MonthTrans values (1,'retaj',2000 ,5000),
(2,'Osama',1000 ,4000),(3,'Mariam',200 ,1000)
select *from MonthTrans 


insert into DayTrans values (1,'retaj',250),
(2,'Osama',100),(4,'sayed',100),(5,'ahemd',500)

select * from monthtrans
select * from Daytrans


merge into monthtrans as Mt
USING daytrans as dt 
ON Mt.Id = Dt.ID
When matched then 
   update set Mt.total = mt.total + dt.total
when not matched by target then 
   insert (id,Name,total) values (dt.Id,Dt.Name,Dt.total);
GO
merge into monthtrans as Mt --Target
using daytrans as Dt --Source
on Mt.Id=Dt.ID
when matched then 
update set Mt.total = Mt.total + dt.total 
when  not Matched by target then 
insert (id,Name,total)values (dt.ID,dt.Name,dt.total);

delete from daytrans
----------------------------------------------------------------------------------------
--==================================================
--Lesson 3: Generating Automatic Column Values
--==================================================
--1)Using IDENTITY
-------------------
/*
--The IDENTITY property generates column values automatically
*)Optional seed and increment values can be provided
*)Only one column in a table may have IDENTITY defined 
*)IDENTITY column must be omitted in a normal INSERT statement
*)Functions are provided to return last generated values
    SELECT @@IDENTITY: default scope is session
    SELECT SCOPE_IDENTITY(): scope is object containing the call in function and procedure 
    SELECT IDENT_CURRENT(' tablename'): in this case, scope is defined by tablename
There is a setting to allow identity columns to be changed manually ON or automatic OFF
SET IDENTITY_INSERT <Tablename> [ON|OFF]
*/
CREATE TABLE Books(PID int IDENTITY(1,1) NOT NULL, Name VARCHAR(15))
go
INSERT INTO Books (Name) VALUES ('MOC 2072 Manual')  
select * from Books

set identity_insert books on;
INSERT INTO Books(PID,Name)  VALUES (100,'MOC SQL ')
set identity_insert books off;

select * from books


INSERT INTO Books(Name)  VALUES ('MOC SQL Query ')
select * from Books
-----------------------------------------------------------
SELECT IDENT_CURRENT('Books');
select ident_seed('Books');
select IDENT_INCR('Books');

SELECT @@IDENTITY
SELECT SCOPE_IDENTITY()
SELECT IDENT_CURRENT('Employees')

select max (employeeID) , min(employeeID) from Employees
----------------------------------------------------------------------------------------
--2)Using Sequences
--------------------
/*
Sequence objects were first added in SQL Server 2012
Independent objects in database

More flexible than the IDENTITY property
Can be used as default value for a column
Manage with CREATE/ALTER/DROP statements
Retrieve value with the NEXT VALUE FOR clause
*/
-- Define a sequence
CREATE SEQUENCE dbo.InvoiceSeq AS INT START WITH 1 INCREMENT BY 1;
-- Retrieve next available value from sequence
SELECT NEXT VALUE FOR dbo.InvoiceSeq;
------------------------------------------------------------------
 Drop sequence dbo.InvoiceSeq 

 --Best
if object_Id('dbo.InvoiceSeq') is Not Null
begin
 Drop sequence dbo.InvoiceSeq 
end
   
go
CREATE SEQUENCE dbo.InvoiceSeq AS INT START WITH 1 INCREMENT BY 1;
go
Create table subjects (ID int primary key , SuubjectName nvarchar(50))
go 
insert into subjects values (NEXT VALUE FOR dbo.InvoiceSeq,'SQl Query ') 
select * from subjects 


insert into subjects values (100,'SQl Query ')
insert into subjects values (NEXT VALUE FOR dbo.InvoiceSeq,'SQl Query ')
select * from subjects 
---------------------------------------------------------------------------------------
--Advanced 
/* GUIDS
---------
- Data Integrity Rule Number 1 is All rows must be unique.
- Real Life Have Multiple rows are identical and correct.
- GUID Randomly generated values.
- Use GUID to switch Identical data to uniquely values.
- Use GUID by :- 1) Column Datatype Uniqueidentifier.
                 2) Functions NEWID(), NEWSEQUENTIALID().
-----------------------------------------------------------
* NEWID(), NEWSEQUENTIALID()
-------------------------------
- Generate a values based on :- CPU clock, NetworkCard
- NEWID() un order random GUID.
- NEWSEQUENTIALID() generate sequentialy values.
- NEWID() make issues for Indexing.
- NEWSEQUENTIALID() good for Indexing bad for security.
------------------------------------------------------------- */
-- Select NEW() 
SELECT NEWID()

-- CREATE NEWID() COLUMN
CREATE TABLE NEWID_TABLE
(
       ID UNIQUEIDENTIFIER DEFAULT NEWID() ,
	   NAME NVARCHAR(100) ,
	   TITLE  NVARCHAR(100)
)
GO
-- PUT DATA 
INSERT INTO NEWID_TABLE(NAME,TITLE)
VALUES ( 'Osama', 'Maneger'),
       ( 'Sayed', 'Employee'),
	   ( 'Retaj','Developer')
GO
-- SEE RESULT
SELECT * FROM NEWID_TABLE
GO
--Clean
DROP TABLE NEWID_TABLE
GO
----------------------------------------------------

-- Create Column With SequentialID()
CREATE TABLE SEQUENTIALEDID_TABLE
(
       ID UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID(),
	   NAME NVARCHAR(100) ,
	   TITLE  NVARCHAR(100)
)
GO
-- PUT DATA 
INSERT INTO SEQUENTIALEDID_TABLE(NAME,TITLE)
VALUES ( 'Osama', 'Maneger'),
       ( 'Sayed', 'Employee'),
	   ( 'Retaj','Developer')
GO
-- SEE RESULT
SELECT * FROM SEQUENTIALEDID_TABLE
GO
--Clean
DROP TABLE SEQUENTIALEDID_TABLE
----------------------------------
-- NEWID Tricks
---------------
-- 1) Generate A random decimal number
SELECT RAND( CHECKSUM( NEWID()));
GO
--OR 
SELECT RAND() 
GO

-- 2) Random Float Number between 
SELECT 20*RAND()                     -- Float From 0-20
SELECT 10 + (30-10)*RAND()           -- Float FROM 10-30
SELECT round(10 + (30-10)*RAND(),0)  -- int FROM 10-30

-- 3) Generate A random number
SELECT ABS(CHECKSUM(NEWID()))
GO

-- 4) Generate Random Numbers between Rang
SELECT CONVERT(INT, (100+1)*RAND()) -- FROM 0-100
GO

--OR 
DECLARE @Random INT;
DECLARE @Upper INT;
DECLARE @Lower INT
---- This will create a random number between 1 and 999
SET @Lower = 1 ---- The lowest random number
SET @Upper = 999 ---- The highest random number
SELECT @Random = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)
SELECT @Random


-- 5) Retrieving Random Rows from Table 
select * from employees order by (NewID())
select top(3)* from employees order by (NewID())
-------------------------------------------------------------------------
--Select , Insert , Update , delete , Create DB  Datatype (nvarchar, varchar , int , Decimal , bit , datatime )
--Relationship 
--Join 
--SP, Trasc


-- Max , Min , Sum , Count , Avg

Select Count(*) from Employees

Select Count(1) as total ,country ,City
From Employees
where country = 'USA'
Group by country ,City
Having Count(1) =1
Order by total

Select 10
Select 1 from Employees
Select * from Employees
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

Select E.FirstName, o.EmployeeID , Year(OrderDate) As [Year] , Count(1) As Total
from Orders As O Inner Join Employees as E 
ON E.EmployeeID = O.EmployeeID
Where Year(OrderDate) = 1997
Group By o.EmployeeID , Year(OrderDate) ,E.FirstName
Order By Total


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
