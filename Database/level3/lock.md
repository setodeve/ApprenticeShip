## 1. 同時実行制御
二つのトランザクションが同時に行われた場合に一方を実行し、一方を待機させる仕組み

## 2. ACID 特性
クエリが全て実行されるか、何も実行されない状態のどちらかに成るように制御する性質

## 3. ロック
二つのトランザクションが同時に行われた場合に一方を実行しそのテーブルをロックし、一方を待機させる仕組み

## 4. ロックの確認
### ターミナル１
```sql
set autocommit=0;

begin;

update salaries AS sa 
inner join employees as em on sa.emp_no = em.emp_no 
set salary = 700000 
where em.emp_no="10001" and sa.from_date = "1986-06-26";

select * from salaries as sa 
inner join employees as em on sa.emp_no = em.emp_no 
where em.emp_no="10001" and sa.from_date = "1986-06-26";

commit;
```
### ターミナル2
```sql
set autocommit=0;

begin;

update salaries AS sa 
inner join employees as em on sa.emp_no = em.emp_no 
set salary = salary*2
where em.emp_no="10001" and sa.from_date = "1986-06-26";

select * from salaries as sa 
inner join employees as em on sa.emp_no = em.emp_no 
where em.emp_no="10001" and sa.from_date = "1986-06-26";

commit;
```