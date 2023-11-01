select * from dept_manager as dm inner join employees as em on dm.emp_no = em.emp_no ;
select dept_no, dm.emp_no, first_name, last_name from dept_manager as dm inner join employees as em on dm.emp_no = em.emp_no ;
select dm.dept_no, de.dept_name, dm.emp_no, first_name, last_name from dept_manager as dm inner join employees as em on dm.emp_no = em.emp_no inner join departments as de on de.dept_no = dm.dept_no ;
select em.emp_no, em.first_name, em.last_name, sa.salary from employees as em inner join salaries as sa on em.emp_no = sa.emp_no where em.emp_no >= 10001 and em.emp_no <= 10010;
