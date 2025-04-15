/* 
===============================================================================
Script Name: Simpsons_Community_Insights.sql
Author: Christopher Okojie
Date: April 15, 2025
Purpose: This script answers 4 analytical questions about the Simpsons community
         using the relevant SQL Server database. 3 questions are authored by me,
         and 1 is from another student.
===============================================================================
*/

-- Question 1: Which card members have the highest combined expenses?
-- Author: Christopher Okojie
SELECT CardMemberName, SUM(Amount) AS TotalExpenses
FROM Transactions
GROUP BY CardMemberName
ORDER BY TotalExpenses DESC;

-- Question 2: Are there any duplicate or overlapping transactions per card?
-- Author: Christopher Okojie
SELECT CardNumber, TransactionDate, Amount, COUNT(*) AS DuplicateCount
FROM Transactions
GROUP BY CardNumber, TransactionDate, Amount
HAVING COUNT(*) > 1;

-- Question 3: Which categories of spending are most frequent by dollar value?
-- Author: Christopher Okojie
SELECT Category, SUM(Amount) AS TotalSpent
FROM Transactions
GROUP BY Category
ORDER BY TotalSpent DESC;

-- Question 4: How many family members are employed?
-- Author: Another student
SELECT COUNT(*) AS EmployedFamilyMembers
FROM FamilyMembers
WHERE EmploymentStatus = 'Employed';
