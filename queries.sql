-- CREATE DATABASE IF NOT EXISTS employees;
USE employees;

																								-- <----- 1. INSERTING DATA FIELD -----> --

-- [ TABLE EMPLOYEES ] --
SELECT * FROM  employees;
-- Ensures that the data are inserted into the employees table
INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES (1, '1975-11-23', 'Pepe', 'Perez', 'M', '2000-08-12');

-- Now add 14 more employees
INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES 
																							(2, '1975-11-23', 'Alicia', 'Maravilla', 'F', '2001-02-12'),
																							(3, '1985-09-23', 'Jaimito', 'James', 'M', '1993-08-16'),
                                                                                            (4, '1995-10-23', 'Pepa', 'Rodriguez', 'F', '2020-03-12'),
                                                                                            (5, '1975-11-15', 'Manuela', 'Sanchez', 'F', '2000-08-15'),
                                                                                            (6, '1969-08-13', 'Pedro', 'Rico', 'M', '1991-05-12'),
                                                                                            (7, '1980-01-24', 'Diana', 'Toledo', 'F', '1990-03-12'),
                                                                                            (8, '1988-02-23', 'Emilia', 'Surez', 'F', '2002-08-07'),
                                                                                            (9, '1989-11-02', 'Pau', 'Garcia', 'M', '2013-06-10'),
                                                                                            (10, '1982-09-23', 'Cristiano', 'Ronaldo', 'M', '2006-08-28'),
                                                                                            (11, '1990-11-20', 'Angelina', 'Jolie', 'F', '2017-02-10'),
                                                                                            (12, '1977-02-23', 'John', 'Cena', 'M', '1999-08-12'),
                                                                                            (13, '1981-09-18', 'Abel', 'Ruiz', 'M', '2003-04-03'),
                                                                                            (14, '1975-06-11', 'Conchita', 'Alvarez', 'F', '2000-09-12'),
                                                                                            (15, '2000-11-29', 'Alejandro', 'Grande', 'F', '2020-10-01');


-- [ TABLE SALARIES ] --
SELECT * FROM  salaries;
-- Insert salaries between a range of 5,000 & 50,000 (Random num from 5k to 50k)
-- 5 employees must have at least two salaries in different ranges of dates & diff amounts
INSERT INTO salaries (emp_no, salary, from_date, to_date) VALUES 
																	-- Double Salary Range
																	(1, 22036, '2000-08-12', '2007-02-14'),
																	(1, 35036,'2007-02-14', curdate()),	
                                                                     
																	-- Double Salary Range
																	(2, 48159, '1995-02-12', '2000-02-02'),
																	(2, 48159, '2000-02-02', curdate()),
                                                                                            
																	(3, 43241, '1993-08-16', curdate()),
																	(4, 20133, '2020-03-12', curdate()),
																	(5, 36322, '2000-08-15', curdate()),
																	(6, 39939, '1991-05-12', curdate()),
																	(7, 8850, '1990-03-12', curdate()),
																	(8, 25215, '2002-08-07', curdate()),
																	(9, 39892, '2013-06-10', curdate()),
                                                                        
																	-- Double Salary Range
																	(10, 13577, '2006-08-28', '2018-05-01'),
																	(10, 43577, '2018-05-01', curdate()),
                                                                          
																	-- Double Salary Range     
																	(11, 27077, '2017-02-10', '2021-12-28'),
																	(11, 35077, '2021-12-28', curdate()),
																	
                                                                    -- Double Salary Range
																	(12, 12603, '1999-08-12', '2002-02-18'),
																	(12, 27603, '2002-02-18', curdate()),
                                                                                            
																	(13, 45122, '2003-04-03', curdate()),
																	(14, 10746, '2000-09-12', curdate()),
																	(15, 36541, '2020-10-01', curdate());


-- [ TABLE DEPARTMENTS ] --
SELECT * FROM  departments;
-- 5 employees are managers (belong to dept_manager)
-- 10 employees belong to more than 1 department

