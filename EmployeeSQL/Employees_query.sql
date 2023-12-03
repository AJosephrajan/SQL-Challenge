-- Assignment 9 -SQL Challenge- Data Analysis Part
--***************************************************
--1.List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary
FROM employees e 
INNER JOIN salaries s ON e.emp_no = s.emp_no;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT last_name,
       first_name,
	   hire_date
FROM employees 
WHERE hire_date 
BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

--3.List the manager of each department along with their department number, department name, employee number,
--last name, and first name.

SELECT e.last_name,
       e.first_name,
	   e.emp_no,
	   d.dep_name,
	   dm.dep_no
FROM dep_manager dm
INNER JOIN departments d ON d.dep_no = dm.dep_no
INNER JOIN employees e ON e.emp_no = dm.emp_no
ORDER BY
	first_name,last_name ASC;
--4.List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name.
SELECT 
       de.dep_no,
       e.emp_no,
       e.last_name,
       e.first_name,
	   d.dep_name
FROM dep_emp de
INNER JOIN departments d ON d.dep_no = de.dep_no
INNER JOIN employees e ON e.emp_no = de.emp_no
ORDER BY
	first_name,last_name ASC;

--5.List first name, last name, and sex of each employee whose 
--first name is Hercules and whose last name begins with the letter B.
SELECT first_name,
       last_name,
	   sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name like 'B%';

--6.List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no,
       e.last_name,
       e.first_name,
       d.dep_name
FROM dep_emp de
INNER JOIN departments d ON d.dep_no = de.dep_no
INNER JOIN employees e ON e.emp_no = de.emp_no
WHERE dep_name ='Sales';

--7.List each employee in the Sales and Development departments,
--including their employee number, last name, first name, and department name.
SELECT e.emp_no,
       e.last_name,
       e.first_name,
       d.dep_name
FROM dep_emp de
INNER JOIN departments d ON d.dep_no = de.dep_no
INNER JOIN employees e ON e.emp_no = de.emp_no
WHERE dep_name IN ('Sales','Development');

--8.List the frequency counts, in descending order, of all the employee
--last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS lastName_Count
FROM employees
GROUP BY last_name
ORDER BY lastName_Count DESC;
