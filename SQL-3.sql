____sql-3____

____Q1____

-- insert into tbl_stock values(4,'memory',100,1501.5,5); 
select sum(int_quantity*int_price) as total_cost from tbl_stock;

Result =

 total_cost
------------
   214015.5
(1 row)

____Q2____

select sum(int_quantity) as total_no_products from tbl_stock;

Result =

 total_no_products
-------------------
               177
(1 row)

____Q3____

select upper(vchr_name) as product_name,ceil(int_price) as product_price  from tbl_stock;

Result =

 product_name | product_price
--------------+---------------
 MOUSE        |           502
 KEYBOARD     |           452
 HEADPHONE    |           752
 MEMORY       |          3502
 MODEM        |          1202
 MEMORY       |          1502
(6 rows)


____Q4____

select count(distinct vchr_name) as items from tbl_stock;

Result =

 items
-------
     5
(1 row)

____Q5____

select vchr_name,int_price from tbl_stock where int_price =(select max(int_price) from tbl_stock);

Result =

 vchr_name | int_price
-----------+-----------
 Memory    |    3501.5
(1 row)

____Q6____

input =

-- INSERT INTO tbl_enrollment(int_count,fk_int_class_id) 
-- VALUES(40,1),
-- (15,2),
-- (10,3),
-- (12,4),
-- (60,2),
-- (14,6),
-- (200,7);

select sum(int_count) as total_enrollment from tbl_enrollment;

Result =

 total_enrollment
------------------
              351
(1 row)


____Q7____

-- input = 
-- INSERT INTO tbl_classes(vchr_class_name,fk_int_dept_id) 
-- VALUES('CS100',1),
-- ('CS101',1),
-- ('CS102',1),
-- ('CS103',1),
-- ('CS200',2),
-- ('CS300',3),
-- ('CS400',4);

select count(vchr_class_name) as number_of_classes from tbl_classes;

Result =

 number_of_classes
-------------------
                 7
(1 row)


____Q8____

delete from tbl_stock where fk_int_supplier = 5;

____Q9____

select concat(vchr_name,int_price) as product_price from tbl_stock;

Result =

 product_price
----------------
 Mouse501.5
 Keyboard451.5
 HeadPhone751.5
 Memory3501.5
 modem1201.5
(5 rows)

____Q10____

input

CREATE TABLE Tbl_Student(EnRlNo INT PRIMARY KEY,
Roll_No INT,
Name VARCHAR(25),
City VARCHAR(25),
Mobile BIGINT,
Dob DATE
);

input = 

-- INSERT INTO Tbl_Student(EnRlNo,Roll_No,Name,City,Mobile,Dob)
-- VALUES(11,2,'Akhil','Delhi',98756579,'12-01-1986'),
-- (6,4,'Maya','Bangalore',98734534,'12-01-1987'),
-- (1,8,'Anoop','Bangalore',93456535,'12-01-1990'),
-- (20,1,'Paul','Cochin',96754555,'13-03-1991'),
-- (3,5,'Sandeep','Delhi',84865644,'14-06-1993');

-- CREATE TABLE tbl_grade(roll_no INT,
-- course VARCHAR(20),
-- grade VARCHAR(10),
-- PRIMARY KEY(roll_no,course)
-- );

-- INSERT INTO tbl_grade(roll_no,Course,Grade) 
-- VALUES(2,'C','A'),
-- (2,'java','B'),
-- (1,'C','B'),
-- (1,'java','A'),
-- (4,'php','A'),
-- (4,'java','A'),
-- (4,'C','B'),
-- (8,'java','B'),
-- (5,'php','A'),
-- (5,'java','D');

SELECT 
name,course,grade
 FROM
  Tbl_Student 
  INNER JOIN tbl_grade 
  ON Tbl_Student.roll_no = tbl_grade.roll_no
   where grade = 'A';

Result =

  name   | course | grade
---------+--------+-------
 Akhil   | C      | A
 Maya    | java   | A
 Maya    | php    | A
 Paul    | java   | A
 Sandeep | php    | A


____Q11____

 SELECT
  count(name),grade
   FROM
    Tbl_Student 
   INNER JOIN 
   tbl_grade 
   ON Tbl_Student.roll_no = tbl_grade.roll_no 
   group by grade having grade = 'B';

Result=

 count | grade
-------+-------
     4 | B

____Q12____

SELECT
 max(Tbl_Student.roll_no) as roll_no,name,count(course) as number_of_course 
 FROM (Tbl_Student  INNER JOIN tbl_grade ON Tbl_Student.roll_no = tbl_grade.roll_no) group by name;

Result =

 roll_no |  name   | number_of_course
---------+---------+------------------
       2 | Akhil   |                2
       8 | Anoop   |                1
       1 | Paul    |                2
       5 | Sandeep |                2
       4 | Maya    |                3


____Q13____

SELECT 
name,city,course 
FROM Tbl_Student 
INNER JOIN tbl_grade
 ON Tbl_Student.roll_no = tbl_grade.roll_no 
 where city = 'Bangalore' and course = 'java';

 Result =


 name  |   city    | course
-------+-----------+--------
 Maya  | Bangalore | java
 Anoop | Bangalore | java


 ____Q14____

 SELECT
  name,course 
  FROM Tbl_Student
   INNER JOIN tbl_grade 
   ON Tbl_Student.roll_no = tbl_grade.roll_no where name like 'A%';
 
 Result =

 name  | course
-------+--------
 Akhil | C
 Akhil | java
 Anoop | java

  ____Q15____

 SELECT name, date_part('year',age(dob)) as age FROM Tbl_Student;

   name  | age
---------+-----
 Akhil   |  37
 Maya    |  36
 Anoop   |  33
 Paul    |  31
 Sandeep |  29


 ____Q16____

    select name,to_char(dob, 'DD Mon YYYY') from Tbl_Student;
   
   Result =

   af    |   to_char
---------+-------------
 Akhil   | 12 Jan 1986
 Maya    | 12 Jan 1987
 Anoop   | 12 Jan 1990
 Paul    | 13 Mar 1991
 Sandeep | 14 Jun 1993