INSERT INTO departments (dept_no, dept_name) VALUES 
													('1_IT', 'IT'),
													('2_MK', 'Marketing'),
                                                    ('3_PR', 'Production'),
                                                    ('4_FI', 'Finance'),
                                                    ('5_HR', 'HR');

-- [ TABLE MANAGERS ] --
SELECT * FROM  dept_manager;
INSERT INTO dept_manager (emp_no, dept_no, from_date, to_date) VALUES 
																		(3, '1_IT', '2021-05-01', curdate()),
																		(5, '2_MK','2000-08-15', curdate()),
																		(7, '3_PR', '1990-03-12', curdate()),
																		(13, '4_FI', '2003-04-03', curdate()),
																		(15, '5_HR','2020-10-01', curdate());

-- [ TABLE dept_emp ] --
SELECT * FROM  dept_emp;
INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date) VALUES 
																	(1, '1_IT', '2000-08-12', '2007-02-14'),
																	(1, '3_PR', '2007-02-14', curdate()),
																	
																	(2, '2_MK', '1995-02-12', '2000-02-02'),
																	(2, '5_HR', '2000-02-02', curdate()),
																	
																	 -- Current Manager
																	(3, '2_MK', '1993-08-16', '2021-05-01'),
																	(3, '1_IT', '2021-05-01', curdate()),
																	
																	(4, '1_IT', '2020-03-12', curdate()),
																	
																	-- Current Manager
																	(5, '3_PR', '2000-08-15', 2001-01-02),
																	(5, '2_MK', '2001-01-02', curdate()),
																	
																	(6, '2_MK', '1991-05-12', curdate()),
																	
																	
																	(7, '4_FI', '1990-03-12', '2002-03-03'),
																	(7, '3_PR', '2002-03-03', curdate()),
																	 
																	(8, '1_IT', '2002-08-07', curdate()),
																	
																	(9, '3_PR', '2013-06-10', curdate()),
																	
																	(10, '3_PR', '2006-08-28', '2018-05-01'),
																	(10, '2_MK', '2018-05-01', curdate()),
															 
																	(11, '4_FI', '2017-02-10', '2021-12-28'),
																	(11, '1_IT', '2021-12-28', curdate()),
																	
																	(12, '5_HR', '1999-08-12', '2002-02-18'),
																	(12, '4_FI', '2002-02-18', curdate()),
																	
																	-- Current Manager
																	(13, '1_IT', '2003-04-03', '2003-11-12'),
																	(13, '4_FI', '2003-11-12', curdate()),
																	
																	(14, '4_FI', '2000-09-12', curdate()),
																	
																	-- Current Manager
																	(15, '4_FI','2020-10-01', '2021-02-06'),
																	(15, '5_HR','2020-10-01', curdate());


-- [ TABLE employee Titles ] --
-- All employees have a degree & at least 5 titles are from 2020
-- At least 3 employees have the same name
SELECT * FROM  titles;
INSERT INTO titles (emp_no, title, from_date, to_date) VALUES 
																(1, 'Bachelor of Applied Science', '1997-01-06', NULL ),
                                                                (2, 'Bachelor of Computer Engineering', '1990-01-06', NULL ),
                                                                (3, 'Bachelor of Applied Mathematics', '2020-03-11', NULL ),
                                                                (4, 'Bachelor of Fine Arts', '2020-01-06', NULL ),
                                                                (5, 'Degree in Computer Sciense', '1993-01-06', NULL ),
                                                                (6, 'Bachelor of Applied Science', '2000-01-06', NULL ),
                                                                (7, 'Master of Laws', '2015-01-06', NULL ),
                                                                (8, 'Master of Social Works', '2003-01-06', NULL ),
                                                                (9, 'Master of Publishing', '2001-01-06', NULL ),
                                                                (10, 'Bachelor of Psychology', '1999-01-06', NULL ),
                                                                (11, 'Bachelor of Applied Science', '1996-01-06', NULL ),
                                                                (12, 'Bachelor in Bussiness Administration', '1990-01-06', NULL ),
                                                                (13, 'Bachelor in Economics', '2020-01-06', NULL ),
                                                                (14, 'Bachelor in Architecture', '2020-11-03', NULL ),
                                                                (15, 'Master in Physics', '2020-10-03', NULL );
                                                                
                                                                
                                                                -- <----- 2. UPDATING DATA FIELD -----> --
                                                                
