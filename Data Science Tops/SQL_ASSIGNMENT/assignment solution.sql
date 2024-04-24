use hr;

-- ASSIGNMENT PAGE 1

-- PG-1

-- Display all information in the tables EMP and DEPT
select * from employees;
select * from departments;

-- PG-2

-- Display only the hire date and employee name for each employee. (q2)

select hire_date, first_name from employees;

-- PG-3

-- Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title (q3)
select concat(first_name,' , ',job_id) as Employee_and_Title from employees; 

-- PG-4

-- Display the hire date, name and department number for all clerks(q4)
select hire_date, first_name, department_id from employees;

-- PG-5

-- Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT
SELECT CONCAT(employee_id, ', ', first_name, ', ', last_name, ', ', email, ', ', phone_number, ', ', hire_date, ', ', job_id, ', ', salary , ', ' , manager_id, ', ' ,department_id) AS "THE OUTPUT" FROM employees;

-- PG-6

-- Display the names and salaries of all employees with a salary greater than 2000. 
select first_name, salary from employees where salary > 2000;

-- PG-7

--  Display the names and dates of employees with the column headers "Name" and "Start Date"
select first_name as Name, hire_date as Start_Date from employees;

-- PG-8
-- Display the names and hire dates of all employees in the order they were hired. 
select * from employees;
select first_name, hire_date from employees order by hire_date;

-- PG-9

-- Display the names and salaries of all employees in reverse salary order. 
select * from employees;
select first_name, salary from employees order by salary desc;

-- PG-10

-- Display 'ename" and "deptno" who are all earned commission and display salary in reverse order. 
select * from employees;
select first_name, department_id, salary from employees where commission_pct is not null order by salary desc;

-- PG-11

--  Display the last name and job title of all employees who do not have a manager 
select * from employees;
select first_name, job_id from employees where manager_id is null;

-- PG-12

-- Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
select * from employees;
select last_name, job_id, salary from employees where job_id = 'AD_PRES' and salary  not in(2,500, 3,500, 5,000);

-- ASSIGNMENT PAGE 2

-- PG-1

-- Display the maximum, minimum and average salary and commission earned
select max(salary), min(salary), avg(salary), max(commission_pct), min(commission_pct), avg(commission_pct) from employees;

-- PG-2

-- Display the department number, total salary payout and total commission payout for each department. 
select sum(salary), sum(commission_pct), department_id from employees where commission_pct is not null group by department_id;

-- PG-3

--  Display the department number and number of employees in each department. 
SELECT department_id, COUNT(employee_id) as number_of_employees FROM employees GROUP BY department_id;

-- PG-4

-- Display the department number and total salary of employees in each department.
select * from employees; 
SELECT department_id, sum(salary) as total_salary FROM employees GROUP BY department_id;

-- PG-5

-- Display the employee's name who doesn't earn a commission. Order the result set without using the column name 
SELECT first_name FROM employees WHERE commission_pct IS NULL ORDER BY 1;

-- PG-6

-- Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately.
select 
    first_name as Employee_name, 
    department_id AS Department_ID, 
    CASE 
        WHEN commission_pct IS NULL THEN 'No commission' 
        ELSE commission_pct 
    END AS Commission_Status
FROM employees;

-- PG-7

-- Display the employee's name, salary and commission multiplied by 2. If an Employee  doesn't earn the commission, then display as 'No commission. Name the columns appropriately
select 
    first_name as Employee_name, 
    salary AS Salary, 
    CASE 
        WHEN commission_pct IS NULL THEN 'No commission' 
        ELSE commission_pct * 2 
    END AS Commission_Status
FROM employees;

-- PG-8

-- Display the employee's name, department id who have the first name same as another employee in the same department
select first_name, department_id from employees where first_name = first_name;

-- PG-9

-- Display the sum of salaries of the employees working under each Manager.  
select sum(salary), manager_id from employees group by manager_id;

-- PG-10

-- Select the Managers name, the count of employees working under and the department ID of the manager. 	
select count(employee_id), manager_id, department_id from employees group by department_id, manager_id;

-- PG-11

--  Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a! 
select * from employees;
SELECT 
    first_name AS Employee_Name,
    department_id AS Department_ID,
    salary AS Salary,
    (SELECT manager_id FROM employees WHERE employee_id = manager_id) AS Manager_Name
