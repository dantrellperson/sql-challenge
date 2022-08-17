CREATE TABLE titles (
    title_id VARCHAR(20) PRIMARY KEY NOT NULL,
    title VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    emp_no VARCHAR(50) PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(20) NOT NULL,
    birth_date DATE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE dept_manager(
    dept_no VARCHAR(10) NOT NULL,
    emp_no VARCHAR(50) NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY(dept_no, emp_no)
);

CREATE TABLE dept_emp(
    emp_no VARCHAR(50) NOT NULL,
    dept_no VARCHAR(10) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    PRIMARY KEY(emp_no, dept_no)
);

CREATE TABLE salaries (
    emp_no VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

COPY titles (title_id, title)
FROM '/Users/trell/Data_Bootcamp/09-SQL/sql-challenge/data/titles.csv'
CSV HEADER;

COPY employees (emp_no, emp_title_id,birth_date,first_name,last_name,sex,hire_date)
FROM '/Users/trell/Data_Bootcamp/09-SQL/sql-challenge/data/employees.csv'
CSV HEADER;

COPY departments (dept_no, dept_name)
FROM '/Users/trell/Data_Bootcamp/09-SQL/sql-challenge/data/departments.csv'
CSV HEADER;

COPY dept_manager (dept_no, emp_no)
FROM '/Users/trell/Data_Bootcamp/09-SQL/sql-challenge/data/dept_manager.csv'
CSV HEADER;

COPY dept_emp (emp_no, dept_no)
FROM '/Users/trell/Data_Bootcamp/09-SQL/sql-challenge/data/dept_emp.csv'
CSV HEADER;

COPY salaries (emp_no, salary)
FROM '/Users/trell/Data_Bootcamp/09-SQL/sql-challenge/data/salaries.csv'
CSV HEADER;


