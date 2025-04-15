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
SELECT pl_id, SUM(mtd_salary) AS TotalSeasonSalary
FROM tblPlayerFact
GROUP BY pl_id
ORDER BY TotalSeasonSalary DESC;

-- Question 2: Which teams are spending the most on players based on total salaries?
-- Author: Christopher Okojie
SELECT td.t_code, SUM(pf.mtd_salary) AS TotalTeamSalary
FROM tblPlayerFact pf
JOIN tblPlayerDim pd ON pf.pl_id = pd.pl_id
JOIN tblTeamDim td ON pd.t_id = td.t_id
GROUP BY td.t_code
ORDER BY TotalTeamSalary DESC;


-- Question 3: Which player scored the most points?
-- Author: Another student
SELECT TOP 1 pl_name, SUM(PointsScored) AS TotalPoints
FROM MatchStats
GROUP BY pl_name
ORDER BY TotalPoints DESC;


-- Question 4: How many players earn below the team’s average salary?
-- Author: Christopher Okojie
SELECT COUNT(*) AS PlayersBelowAverage
FROM tblPlayerFact pf
JOIN tblPlayerDim pd ON pf.pl_id = pd.pl_id
JOIN tblTeamDim td ON pd.t_id = td.t_id
JOIN (
    SELECT td_inner.t_code, AVG(pf_inner.mtd_salary) AS TeamAvgSalary
    FROM tblPlayerFact pf_inner
    JOIN tblPlayerDim pd_inner ON pf_inner.pl_id = pd_inner.pl_id
    JOIN tblTeamDim td_inner ON pd_inner.t_id = td_inner.t_id
    GROUP BY td_inner.t_code
) team_avg ON td.t_code = team_avg.t_code
WHERE pf.mtd_salary < team_avg.TeamAvgSalary;
