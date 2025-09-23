SHOW TABLES;
SHOW COLUMNS FROM hrdataset.hrdataset_v14;
SELECT * FROM hrdataset_v14
LIMIT 10;
SELECT COUNT(*) AS total_records FROM hrdataset_v14;
-- Unique departments count
SELECT COUNT(DISTINCT department) AS total_departments
FROM hrdataset_v14;
-- Total employees
SELECT COUNT(*) AS total_employees
FROM hrdataset_v14;
-- Gender Distribution
SELECT Sex, COUNT(*) AS total
FROM hrdataset_v14
GROUP BY Sex;
-- Department-wise Employees
SELECT Department, COUNT(*) AS total
FROM hrdataset_v14
GROUP BY Department
ORDER BY total DESC;
-- Average Salary by Department
SELECT Department, ROUND(AVG(Salary), 2) AS avg_salary
FROM hrdataset_v14
GROUP BY Department
ORDER BY avg_salary DESC;
-- Attrition Rate (employees who left)
SELECT 
    COUNT(CASE WHEN Termd = 1 THEN 1 END) * 100.0 / COUNT(*) AS attrition_rate_percent
FROM hrdataset_v14;
-- Average Employee Tenure (in years)
SELECT ROUND(AVG(DATEDIFF(
    COALESCE(DateofTermination, CURDATE()), DateofHire
) / 365), 2) AS avg_tenure_years
FROM hrdataset_v14;
-- Performance Score Distribution
SELECT PerformanceScore, COUNT(*) AS total
FROM hrdataset_v14
GROUP BY PerformanceScore
ORDER BY total DESC;
-- Top 5 Highest Paid Employees
SELECT `ï»¿Employee_Name`, Department, Position, Salary
FROM hrdataset_v14
ORDER BY Salary DESC
LIMIT 5;
-- Absenteeism by Department
SELECT Department, SUM(Absences) AS total_absences
FROM hrdataset_v14
GROUP BY Department
ORDER BY total_absences DESC;
-- Top Highest Paid Employees Per Department
SELECT Department, `ï»¿Employee_Name`, Salary
FROM (
    SELECT Department,`ï»¿Employee_Name`, Salary,
           RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS rank_in_dept
    FROM hrdataset_v14
) ranked
WHERE rank_in_dept <= 3;
--  Employee Satisfaction vs Performance
SELECT PerformanceScore,
       ROUND(AVG(EmpSatisfaction), 2) AS avg_satisfaction,
       COUNT(*) AS total_employees
FROM hrdataset_v14
GROUP BY PerformanceScore
ORDER BY avg_satisfaction DESC;
