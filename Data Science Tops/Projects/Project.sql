use mit;
select * from hr_capstone_dataset;

-- What is the average satisfaction level of employees in the dataset?
select avg(satisfaction_level) as avg_satisfaction_level from hr_capstone_dataset;

-- INSIGHTS
-- The company's general evaluation of staff engagement and satisfaction is provided by the average satisfaction level.
-- A workforce that is more engaged and content is usually indicated by higher average satisfaction levels.

-- How many employees have a last evaluation score between 0.5 and 0.7?
SELECT COUNT(*) AS NumEmployees FROM hr_capstone_dataset WHERE last_evaluation BETWEEN 0.5 AND 0.7;

-- INSIGHTS
-- Using this data, managers may find workers who might require more help or direction in their jobs. 
-- It can help guide conversations during goal-setting and performance assessments.

-- How many employees have worked on 3 projects?
 select count(*) as employee_worked_in_3_project from hr_capstone_dataset where number_project=3;
 
--  INSIGHTS
--  Knowing how many workers have completed three projects can help with job sharing and resource allocation. 
-- It can assist in identifying workers who could be managing a balanced workload or who might be able to take on more tasks.

-- How many employees have an average monthly hours greater than 180?
select count(*) as employee_average_montly_hours from hr_capstone_dataset where average_montly_hours>180;

-- INSIGHTS
-- Finding workers with high average monthly hours (>180) might be useful in determining how the workload is distributed across the organisation.
-- It helps identify workers who could be at danger of burnout or who might require a change in workload.

-- What is the distribution of employees based on their time spent in the company (e.g., less than 2 years, 2-5 years, more than 5 years)?
SELECT 
    CASE
        WHEN time_spend_company < 2 THEN 'Less than 2 years'
        WHEN time_spend_company >= 2 AND time_spend_company <= 5 THEN '2-5 years'
        WHEN time_spend_company > 5 THEN 'More than 5 years'
    END AS TimeCategory,
    COUNT(*) AS NumEmployees
FROM hr_capstone_dataset
GROUP BY TimeCategory;

-- INSIGHTS
-- Gaining knowledge about the average length of time that workers stay with the organisation may help with retention rates. 

-- How many employees have experienced a work accident?
select * from hr_capstone_dataset;
SELECT COUNT(*) AS NumEmployees
FROM hr_capstone_dataset
WHERE Work_accident = 1;

-- INSIGHTS
-- The number of workers who had accidents at work can be used to identify places where safety precautions may need to be strengthened. 
-- By using this knowledge, workplace safety procedures may be improved and the chance of accidents in the future decreased.

-- How many employees have left the company
SELECT COUNT(*) AS NumEmployees
FROM hr_capstone_dataset
WHERE left_value = 1;

-- INSIGHTS
-- The loss of talent rate, which is essential for understanding employee turnover patterns,
-- may be calculated with the help of the number of people who leave from the company.

-- What is the maximum number of projects completed by an employee with a low salary?
SELECT MAX(number_project) AS MaxProjects
FROM hr_capstone_dataset
WHERE salary = 'low';

-- INSIGHTS
-- This data may be utilised to evaluate and modify pay scales or to honour outstanding work within the company. 

-- How many employees are in the sales department?
select count(*) as no_of_employees_in_sales from hr_capstone_dataset where Department = "sales";

-- INSIGHTS
-- It is possible to identify patterns or trends regarding staffing priorities, departmental structures,
-- and general organisational dynamics by comparing the size of the sales department with other departments within the company.

-- How many employees in each department have a satisfaction level above 0.5 and an average monthly hours worked over 150?
SELECT Department, COUNT(*) AS NumEmployees
FROM hr_capstone_dataset
WHERE satisfaction_level > 0.5 AND average_montly_hours > 150
GROUP BY Department;

-- INSIGHTS
-- Workers who put in more than 150 hours a month are seen as extremely engaged or productive. 
-- Higher numbers of these workers in a department might indicate a more productive culture or even a heavier workload.

-- What is the average satisfaction level for employees in each salary category?
SELECT salary, AVG(satisfaction_level) AS AvgSatisfaction
FROM hr_capstone_dataset
GROUP BY salary;

-- IMSIGHTS
-- The level to which employee happiness corresponds with pay levels may be determined by comparing average satisfaction levels across wage categories. 
-- Employees who are more satisfied with their salaries on average may believe that they are being fairly paid for the work they do.