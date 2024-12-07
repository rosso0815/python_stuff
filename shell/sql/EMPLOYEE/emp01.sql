-- SELECT emp_no, birth_date, first_name, last_name, gender, hire_date FROM employees.employees;

select count(*) from employees;

select   emp.emp_no,  emp.last_name , dep.dept_no 
  from employees emp , dept_emp dep 
  where emp.emp_no = dep.emp_no;
  --   group by emp.emp_no;

-- overview salary 
SELECT 
  e.emp_no , e.first_name, e.last_name , s.salary , s.from_date , s.to_date 
  FROM employees AS e
  INNER JOIN salaries AS s 
  ON e.emp_no = s.emp_no
  order by s.from_date
  limit 10;

