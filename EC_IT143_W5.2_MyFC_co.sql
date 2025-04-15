/* 
===============================================================================
Script Name: MyFC_Community_Insights.sql
Author: Christopher Okojie
Date: April 15, 2025
Purpose: This script answers 4 analytical questions about the MyFC community
         using the relevant SQL Server database. 3 questions are authored by me,
         and 1 is from another student.
===============================================================================
*/

-- Question 1: Which players had the highest total salary over the season?
-- Author: Christopher Okojie
SELECT PlayerName, SUM(Salary) AS TotalSeasonSalary
FROM PlayerContracts
GROUP BY PlayerName
ORDER BY TotalSeasonSalary DESC;

-- Question 2: Which teams are spending the most on players based on total salaries?
-- Author: Christopher Okojie
SELECT TeamName, SUM(Salary) AS TotalTeamSalary
FROM PlayerContracts
GROUP BY TeamName
ORDER BY TotalTeamSalary DESC;

-- Question 3: Which player scored the most points?
-- Author: Another student
SELECT PlayerName, SUM(PointsScored) AS TotalPoints
FROM MatchStats
GROUP BY PlayerName
ORDER BY TotalPoints DESC
FETCH FIRST 1 ROWS ONLY;  -- Use TOP 1 if using SQL Server

-- Question 4: How many players earn below the team’s average salary?
-- Author: Christopher Okojie
SELECT COUNT(*) AS PlayersBelowAverage
FROM PlayerContracts pc
JOIN (
    SELECT TeamName, AVG(Salary) AS TeamAvgSalary
    FROM PlayerContracts
    GROUP BY TeamName
) team_avg
ON pc.TeamName = team_avg.TeamName
WHERE pc.Salary < team_avg.TeamAvgSalary;
