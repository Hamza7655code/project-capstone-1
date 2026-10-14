CREATE TABLE IF NOT EXISTS employee (
    employee_id INTEGER PRIMARY KEY,
    name TEXT,
    city TEXT,
    salary TEXT
);

INSERT INTO employee (employee_id, name, city, salary)
VALUES
    ('6001', 'Harsh Patel', 'London', '75000'),
    ('6002', 'Sarah Khan', 'London', '38000'),
    ('6003', 'Daniel Smith', 'Manchester', '45000'),
    ('6004', 'Amina Ahmed', 'Birmingham', '32000'),
    ('6005', 'Oliver Jones', 'Leeds', '35000'),
    ('6006', 'Fatima Ali', 'Manchester', '48000');


CREATE TABLE IF NOT EXISTS department (
    department_id TEXT,
    department_name TEXT PRIMARY KEY,
    city TEXT,
    manager_id TEXT
);

INSERT INTO department (department_id, department_name, city, manager_id)
VALUES
    ('D01', 'Management', 'London', '6001'),
    ('D02', 'Finance', 'London', '6002'),
    ('D03', 'IT', 'Manchester', '6003'),
    ('D04', 'HR', 'Birmingham', '6004'),
    ('D05', 'Sales', 'Leeds', '6005'),
    ('D06', 'Research', 'Manchester', '6006');


CREATE TABLE IF NOT EXISTS project (
    project_no TEXT PRIMARY KEY,
    project_cost TEXT,
    start_date TEXT,
    employee_id TEXT,
    department_id TEXT
);

INSERT INTO project (project_no, project_cost, start_date, employee_id, department_id)
VALUES
    ('P1001', '15000', '2026-01-10', '6003', 'D03'),
    ('P1002', '8000', '2026-02-15', '6002', 'D02'),
    ('P1003', '5000', '2026-02-15', '6004', 'D04'),
    ('P1004', '12000', '2026-03-20', '6005', 'D05'),
    ('P1005', '20000', '2026-04-05', '6001', 'D01'),
    ('P1006', '25000', '2026-01-10', '6006', 'D06');


SELECT employee.name, department.department_name, department.city
FROM employee
JOIN department ON employee.city = department.city;

SELECT employee.name, department.department_name
FROM employee
JOIN department ON employee.employee_id = department.manager_id;

SELECT project.project_no, employee.name, project.employee_id, project.department_id
FROM project
JOIN employee ON project.employee_id = employee.employee_id
JOIN department ON project.department_id = department.department_id
WHERE employee.city != department.city;

SELECT project.project_no, employee.name
FROM project
JOIN employee ON project.employee_id = employee.employee_id;

SELECT employee.name AS "Employee", employee.salary AS "Salary"
FROM employee
JOIN project ON employee.employee_id = project.employee_id
WHERE employee.salary IS NOT NULL;

SELECT employee.name AS "Employee",
       employee.city AS "City",
       employee.salary AS "Salary",
       department.department_name AS "Department"
FROM employee
JOIN department ON employee.city = department.city
WHERE CAST(employee.salary AS INTEGER) BETWEEN 35000 AND 75000;

SELECT project.project_no, employee.name, project.project_cost AS "Project Cost"
FROM project
JOIN employee ON project.employee_id = employee.employee_id
JOIN department ON project.department_id = department.department_id
WHERE CAST(project.project_cost AS INTEGER) >= 10000;

SELECT project.project_no, employee.name, project.start_date
FROM project
JOIN employee ON project.employee_id = employee.employee_id
WHERE project.start_date = '2026-01-10';

DROP TABLE project;
DROP TABLE department;
DROP TABLE employee;
