____SQL-2____

____Q1____

INSERT INTO tbl_stock(vchr_name,int_quantity,int_price,fk_int_supplier) 
VALUES('Mouse',10,500,1),
('Keyboard',5,450,3),
('Modrm',10,1200,2),
('Memory',100,1500,5),
('HeadPhone',50,750,4),
('Memory',2,3500,4);

Result =

 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |       500 |               1
               2 | Keyboard  |            5 |       450 |               3
               4 | Memory    |          100 |      1500 |               5
               5 | HeadPhone |           50 |       750 |               4
               6 | Memory    |            2 |      3500 |               4
               3 | modem     |           10 |      1200 |               2
(6 rows)


____Q2____

UPDATE tbl_stock SET int_price = int_price+1.5;

Result = 

 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |     501.5 |               1
               2 | Keyboard  |            5 |     451.5 |               3
               4 | Memory    |          100 |    1501.5 |               5
               5 | HeadPhone |           50 |     751.5 |               4
               6 | Memory    |            2 |    3501.5 |               4
               3 | modem     |           10 |    1201.5 |               2

____Q3____

select * from tbl_stock where int_price > 1000;

Result = 

 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               4 | Memory    |          100 |    1501.5 |               5
               6 | Memory    |            2 |    3501.5 |               4
               3 | modem     |           10 |    1201.5 |               2


____Q4____

SELECT * FROM tbl_stock ORDER BY vchr_name;

Result = 

pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               5 | HeadPhone |           50 |     751.5 |               4
               2 | Keyboard  |            5 |     451.5 |               3
               4 | Memory    |          100 |    1501.5 |               5
               6 | Memory    |            2 |    3501.5 |               4
               3 | modem     |           10 |    1201.5 |               2
               1 | Mouse     |           10 |     501.5 |               1


____Q5____

select * from tbl_stock order by vchr_name limit 3;

Result = 

 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               5 | HeadPhone |           50 |     751.5 |               4
               2 | Keyboard  |            5 |     451.5 |               3
               4 | Memory    |          100 |    1501.5 |               5


____Q6____

select * from tbl_stock order by vchr_name offset (select count(vchr_name) from tbl_stock)-3;

Result =  

 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               6 | Memory    |            2 |    3501.5 |               4
               3 | modem     |           10 |    1201.5 |               2
               1 | Mouse     |           10 |     501.5 |               1


____Q7____

Result = 

select vchr_name,int_quantity,int_price,(int_quantity*int_price) as total_price from tbl_stock;

 vchr_name | int_quantity | int_price | total_price
-----------+--------------+-----------+-------------
 Mouse     |           10 |     501.5 |        5015
 Keyboard  |            5 |     451.5 |      2257.5
 Memory    |          100 |    1501.5 |      150150
 HeadPhone |           50 |     751.5 |       37575
 Memory    |            2 |    3501.5 |        7003
 modem     |           10 |    1201.5 |       12015
(6 rows)

____Q8____

delete from tbl_stock where fk_int_supplier=5;

Result = 

 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |     501.5 |               1
               2 | Keyboard  |            5 |     451.5 |               3
               5 | HeadPhone |           50 |     751.5 |               4
               6 | Memory    |            2 |    3501.5 |               4
               3 | modem     |           10 |    1201.5 |               2


____Q9____

INSERT INTO tbl_dept(vchr_dept_name,vchr_dept_description) 
VALUES('Computer Science','CS'),
('Electronics','EC'),
('Commerce','CC'),
('Arts','AR');


