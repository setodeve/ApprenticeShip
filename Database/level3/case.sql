select em.emp_no, de.to_date, case when de.to_date = "9999-01-01" then "unemployed" ELSE "employed" end as "employ_status" from employees as em inner join dept_emp as de on em.emp_no = de.emp_no where em.emp_no >= 10100 and em.emp_no <= 10200;
select em.emp_no, em.birth_date, case when em.birth_date Like "195%" then "50s" Else "60s" end from employees as em where em.emp_no >= 10001 and em.emp_no <= 10050;

select max(sa.salary), 
       case when em.birth_date Like "195%" then "50s" Else "60s" end as 年代 
from employees as em
inner join salaries as sa on em.emp_no = sa.emp_no 
where em.emp_no >= 10001 and em.emp_no <= 10050 group by 年代;