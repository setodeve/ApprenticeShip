## 1. トランザクション
１行以上のクエリをひとまとまりの指示として扱うこと
途中で処理が中断しないようにする

## 2. トランザクションの実行
employees データベースに接続してください。次に、トランザクションを実行してください。
```sql
select * from departments;
begin;
insert into departments values("d010","ASI");
commit;
select * from departments;
```

## 3. ロールバック
任意のテーブルにデータを追加してください。検索を実行し、データが追加されていることを確認してください。
次に、ロールバックを実行してください。検索を実行し、データの追加がされていないことを確認してください。
```sql
select * from departments;
set autocommit=0;
begin;
insert into departments values("d011","AREA");
select * from departments;
rollback;
select * from departments;

// 実行結果
mysql> select * from departments;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d010    | ASI                |
| d009    | Customer Service   |
| d005    | Development        |
| d002    | Finance            |
| d003    | Human Resources    |
| d001    | Marketing          |
| d004    | Production         |
| d006    | Quality Management |
| d008    | Research           |
| d007    | Sales              |
+---------+--------------------+
10 rows in set (0.05 sec)

mysql> set autocommit=0;
Query OK, 0 rows affected (0.00 sec)

mysql> begin;
Query OK, 0 rows affected (0.00 sec)

mysql> insert into departments values("d011","AREA");
Query OK, 1 row affected (0.00 sec)

mysql> select * from departments;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d011    | AREA               |
| d010    | ASI                |
| d009    | Customer Service   |
| d005    | Development        |
| d002    | Finance            |
| d003    | Human Resources    |
| d001    | Marketing          |
| d004    | Production         |
| d006    | Quality Management |
| d008    | Research           |
| d007    | Sales              |
+---------+--------------------+
11 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from departments;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d010    | ASI                |
| d009    | Customer Service   |
| d005    | Development        |
| d002    | Finance            |
| d003    | Human Resources    |
| d001    | Marketing          |
| d004    | Production         |
| d006    | Quality Management |
| d008    | Research           |
| d007    | Sales              |
+---------+--------------------+
10 rows in set (0.00 sec)

mysql> 
```
## 4. コミット
トランザクションを実行してください。任意のテーブルにデータを追加してください。検索を実行し、データが追加されていることを確認してください。
次に、コミットを実行してください。検索を実行し、データが追加されていることを確認してください。

```sql

select * from departments;
begin;
insert into departments values("d010","ASI");
commit;
select * from departments;

// 実行結果
mysql> select * from departments;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d009    | Customer Service   |
| d005    | Development        |
| d002    | Finance            |
| d003    | Human Resources    |
| d001    | Marketing          |
| d004    | Production         |
| d006    | Quality Management |
| d008    | Research           |
| d007    | Sales              |
+---------+--------------------+
9 rows in set (0.00 sec)

mysql> begin;
Query OK, 0 rows affected (0.00 sec)

mysql> insert into departments values("d010","ASI");
Query OK, 1 row affected (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from departments;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d010    | ASI                |
| d009    | Customer Service   |
| d005    | Development        |
| d002    | Finance            |
| d003    | Human Resources    |
| d001    | Marketing          |
| d004    | Production         |
| d006    | Quality Management |
| d008    | Research           |
| d007    | Sales              |
+---------+--------------------+
10 rows in set (0.00 sec)


```