FROM employees 
WHERE last_name LIKE '_a%';

-- PG-12

-- Display the average of sum of the salaries and group the result with the department id. Order the result with the department id.
-- GROUP BY Manager_Name, Employee_Name, Department_ID, Salary

select department_id,  avg(salary) as Avg_Salary from employees group by department_id, salary, first_name, manager_id order by department_id;

-- PG-13

--  Select the maximum salary of each department along with the department id 
select max(salary), department_id from employees group by department_id ;

-- PG-14

-- Display the commission, if not null display 10% of salary, if null display a default value 1
SELECT 
    commission_pct,
    CASE 
        WHEN commission_pct IS NOT NULL THEN salary * 0.1
        ELSE 1
    END AS Calculated_Commission
FROM employees;

-- ASSIGNMENT PAGE 3

-- PG-1

-- Write a query that displays the employee's last names only from the string's 2-5th
-- position with the first letter capitalized and all other letters lowercase, Give each column an
-- appropriate label. 
SELECT CONCAT(UPPER(SUBSTRING(last_name, 1, 1)), LOWER(SUBSTRING(last_name, 2, 4))) AS Modified_Last_Name FROM employees;

-- PG-2

-- Write a query that displays the employee's first name and last name along with a " in
-- between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
-- month on which the employee has joined.

SELECT concat(first_name,'-', last_name) AS Full_Name, month(hire_date) AS Join_Month FROM employees;

-- PG-3

-- Write a query to display the employee's last name and if half of the salary is greater than
-- ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of
-- 1500 each. Provide each column an appropriate label. 

SELECT 
    last_name AS Employee_Last_Name,
    CASE 
        WHEN salary * 0.5 > 10000 THEN salary * 1.1 + 1500
        ELSE salary * 1.115 + 1500
    END AS Salary_With_Bonus
FROM employees;

-- PG-4

--  Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end,
-- department id, salary and the manager name all in Upper case, if the Manager name
-- consists of 'z' replace it with '$! 
SELECT 
    CONCAT(SUBSTRING(employee_id, 1, 2), '00E') AS Employee_ID,
    UPPER(department_id) AS Department_ID,
    salary,
    REPLACE(UPPER(manager_name), 'Z', '$!') AS Manager_Name
FROM (
    SELECT 
        employee_id,
        department_id,
        salary,
        CONCAT(first_name, ' ', last_name) AS manager_name
    FROM employees
) AS employee_manager;

-- PG-5

-- Write a query that displays the employee's last names with the first letter capitalized and
-- all other letters lowercase, and the length of the names, for all employees whose name
-- starts with J, A, or M. Give each column an appropriate label. Sort the results by the
-- employees' last names
SELECT 
    last_name AS Employee_Last_Name,
    CONCAT(UPPER(LEFT(last_name, 1)), LOWER(SUBSTRING(last_name, 2))) AS Modified_Last_Name,
    LENGTH(last_name) AS Name_Length
FROM employees
WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
ORDER BY last_name;

-- PG-6

-- Create a query to display the last name and salary for all employees. Format the salary to
-- be 15 characters long, left-padded with $. Label the column SALARY 
select * from employees;
select last_name, lpad(concat('$', salary), 15, ' ') as salary from employees;

-- The LPAD() function left-pads a string with another string, to a certain length.
-- LPAD(string, length, lpad_string)

select last_name, lpad(concat('$', salary), 15, '$') as salary from employees;
-- PG-7

-- Display the employee's name if it is a palindrome
select * from employees;
UPDATE employees
SET last_name = 'aba'
WHERE employee_id = 100;
SELECT last_name AS Palindrome_Name FROM employees WHERE last_name = REVERSE(last_name);

-- PG-8

-- Display First names of all employees with initcaps. 
SELECT CONCAT(UPPER(SUBSTRING(first_name, 1, 1)), LOWER(SUBSTRING(first_name, 2))) AS Capitalized_First_Name FROM employees;

-- PG-9

-- From LOCATIONS table, extract the word between first and second space from the
-- STREET ADDRESS column. 
select * from locations;
SELECT MID(
           STREET_ADDRESS, 
           LOCATE(' ', STREET_ADDRESS) + 1, 
           LOCATE(' ', STREET_ADDRESS, LOCATE(' ', STREET_ADDRESS) + 1) - LOCATE(' ', STREET_ADDRESS) - 1
       ) AS Extracted_Word
