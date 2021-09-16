  
#################### Welcome to EmployeePayRoll Database ####################

#UC1
#(CREATE payroll_service DB)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)

mysql> CREATE DATABASE payroll_Service;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> USE payroll_service;
Database changed
mysql> SELECT DATABASE();
+-----------------+
| DATABASE()      |
+-----------------+
| payroll_service |
+-----------------+
1 row in set (0.00 sec)




#UC2
#(CREATE TABLE in payroll_service DB)

mysql> CREATE TABLE employee_payroll    #Create Table
    -> (
    -> id          INT unsigned NOT NULL AUTO_INCREMENT,   
    -> name        VARCHAR(150) NOT NULL,                  
    -> salary      DOUBLE NOT NULL,                        
    -> start       DATE NOT NULL,                          
    -> PRIMARY KEY (id)                                  
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> DESCRIBE employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)



#UC3
#( INSERT VALUES  to employee_payroll table )

mysql> INSERT INTO employee_payroll ( name, salary, start ) VALUES
    ->  ( 'Bill', 1000000.00, '2018-01-03' ),
    ->  ( 'Terisa', 2000000.00, '2019-11-13' ),
    ->  ( 'Charlie', 3000000.00, '2020-05-21' );
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0



#UC4
#(RETRIVE ALL THE employee_payroll DATA)

mysql> SELECT * FROM employee_payroll;
+----+---------+---------+------------+
| id | name    | salary  | start      |
+----+---------+---------+------------+
|  1 | Bill    | 1000000 | 2018-01-03 |
|  2 | Terisa  | 2000000 | 2019-11-13 |
|  3 | Charlie | 3000000 | 2020-05-21 |
+----+---------+---------+------------+
3 rows in set (0.00 sec)



#UC5
#(Retrive particular data)

mysql> SELECT salary FROM employee_payroll WHERE name = 'Bill';
+---------+
| salary  |
+---------+
| 1000000 |
+---------+
1 row in set (0.00 sec)

mysql> SELECT * FROM employee_payroll
    -> WHERE start BETWEEN CAST('2018-01-01'AS DATE) AND date(NOW());
+----+---------+---------+------------+
| id | name    | salary  | start      |
+----+---------+---------+------------+
|  1 | Bill    | 1000000 | 2018-01-03 |
|  2 | Terisa  | 2000000 | 2019-11-13 |
|  3 | Charlie | 3000000 | 2020-05-21 |
+----+---------+---------+------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM employee_payroll
    -> WHERE start BETWEEN CAST('2019-01-01'AS DATE) AND date(NOW());
+----+---------+---------+------------+
| id | name    | salary  | start      |
+----+---------+---------+------------+
|  2 | Terisa  | 2000000 | 2019-11-13 |
|  3 | Charlie | 3000000 | 2020-05-21 |
+----+---------+---------+------------+
2 rows in set (0.00 sec)



#UC6
#(Altering table)

mysql> ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name;
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| gender | char(1)      | YES  |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
5 rows in set (0.01 sec)

mysql> update employee_payroll set gender = 'F' where name = 'Terisa';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+---------+--------+---------+------------+
| id | name    | gender | salary  | start      |
+----+---------+--------+---------+------------+
|  1 | Bill    | NULL   | 1000000 | 2018-01-03 |
|  2 | Terisa  | F      | 2000000 | 2019-11-13 |
|  3 | Charlie | NULL   | 3000000 | 2020-05-21 |
+----+---------+--------+---------+------------+
3 rows in set (0.00 sec)

mysql> update employee_payroll set gender = 'M' where name = 'Bill' or name = 'Charlie';
Query OK, 2 rows affected (0.00 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+---------+--------+---------+------------+
| id | name    | gender | salary  | start      |
+----+---------+--------+---------+------------+
|  1 | Bill    | M      | 1000000 | 2018-01-03 |
|  2 | Terisa  | F      | 2000000 | 2019-11-13 |
|  3 | Charlie | M      | 3000000 | 2020-05-21 |
+----+---------+--------+---------+------------+
3 rows in set (0.00 sec)

mysql> update employee_payroll set salary = 3000000.00 where name = 'Terisa';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+---------+--------+---------+------------+
| id | name    | gender | salary  | start      |
+----+---------+--------+---------+------------+
|  1 | Bill    | M      | 1000000 | 2018-01-03 |
|  2 | Terisa  | F      | 3000000 | 2019-11-13 |
|  3 | Charlie | M      | 3000000 | 2020-05-21 |
+----+---------+--------+---------+------------+
3 rows in set (0.00 sec)



#UC7
#(SUM AVG MIN MAX COUNT)

mysql> SELECT AVG(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
+-------------+
| AVG(salary) |
+-------------+
|     2000000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(salary) FROM employee_payroll  GROUP BY gender;
+-------------+
| AVG(salary) |
+-------------+
|     2000000 |
|     3000000 |
+-------------+
2 rows in set (0.00 sec)

mysql> SELECT  gender, AVG(salary) FROM employee_payroll  GROUP BY gender;
+--------+-------------+
| gender | AVG(salary) |
+--------+-------------+
| M      |     2000000 |
| F      |     3000000 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT  gender, COUNT(name) FROM employee_payroll  GROUP BY gender;
+--------+-------------+
| gender | COUNT(name) |
+--------+-------------+
| M      |           2 |
| F      |           1 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT  gender, sum(salary) FROM employee_payroll  GROUP BY gender;
+--------+-------------+
| gender | sum(salary) |
+--------+-------------+
| M      |     4000000 |
| F      |     3000000 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT  sum(salary) FROM employee_payroll  GROUP BY gender;
+-------------+
| sum(salary) |
+-------------+
|     4000000 |
|     3000000 |
+-------------+
2 rows in set (0.00 sec)

mysql> SELECT SUM(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
+-------------+
| SUM(salary) |
+-------------+
|     4000000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT SUM(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+
| SUM(salary) |
+-------------+
|     3000000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MIN(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
+-------------+
| MIN(salary) |
+-------------+
|     1000000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MIN(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+
| MIN(salary) |
+-------------+
|     3000000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT  gender, MIN(salary) FROM employee_payroll  GROUP BY gender;
+--------+-------------+
| gender | MIN(salary) |
+--------+-------------+
| M      |     1000000 |
| F      |     3000000 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT MAX(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
+-------------+
| MAX(salary) |
+-------------+
|     3000000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+
| MAX(salary) |
+-------------+
|     3000000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT  gender, MAX(salary) FROM employee_payroll  GROUP BY gender;
+--------+-------------+
| gender | MAX(salary) |
+--------+-------------+
| M      |     3000000 |
| F      |     3000000 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT  gender, COUNT(name) FROM employee_payroll  GROUP BY gender;
+--------+-------------+
| gender | COUNT(name) |
+--------+-------------+
| M      |           2 |
| F      |           1 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT  COUNT(*) FROM employee_payroll  GROUP BY gender;
+----------+
| COUNT(*) |
+----------+
|        2 |
|        1 |
+----------+
2 rows in set (0.00 sec)

mysql> SELECT COUNT(name) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
+-------------+
| COUNT(name) |
+-------------+
|           2 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(name) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+
| COUNT(name) |
+-------------+
|           1 |
+-------------+
1 row in set (0.00 sec)