-- Setting first_name as 'Lokesh' to employees whose last_name ends with the letter 'o' ['Rico', 'Toledo', 'Ronaldo']
SELECT * FROM employees WHERE last_name LIKE '%o';
UPDATE employees SET first_name = 'Lokesh' WHERE last_name  LIKE '%o';

-- Adding birth_date Statement and changing current name to diff from previous
SELECT * FROM employees;
UPDATE employees SET first_name = 'Batman' WHERE( 
												first_name = 'Lokesh'
													AND
												last_name  LIKE '%o'
													AND
                                                    birth_date BETWEEN 1968 AND 1983);
                                                    
                                                    
-- Change the name of ( all departments )
SELECT * FROM departments;
UPDATE departments SET dept_name = 
	CASE 
		WHEN dept_no = '1_IT' THEN 'Information Technology'
        WHEN dept_no = '2_MK' THEN 'Marketing 3.0'
        WHEN dept_no = '3_PR' THEN 'Innovative Production'
        WHEN dept_no = '4_FI' THEN 'Fair Finance'
        WHEN dept_no = '5_HR' THEN 'Human Resources'
	END;
    
    
																-- <----- 3. GETTING DATA FROM TABLES -----> --
                                                                
-- Select all employees with salary greater than 20,000 [List employee data & salary] 

SELECT * FROM employees;
SELECT * FROM salaries;
-- Showing both employee & salary tables with requested result
SELECT * FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no AND salaries.salary > 20000;

-- Select all employees with salary less than 10,000 [List employee data & salary] 
SELECT * FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no AND salaries.salary < 10000;

-- Select all employees who have a salary between 14,000 & 50,000 
SELECT * FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no AND salaries.salary BETWEEN 14000 AND 50000;

-- Select total number of employees
SELECT COUNT(emp_no) FROM  employees;

-- Select the total number of employees who have worked in more than one department
SELECT COUNT(dept_no), emp_no FROM dept_emp GROUP BY emp_no HAVING COUNT(dept_no) >= 2;

-- Select the titles of the year 2020 
SELECT * FROM titles;
SELECT * FROM titles WHERE from_date BETWEEN '2019-12-30' AND '2020-12-30';

-- Select only the name of the employees in capital letters
SELECT UCASE(first_name) FROM employees;

-- Select the name, surname and name of the current department of each employee
SELECT e.first_name, e.last_name,  d.dept_name FROM employees e
	INNER JOIN dept_emp depar ON e.emp_no = depar.emp_no
    INNER JOIN departments d ON depar.dept_no = d.dept_no;
    
-- Select the name, surname and number of times the employee has worked as a manager
SELECT COUNT(dm.emp_no), e.first_name, e.last_name FROM dept_manager dm
LEFT JOIN employees e ON e.emp_no = dm.emp_no 
GROUP BY dm.emp_no;

-- Select the name of employees without any being repeated
SELECT DISTINCT first_name FROM employees;


																-- <----- 3. DELETING DATA FROM TABLES -----> --
-- Delete all employees with a salary greater than 20,000
DELETE FROM employees WHERE emp_no IN (SELECT emp_no FROM salaries WHERE salary > 20000);                                                         
                                                                
-- Remove the department that has more employees
DELETE FROM departments WHERE dept_no = (SELECT dept_no FROM dept_emp GROUP BY dept_no HAVING COUNT(*) > 6);