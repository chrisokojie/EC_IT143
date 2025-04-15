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
SELECT Card_Member, SUM(transaction_count) AS TotalExpenses
FROM CardMember_Spending
GROUP BY Card_Member
ORDER BY TotalExpenses DESC;

-- Question 2: Are there any duplicate or overlapping transactions per card?
-- Author: Christopher Okojie
SELECT Card_Member, Date, Amount, COUNT(*) AS DuplicateCount
FROM Planet_Express
GROUP BY Card_Member, Date, Amount
HAVING COUNT(*) > 1;

-- Question 3: Which categories of spending are most frequent by dollar value?
-- Author: Christopher Okojie
SELECT main_category, SUM(transaction_count) AS TotalSpent
FROM CardMember_Spending
GROUP BY main_category
ORDER BY TotalSpent DESC;

-- Question 4: How many family members are employed?
-- Author: Another student
SELECT COUNT(*) AS EmployedFamilyMembers
FROM Family_Data
WHERE Status = 'Employed';
