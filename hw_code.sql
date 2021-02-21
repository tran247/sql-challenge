-- RECREATE TABLEs BECAUSE I FORGOT TO SAVE AND I SCROLLED RIGHT AND IT WENT BACK
--NOW I HAVE TO MAKE EVERYTHING AND SAVE AT EVERY TABLE SO I WONT FORGET
--DID I MENTION I HAVE TO DO THIS AGAIN? AHHHH!!!

-- CREATE departments table (2nd try)
CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR
);

-- CREATE dept_emp table
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR
);

--CREATE dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT
);

-- CREATE employees table
CREATE TABLE employees (
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);

--CREATE salaries table
CREATE TABLE salaries (
	emp_no INT,
	salary INT
);

--CREATE title table
CREATE TABLE title (
	title_id VARCHAR,
	title VARCHAR
);

-- DATA ANALYSIS
SELECT * FROM employees

-- CREATE 1st VIEW with e.emp_no, e.last_name, e.first_name, e.sex, s.salary
CREATE VIEW employee_salary AS
SELECT e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no=s.emp_no;

SELECT * FROM employee_salary

-- CREATE 2nd VIEW with e.first_name, e.last_name, e.hire_date in 1986
CREATE VIEW hire_1986 AS
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date >= TO_DATE('1986-01-01', 'YYYY-MM-DD')
AND hire_date <= TO_DATE('1986-12-31', 'YYYY-MM-DD');

SELECT * FROM hire_1986