FROM LOCATIONS;


-- PG-10

-- Extract first letter from First Name column and append it with the Last Name. Also add
-- "@systechusa.com" at the end. Name the column as e-mail address. All characters should
-- be in lower case. Display this along with their First Name. 

select * from employees;
select concat(left(first_name,1), last_name, ' "@systechusa.com') as email_address from employees;

-- PG-11

-- Display the names and job titles of all employees with the same job as Trenna.
select job_id, first_name from employees where job_id = 'AD_VP';

-- PG-12

-- Display the names and department name of all employees working in the same city as
-- Trenna. 
select * from departments;
select * from employees;
select * from locations;
select e.last_name, d.department_name, l.city from employees as e join departments as d on e.department_id = d.department_id join locations as l on d.location_id = l.location_id where l.city = "Tokyo";

-- PG-13

-- Display the name of the employee whose salary is the lowest. 
select first_name, salary from employees order by salary asc limit 1;

-- PG-14

-- Display the names of all employees except the lowest paid.
select first_name, salary from employees where salary != 240 order by salary asc;

-- ASSIGNMENT - 4

-- PG-1

-- Write a query to display the last name, department number, department name for all
-- employees. 
select * from employees;
select * from departments;
select e.last_name, d.department_name, d.department_id from employees as e join departments as d on e.department_id = d.department_id;

-- PG-2

-- Create a unique list of all jobs that are in department 4. Include the location of the
-- department in the output
select * from departments;
select * from employees;
select distinct e.job_id, d.location_id from employees as e join departments as d on e.department_id = d.department_id and e.department_id = 90;

-- PG-3

--  Write a query to display the employee last name,department name,location id and city of
-- all employees who earn commission. 
select * from departments;
select * from employees;
select * from locations;
select e.last_name, d.department_name, l.location_id, l.city from employees as e join departments as d on e.employee_id = d.department_id join locations as l on l.location_id = d.location_id where commission_pct is not null;

-- PG-4

--  Display the employee last name and department name of all employees who have an 'a'
-- in their last name 
select e.last_name, d.department_name from employees as e join departments as d on e.employee_id = d.department_id where last_name like '%a';

-- PG-5

-- Write a query to display the last name,job,department number and department name for
-- all employees who work in ATLANTA.
select * from employees;
select * from departments;

SELECT e.last_name, e.job_id, d.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.location_id = 1800;

-- PG-6

-- Display the employee last name and employee number along with their manager's last
-- name and manager number. 
select e.last_name, e.employee_id, d.manager_id , d.department_name from employees as e join departments d on e.manager_id = d.manager_id;

-- PG-7

-- Display the employee last name and employee number along with their manager's last
-- name and manager number (including the employees who have no manager). 
SELECT e.last_name AS employee_last_name, e.employee_id, d.manager_id AS manager_id FROM employees e LEFT JOIN departments d ON e.manager_id = d.manager_id;

-- PG-8

-- Create a query that displays employees last name,department number,and all the
-- employees who work in the same department as a given employee. 

select last_name, department_id from employees where department_id = 90 or department_id = 60 or department_id = 100 or department_id = 30 or department_id = 50 or department_id = 80 or department_id = 110;

-- PG-9

--  Create a query that displays the name,job,department name,salary,grade for all
-- employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) 

select * from employees;
select * from departments;
select e.last_name, e.job_id, d.department_id, e.salary,
case 
   when e.salary >= 50000 then 'A'
   when e.salary >= 30000 then 'B'
   else 'C'
end as grade from employees as e join departments as d on e.department_id = d.department_id;

-- PG-10

-- Display the names and hire date for all employees who were hired before their
-- managers along withe their manager names and hire date. Label the columns as Employee
-- name, emp_hire_date,manager name,man_hire_date
SELECT 
    e.last_name AS Employee_name, 
    e.hire_date AS emp_hire_date,
    m.last_name AS manager_name,
    m.hire_date AS man_hire_date
FROM 
    employees as e
JOIN 
    employees as m ON e.manager_id = m.employee_id
WHERE 
    e.hire_date < m.hire_date;

