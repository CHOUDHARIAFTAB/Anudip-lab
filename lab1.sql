Enter password: ******
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 8.0.42 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database lab;
Query OK, 1 row affected (0.10 sec)

mysql> use lab;
Database changed

mysql> create table CUSTOMER(customer_id varchar(20)not null primary key,name varchar(20)not null,email varchar(30)not null,address varchar(50)not null,city varchar(20)not null,Phone_no varchar(20)not null,Pin_code varchar(10)not null);
Query OK, 0 rows affected (0.10 sec)

mysql> create table PRODUCT(Product_id varchar(10)not null primary key,Product_name varchar(20)not null,category varchar(20)not null,Sub_category varchar(20)not null,Original_price varchar(10)not null,Selling_price varchar(10)not null,stock varchar(15)not null);
Query OK, 0 rows affected (0.02 sec)

mysql> create table `Order`(Order_id varchar(10)not null primary key,Customer_id varchar(20)not null,Product_id varchar(10)not null,quantity int,total_price varchar(15)not null,Payment_mode varchar(20)not null,Order_date varchar(15)not null,Order_status varchar(15)not null, FOREIGN KEY (Customer_id) REFERENCES CUSTOMER(Customer_id),FOREIGN KEY (Product_id) REFERENCES PRODUCT(Product_id));
Query OK, 0 rows affected (0.08 sec)

mysql> insert into CUSTOMER values('C1','Aftab','aftab@gmail.com','Ashok Nagar','Ulhasnagar','7709538439','421003'),('C2','Virat','virat123@gmail.com','Mamdapur','Neral','8908901801','441002'),('C3','Rohit','rohit264@gmail.com','Nehru Chowk','Kalyan','9898989898','421301'),('C4','Shubhman','prince@gmail.com','Damat','Badlapur','8080808080','341291'),('C5','Shardul','lord@gmail.com','Aman talkies','Andheri','3453452131','341200');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> insert into PRODUCT values('P101','Laptop','Electronics','Computers','500000','450000','10'),('P102','Smartphone','Mobiles','20000','18000','15'),('P103','Bike','Vehicle','Twowheeler','110000','10000','8'),('P104','Almonds','food','Dryfruit','1000','890','10'),('P105','Bookshelf','Furniture','wooden','7000','6500','5');

mysql>  insert into `Order` values('0101','C1','P101',1,'40000','Delivered','2025-07-01','Credit   card'),('0102','C2','P102',2,'37000','Shipped','2025-07-02','COD'),('0103','C3','P103',3,'40000','Delivered','2025-07-03','UPI'),('0104','C4','P104',10,'50000','Delivered','2025-07-04','online'),('0105','C5','P105',3,'60000','Processing','2025-07-05','Debit card');
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from Customer;
+-------------+----------+--------------------+--------------+------------+------------+----------+
| customer_id | name     | email              | address      | city       | Phone_no   | Pin_code |
+-------------+----------+--------------------+--------------+------------+------------+----------+
| C1          | Aftab    | aftab@gmail.com    | Ashok Nagar  | Ulhasnagar | 7709538439 | 421003   |
| C2          | Virat    | virat123@gmail.com | Mamdapur     | Neral      | 8908901801 | 441002   |
| C3          | Rohit    | rohit264@gmail.com | Nehru Chowk  | Kalyan     | 9898989898 | 421301   |
| C4          | Shubhman | prince@gmail.com   | Damat        | Badlapur   | 8080808080 | 341291   |
| C5          | Shardul  | lord@gmail.com     | Aman talkies | Andheri    | 3453452131 | 341200   |
+-------------+----------+--------------------+--------------+------------+------------+----------+
5 rows in set (0.00 sec)

mysql> select * from Product;
+------------+--------------+-------------+--------------+----------------+---------------+-------+
| Product_id | Product_name | category    | Sub_category | Original_price | Selling_price | stock |
+------------+--------------+-------------+--------------+----------------+---------------+-------+
| P101       | Laptop       | Electronics | Computers    | 500000         | 450000        | 10    |
| P102       | Smartphone   | Electronics | Mobiles      | 20000          | 18000         | 15    |
| P103       | Bike         | Vehicle     | Two-wheeler  | 110000         | 100000        | 8     |
| P104       | Almonds      | Food        | Dry-Fruit    | 1000           | 890           | 10    |
| P105       | Bookshelf    | Furniture   | Wooden       | 7000           | 6500          | 5     |
+------------+--------------+-------------+--------------+----------------+---------------+-------+
5 rows in set (0.00 sec)

mysql> select * from `Order`;
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
| Order_id | Customer_id | Product_id | quantity | total_price | Payment_mode | Order_date | Order_status |
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
| 0101     | C1          | P101       |        1 | 40000       | Delivered    | 2025-07-01 | Credit card  |
| 0102     | C2          | P102       |        2 | 37000       | Shipped      | 2025-07-02 | COD          |
| 0103     | C3          | P103       |        3 | 40000       | Delivered    | 2025-07-03 | UPI          |
| 0104     | C4          | P104       |       10 | 50000       | Delivered    | 2025-07-04 | online       |
| 0105     | C5          | P105       |        3 | 60000       | Processing   | 2025-07-05 | Debit card   |
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
5 rows in set (0.00 sec)

mysql> desc `Order`;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| Order_id     | varchar(10) | NO   | PRI | NULL    |       |
| Customer_id  | varchar(20) | NO   | MUL | NULL    |       |
| Product_id   | varchar(10) | NO   | MUL | NULL    |       |
| quantity     | int         | YES  |     | NULL    |       |
| total_price  | varchar(15) | NO   |     | NULL    |       |
| Payment_mode | varchar(20) | NO   |     | NULL    |       |
| Order_date   | varchar(15) | NO   |     | NULL    |       |
| Order_status | varchar(15) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
8 rows in set (0.01 sec)