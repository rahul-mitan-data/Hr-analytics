-- =========================================
-- HR ANALYTICS SQL PROJECT
-- =========================================

-- 1. Total Employees
SELECT COUNT(*) AS total_employees
FROM hr_analysis;

-- 2. Attrition Percentage
SELECT 
ROUND(
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
    *100.0/COUNT(*),2
) AS attrition_percent
FROM hr_analysis;

-- 3. Gender Distribution
SELECT Gender,
COUNT(*) AS total_employee
FROM hr_analysis
GROUP BY Gender;

-- 4. Department-wise Employees
SELECT Department,
COUNT(*) AS total_employee
FROM hr_analysis
GROUP BY Department
ORDER BY total_employee DESC;

-- 5. Average Salary by Department
SELECT Department,
ROUND(AVG(MonthlyIncome),2) AS avg_salary
FROM hr_analysis
GROUP BY Department;

-- 6. Attrition by Department
SELECT Department,
COUNT(*) AS attrition_count
FROM hr_analysis
WHERE Attrition='Yes'
GROUP BY Department
ORDER BY attrition_count DESC;

-- 7. Overtime Impact on Attrition
SELECT OverTime,
COUNT(*) AS total_employee
FROM hr_analysis
WHERE Attrition='Yes'
GROUP BY OverTime;

-- 8. Job Role-wise Attrition
SELECT JobRole,
COUNT(*) AS attrition_count
FROM hr_analysis
WHERE Attrition='Yes'
GROUP BY JobRole
ORDER BY attrition_count DESC;

-- 9. Average Age by Department
SELECT Department,
ROUND(AVG(Age),2) AS avg_age
FROM hr_analysis
GROUP BY Department;

-- 10. Education Field Distribution
SELECT EducationField,
COUNT(*) AS total_employee
FROM hr_analysis
GROUP BY EducationField;

-- 11. Marital Status Analysis
SELECT MaritalStatus,
COUNT(*) AS total_employee
FROM hr_analysis
GROUP BY MaritalStatus;

-- 12. Top 10 Highest Salary Employees
SELECT Empid,
MonthlyIncome
FROM hr_analysis
ORDER BY MonthlyIncome DESC
LIMIT 10;

-- 13. Job Satisfaction Analysis
SELECT JobSatisfaction,
COUNT(*) AS total_employee
FROM hr_analysis
GROUP BY JobSatisfaction;

-- 14. Attrition by Salary Slab
SELECT 
CASE
    WHEN MonthlyIncome < 5000 THEN 'Low Salary'
    WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium Salary'
    ELSE 'High Salary'
END AS salary_slab,

COUNT(*) AS attrition_count

FROM hr_analysis
WHERE Attrition='Yes'
GROUP BY salary_slab;

-- 15. Average Working Years
SELECT 
ROUND(AVG(TotalWorkingYears),2) AS avg_working_years
FROM hr_analysis;
