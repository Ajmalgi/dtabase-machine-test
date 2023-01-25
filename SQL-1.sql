____SQL-1____
 
 ____ Q1 ____

CREATE TABLE tbl_stock(pk_int_stock_id  serial primary key,
vchr_name VARCHAR(40),
int_quantity INT,
int_price INT 
);

 select * from tbl_stock;
  \d tbl_stock;

 ____ Q2 ____

ALTER TABLE tbl_stock ALTER COLUMN TO int_price TYPE FLOAT;

 ____ Q3 ____

 CREATE TABLE tbl_supplier(pk_int_supplier_id  serial primary key,
vchr_supplier_name VARCHAR(25)
);

____ Q4 ____

ALTER TABLE tbl_stock ADD COLUMN fk_int_supplier INT;

____ Q5 ____

ALTER TABLE tbl_stock DROP COLUMN fk_int_supplier; 

ALTER TABLE tbl_stock ADD COLUMN fk_int_supplier INT NOT NULL
CONSTRAINT fk_int_supplier REFERENCES tbl_supplier (pk_int_supplier_id)  
ON UPDATE CASCADE ON DELETE CASCADE;

____ Q6 ____

CREATE TABLE tbl_dept(pk_int_dept_id  serial primary key,
vchr_dept_name VARCHAR(25)
);

____ Q7 ____

CREATE TABLE tbl_classes(pk_int_class_id  serial primary key,
vchr_class_name VARCHAR(40),
fk_int_dept_id INT,
FOREIGN KEY (fk_int_dept_id) REFERENCEs tbl_dept(pk_int_dept_id) ON DELETE CASCADE ON UPDATE CASCADE
);

____ Q8 ____

CREATE TABLE tbl_enrollment(pk_int_enrollment_id  serial primary key,
int_count INT,
fk_int_class_id INT,
FOREIGN KEY (fk_int_class_id) REFERENCEs tbl_classes(pk_int_class_id) ON DELETE CASCADE ON UPDATE CASCADE
);

____ Q9 ____

ALTER TABLE tbl_classes ADD CONSTRAINT constraintname UNIQUE (vchr_class_name);

____ Q10 ____

ALTER TABLE tbl_dept ADD COLUMN vchr_dept_description VARCHAR(100);

____ Q11 ____

INSERT INTO tbl_supplier(vchr_supplier_name) VALUES('Logitech'),('Samsung'),('labell'),('LG'),('creative');
 
Result = 

    pk_int_supplier_id | vchr_supplier_name
--------------------+--------------------
                  1 | Logitech
                  2 | Samsung
                  3 | labell
                  4 | LG
                  5 | creative


