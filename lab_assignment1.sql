/*
Lab 1: Use the Student management system Database and table from our previous lab and write a sql query to achieve the below scenario. 

 Assume you are managing a university database that tracks student enrollments in various courses. You have two tables, "Student" and "Enrollment". The goal is to retrieve information about each student's ID, first name, last name, and their enrollment details, including the enrollment ID and the associated course ID. 
*/

Enter password: ******
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18
Server version: 8.0.42 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use lab;
Database changed
mysql> insert into Student values('S101','Aftab','Choudhari','7709538439'),('S102','Chaitali','Khawale','8976642301'),('S103','Nilesh','Vishwakarma','7972948219'),('S104','Arsalan','Ansari','8089051915'),('S105','Hammad','Bubere','9090906621');
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from Student;
+---------+------------+-------------+------------+
| Stud_id | first_name | last_name   | mobile_no  |
+---------+------------+-------------+------------+
| S101    | Aftab      | Choudhari   | 7709538439 |
| S102    | Chaitali   | Khawale     | 8976642301 |
| S103    | Nilesh     | Vishwakarma | 7972948219 |
| S104    | Arsalan    | Ansari      | 8089051915 |
| S105    | Hammad     | Bubere      | 9090906621 |
+---------+------------+-------------+------------+
5 rows in set (0.00 sec)

mysql> desc Student;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| Stud_id    | varchar(15) | NO   | PRI | NULL    |       |
| first_name | varchar(20) | NO   |     | NULL    |       |
| last_name  | varchar(20) | NO   |     | NULL    |       |
| mobile_no  | varchar(15) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> create table enrollment(enrol_id varchar(10)not null primary key,Stud_id varchar(15)not null,Course_id varchar(20)not null,course_name varchar(15)not null,FOREIGN KEY(Stud_id) REFERENCES Student(Stud_id));
Query OK, 0 rows affected (0.06 sec)

mysql> desc enrollment;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| enrol_id    | varchar(10) | NO   | PRI | NULL    |       |
| Stud_id     | varchar(15) | NO   | MUL | NULL    |       |
| Course_id   | varchar(20) | NO   |     | NULL    |       |
| course_name | varchar(15) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into enrollment values('E101','S101','C101','CSE'),('E102','S102','C102','AI'),('E103','S103','C103','ML'),('E104','S104','C104','SE'),('E105','S105','C105','EM');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select *from enrollment;
+----------+---------+-----------+-------------+
| enrol_id | Stud_id | Course_id | course_name |
+----------+---------+-----------+-------------+
| E101     | S101    | C101      | CSE         |
| E102     | S102    | C102      | AI          |
| E103     | S103    | C103      | ML          |
| E104     | S104    | C104      | SE          |
| E105     | S105    | C105      | EM          |
+----------+---------+-----------+-------------+
5 rows in set (0.00 sec)

mysql> select S.Stud_id,S.first_name,S.last_name,S.mobile_no,e.enrol_id,e.Stud_id,e.Course_id,e.course_name from Student S join enrollment e on S.Stud_id = e.Stud_id;
+---------+------------+-------------+------------+----------+---------+-----------+-------------+
| Stud_id | first_name | last_name   | mobile_no  | enrol_id | Stud_id | Course_id | course_name |
+---------+------------+-------------+------------+----------+---------+-----------+-------------+
| S101    | Aftab      | Choudhari   | 7709538439 | E101     | S101    | C101      | CSE         |
| S102    | Chaitali   | Khawale     | 8976642301 | E102     | S102    | C102      | AI          |
| S103    | Nilesh     | Vishwakarma | 7972948219 | E103     | S103    | C103      | ML          |
| S104    | Arsalan    | Ansari      | 8089051915 | E104     | S104    | C104      | SE          |
| S105    | Hammad     | Bubere      | 9090906621 | E105     | S105    | C105      | EM          |
+---------+------------+-------------+------------+----------+---------+-----------+-------------+
5 rows in set (0.00 sec)

mysql>