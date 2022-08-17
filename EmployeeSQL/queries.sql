-- 1.List the following details of each employee: employee number, 
-- last name, first name, sex, and salary.
SELECT E.emp_no, last_name, first_name, sex, salary
FROM employees E
INNER JOIN salaries S ON S.emp_no = E.emp_no;

--2.List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date between '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.
SELECT A.dept_no, B.dept_name, A.emp_no, C.last_name, C. first_name
FROM dept_manager A
INNER JOIN departments B ON B.dept_no = A.dept_no
INNER JOIN employees C ON C.emp_no = A.emp_no;

-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT A.emp_no, A.last_name, A.first_name, C.dept_name
FROM employees A
INNER JOIN dept_emp B ON B.emp_no = A.emp_no
INNER JOIN departments C ON C.dept_no = B.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT A.emp_no, A.last_name, A.first_name, C.dept_name
FROM employees A
INNER JOIN dept_emp B ON B.emp_no = A.emp_no
INNER JOIN departments C ON C.dept_no = B.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT A.emp_no, A.last_name, A.first_name, C.dept_name
FROM employees A
INNER JOIN dept_emp B ON B.emp_no = A.emp_no
INNER JOIN departments C ON C.dept_no = B.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT last_name, COUNT (last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT (last_name) DESC


