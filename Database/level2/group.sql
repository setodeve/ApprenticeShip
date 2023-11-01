select emp_no, count(salary) from salaries group by emp_no limit 10 ;
select emp_no, min(salary), max(salary) from salaries where emp_no >= 10001 and emp_no <= 10010  group by emp_no ;
select emp_no, from_date, to_date from salaries where emp_no >= 10001 and emp_no <= 10010 ;
select emp_no, max(salary) from salaries group by emp_no having max(salary) >= 140000 ;
select emp_no, min(salary), max(salary) from salaries where emp_no >= 10001 and emp_no <= 10010  group by emp_no having min(salary) <= 40000 ;
select emp_no, from_date, to_date from salaries where emp_no >= 10001 and emp_no <= 10010 and to_date="9999-01-01";