USE AdventureWorks2022;

SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person
WHERE Title = 'Mr.';

CREATE NONCLUSTERED INDEX IX_Person_Title_2
ON Person.Person (Title);


SELECT SalesOrderID, OrderDate, TotalDue
FROM Sales.SalesOrderHeader
WHERE Comment = 'Order was processed late.';


CREATE NONCLUSTERED INDEX IX_SalesOrderHeader_Comment
ON Sales.SalesOrderHeader (Comment);