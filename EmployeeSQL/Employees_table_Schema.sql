--Assignment 9 - Data Engineering - Working with Employee Database
--1.Use the provided information to create a table schema for each of the six CSV files. Be sure to do the following:
--Remember to specify the data types, primary keys, foreign keys, and other constraints.
--For the primary keys, verify that the column is unique. Otherwise, create a composite key.
--Be sure to create the tables in the correct order to handle the foreign keys.
--2.Import each CSV file into its corresponding SQL table.

-- Drop the table If exists 
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dep_emp;
DROP TABLE IF EXISTS dep_manager;
DROP TABLE IF EXISTS salaries;

-- Create the following tables departments,title,employees,sep_emp,dep_manager,salaries
--create table deaprtments
CREATE TABLE departments(                                                                      
             dep_no  VARCHAR(5)  NOT NULL PRIMARY KEY,
             dep_name  VARCHAR(35) NOT NULL
            );
--Create table title			
CREATE TABLE title
(
	title_id  VARCHAR(5)  NOT NULL  PRIMARY KEY,
    title VARCHAR(35) NOT NULL
);

--Create table employees			
CREATE TABLE employees
(
	emp_no  INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name  VARCHAR(35) NOT NULL,
    last_name  VARCHAR(35) NOT NULL,
    sex CHAR NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES title(title_id) 
);
--Create table dep_emp			
CREATE TABLE dep_emp
(
	emp_no  INT NOT NULL, 
    dep_no  VARCHAR(5) NOT NULL,
    PRIMARY KEY (emp_no , dep_no),
    FOREIGN KEY (emp_no ) REFERENCES employees(emp_no),
    FOREIGN KEY (dep_no  ) REFERENCES  departments(dep_no)
);
--Create table dep_manager			
CREATE TABLE dep_manager
(
	dep_no VARCHAR(5)  NOT NULL,  
    emp_no  INT  NOT NULL,
    PRIMARY KEY (dep_no, emp_no),
    FOREIGN KEY (dep_no) REFERENCES departments(dep_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
--CREATE TABLE salaries
CREATE TABLE salaries
(
  emp_no  INT NOT NULL PRIMARY KEY ,
  Salary INT   NOT NULL ,                                                      
   FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
--After exporting the data Read the data
SELECT * FROM departments;
SELECT * FROM title;
SELECT * FROM employees;
SELECT * FROM dep_emp;
SELECT * FROM dep_manager;
SELECT * FROM salaries;

