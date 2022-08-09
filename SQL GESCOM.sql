CREATE DATABASE GESCOM5;

GO

USE GESCOM5;

CREATE TABLE countries (

cou_id                VARCHAR(2) PRIMARY KEY NOT NULL,
cou_name              VARCHAR(50) NOT NULL
);

CREATE TABLE suppliers ( 

sup_id		          INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
sup_name	          VARCHAR(50) NOT NULL,
sup_address	          VARCHAR(100) NOT NULL,
sup_zipcode	          VARCHAR(10) NOT NULL,
sup_city	          VARCHAR(50) NOT NULL,
sup_contact	          VARCHAR(50) NOT NULL,
sup_phone	          VARCHAR(10) NOT NULL,
sup_mail	          VARCHAR(255) NOT NULL,
sup_cou_id	          VARCHAR(2) NOT NULL,

CONSTRAINT fk_countries_suppliers FOREIGN KEY (sup_cou_id) REFERENCES countries(cou_id)
);

CREATE TABLE categories (

cat_id			INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
cat_libelle		VARCHAR(50) NOT NULL,
-- à revoir
cat_parent_id	INT NULL,

CONSTRAINT fk_categories_categories FOREIGN KEY (cat_parent_id) REFERENCES categories(cat_id)
);

CREATE TABLE products (

pro_id                INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
pro_price             DECIMAL(10,2),
pro_ref               VARCHAR(20),
pro_ean               VARCHAR(13),
pro_stock_phy         INT,
pro_stock_alert       VARCHAR(50),
pro_color             VARCHAR(50),
pro_name              VARCHAR(50),
pro_description       VARCHAR(1000),
pro_publish           SMALLINT,
pro_photo             VARCHAR(255),
pro_add_date          DATETIME,
pro_update_date       DATETIME,

-- à revoir
pro_cat_id            INT NOT NULL,
pro_sup_id            INT NOT NULL,

CONSTRAINT fk_categories_products FOREIGN KEY (pro_cat_id) REFERENCES categories(cat_id),
CONSTRAINT fk_suppliers_products FOREIGN KEY (pro_sup_id) REFERENCES suppliers(sup_id)
);

CREATE TABLE customers (

cus_id                INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
cus_lastname          VARCHAR(50),
cus_firstname         VARCHAR(50),
cus_address           VARCHAR(50),
cus_zipcode           VARCHAR(5),
cus_city              VARCHAR(30),
cus_mail              VARCHAR(255),
cus_phone             VARCHAR(10),
cus_password          VARCHAR(60),
cus_add_date          DATETIME,
cus_update_date       DATETIME,
-- à revoir
cus_cou_id		      VARCHAR(2) NOT NULL,

CONSTRAINT fk_customers_countries FOREIGN KEY (cus_cou_id) REFERENCES countries(cou_id)
);

CREATE TABLE orders (

ord_id                INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
ord_order_date        DATETIME,
ord_payment_date      DATETIME,
ord_ship_date         DATETIME,
ord_reception_date    DATETIME,
ord_status            VARCHAR(50),
-- à revoir
ord_cus_id			  INT NOT NULL,

CONSTRAINT fk_customers_orders FOREIGN KEY (ord_cus_id) REFERENCES customers(cus_id)
);

CREATE TABLE posts (

-- pos_id             INT PRIMARY KEY IDENTITY(1,1) NOT NULL, 
pos_id                INT IDENTITY(1,1) NOT NULL,
pos_libelle           VARCHAR(50),

CONSTRAINT pk_countries PRIMARY KEY (pos_id)
);

CREATE TABLE employees (

emp_id                INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
emp_lname             VARCHAR(50),
emp_fname             VARCHAR(50),
emp_address           VARCHAR(50),
emp_zipcode           VARCHAR(50),
emp_city              VARCHAR(50),
emp_mail              VARCHAR(255),
emp_phone             VARCHAR(10),
emp_salary            INT,
emp_enter_date        DATE,
emp_gender            CHAR(1),
emp_children          SMALLINT,
-- à revoir
emp_superior_id INT NULL,
emp_pos_id INT NOT NULL,

CONSTRAINT fk_employees_employees FOREIGN KEY (emp_superior_id) REFERENCES employees(emp_id),
CONSTRAINT fk_posts_employees FOREIGN KEY (emp_pos_id) REFERENCES posts(pos_id)

);

-- à revoir
CREATE TABLE order_details (

	ode_id			INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	ode_unit_price	DECIMAL(5,2) NOT NULL,
	ode_quantity	INT NOT NULL,
	ode_pro_id		INT NOT NULL,
	ode_ord_id		INT NOT NULL,

	CONSTRAINT fk_products_orderdetails FOREIGN KEY (ode_pro_id) REFERENCES products(pro_id),
	CONSTRAINT fk_order_orderdetails FOREIGN KEY (ode_ord_id) REFERENCES orders(ord_id)
);
