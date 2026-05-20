USE bike_store;

-- Data Cleaning

-- 1. Brands Table

-- 1.1 Preview Data
SELECT * FROM brands LIMIT 10;

-- 1.2 Check Table Structure
DESCRIBE brands;

-- 1.3 Count Total Rows
SELECT COUNT(*) FROM brands;

-- 1.4 Check Null Values
SELECT
	COUNT(*) AS total_rows,
    SUM(CASE WHEN brand_id IS NULL THEN 1 ELSE 0 END) AS brand_id_null,
    SUM(CASE WHEN brand_name IS NULL THEN 1 ELSE 0 END) AS brand_name_null
FROM brands;

-- 1.5 Check Duplicated on _id
SELECT brand_id, COUNT(*) AS duplicate_count
FROM brands 
GROUP BY brand_id
HAVING COUNT(*)>1;

-- 1.6 Data Cleaning (formatting)
ALTER TABLE brands
MODIFY brand_id INT NOT NULL,
MODIFY brand_name varchar(100);

-- 1.7 Add Primary Key
ALTER TABLE brands
ADD primary key (brand_id);

-- 1.8 Final check
DESCRIBE brands;
SELECT * FROM brands;

-- 2. categories Table

-- 2.1 Preview Data
SELECT * FROM categories LIMIT 10;

-- 2.2 Check Table Structure
DESCRIBE categories;

-- 2.3 Count Total Rows
SELECT COUNT(*) FROM categories;

-- 2.4 Check Null Values
SELECT
	COUNT(*) AS total_rows,
    SUM(CASE WHEN category_id IS NULL THEN 1 ELSE 0 END) AS category_id_null,
    SUM(CASE WHEN category_name IS NULL THEN 1 ELSE 0 END) AS category_name_null
FROM categories;

-- 2.5 Check Duplicated on _id
SELECT category_id, COUNT(*) AS duplicate_count
FROM categories 
GROUP BY category_id
HAVING COUNT(*)>1;

-- 2.6 Data Cleaning (formatting)
ALTER TABLE categories
MODIFY category_id INT NOT NULL,
MODIFY category_name varchar(100);

-- 2.7 Add Primary Key
ALTER TABLE categories
ADD primary key (category_id);

-- 2.8 Final check
DESCRIBE categories;
SELECT * FROM categories;

-- 3. customers Table

-- 3.1 Preview Data
SELECT * FROM customers LIMIT 10;

-- 3.2 Check Table Structure
DESCRIBE customers;

-- 3.3 Count Total Rows
SELECT COUNT(*) FROM customers;

-- 3.4 Check Null Values
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
    SUM(CASE WHEN first_name IS NULL THEN 1 ELSE 0 END) AS null_first_name,
    SUM(CASE WHEN last_name IS NULL THEN 1 ELSE 0 END) AS null_last_name,
    SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS null_phone,
    SUM(CASE WHEN email IS NULL THEN 1 ELSE 0 END) AS null_email,
    SUM(CASE WHEN street IS NULL THEN 1 ELSE 0 END) AS null_street,
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS null_city,
    SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS null_state,
    SUM(CASE WHEN zip_code IS NULL THEN 1 ELSE 0 END) AS null_zip_code
FROM customers;

-- 3.5 Check Duplicated on _id
SELECT customer_id, COUNT(*) AS duplicate_count
FROM customers 
GROUP BY customer_id
HAVING COUNT(*)>1;

-- 3.6 Check Anomaly in Email Format
SELECT *
FROM customers
WHERE email NOT LIKE '%@%';

-- 3.7 Data Cleaning (formatting)
ALTER TABLE customers
MODIFY COLUMN customer_id INT NOT NULL,
MODIFY COLUMN first_name VARCHAR(50),
MODIFY COLUMN last_name VARCHAR(50),
MODIFY COLUMN phone VARCHAR(50),
MODIFY COLUMN email VARCHAR(100),
MODIFY COLUMN street VARCHAR(100),
MODIFY COLUMN city VARCHAR(50),
MODIFY COLUMN state VARCHAR(10),
MODIFY COLUMN zip_code VARCHAR(20);

-- 3.8 Add Primary Key
ALTER TABLE customers
ADD primary key (customer_id);

-- 3.9 Final check
DESCRIBE customers;
SELECT * FROM customers;

-- 4. order_items Table

-- 4.1 Preview Data
SELECT * FROM order_items LIMIT 10;

-- 4.2 Check Table Structure
DESCRIBE order_items;

-- 4.3 Count Total Rows
SELECT COUNT(*) FROM order_items;

-- 4.4 Check Null Values
SELECT
	COUNT(*) AS total_rows,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS order_id_null,
    SUM(CASE WHEN item_id IS NULL THEN 1 ELSE 0 END) AS item_id_null,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS product_id_null,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS quantity_null,
    SUM(CASE WHEN list_price IS NULL THEN 1 ELSE 0 END) AS list_price_null,
    SUM(CASE WHEN discount IS NULL THEN 1 ELSE 0 END) AS discount_null
FROM order_items;

-- 4.5 Check Duplicated on _id
SELECT order_id, item_id, COUNT(*) AS duplicate_count
FROM order_items 
GROUP BY order_id, item_id
HAVING COUNT(*)>1;

-- 4.6 Data Cleaning (formatting)
ALTER TABLE order_items
MODIFY COLUMN order_id INT NOT NULL,
MODIFY COLUMN item_id INT NOT NULL,
MODIFY COLUMN product_id INT NOT NULL,
MODIFY COLUMN quantity INT NOT NULL,
MODIFY COLUMN list_price DECIMAL(10,2) NOT NULL,
MODIFY COLUMN discount DECIMAL(5,2) NOT NULL;

-- 4.7 Add Primary Key
ALTER TABLE order_items
ADD primary key (order_id, item_id);

-- 4.8 Final check
DESCRIBE order_items;
SELECT * FROM order_items;

-- 5. products Table

-- 5.1 Preview Data
SELECT * FROM products LIMIT 10;

-- 5.2 Check Table Structure
DESCRIBE products;

-- 5.3 Count Total Rows
SELECT COUNT(*) FROM products;

-- 5.4 Check Null Values
SELECT
	COUNT(*) AS total_rows,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS product_id_null,
    SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS product_name_null,
    SUM(CASE WHEN brand_id IS NULL THEN 1 ELSE 0 END) AS brand_id_null,
    SUM(CASE WHEN category_id IS NULL THEN 1 ELSE 0 END) AS category_null,
    SUM(CASE WHEN model_year IS NULL THEN 1 ELSE 0 END) AS model_year_null,
    SUM(CASE WHEN list_price IS NULL THEN 1 ELSE 0 END) AS list_price_null
FROM products;

-- 5.5 Check Duplicated on _id
SELECT product_id, COUNT(*) AS duplicate_count
FROM products 
GROUP BY product_id
HAVING COUNT(*)>1;

-- 5.6 Data Cleaning (formatting)
ALTER TABLE products
MODIFY COLUMN product_id INT NOT NULL,
MODIFY COLUMN product_name VARCHAR(255),
MODIFY COLUMN brand_id INT NOT NULL,
MODIFY COLUMN category_id INT NOT NULL,
MODIFY COLUMN model_year INT,
MODIFY COLUMN list_price DECIMAL(10,2);

-- 5.7 Add Primary Key
ALTER TABLE products
ADD primary key (product_id);

-- 5.8 Final check
DESCRIBE products;
SELECT * FROM products;

-- 6. staffs Table

-- 6.1 Preview Data
SELECT * FROM staffs LIMIT 10;

-- 6.2 Check Table Structure
DESCRIBE staffs;

-- 6.3 Count Total Rows
SELECT COUNT(*) FROM staffs;

-- 6.4 Check Null Values
SELECT
	COUNT(*) AS total_rows,
    SUM(CASE WHEN staff_id IS NULL THEN 1 ELSE 0 END) AS staff_id_null,
    SUM(CASE WHEN first_name IS NULL THEN 1 ELSE 0 END) AS first_name_null,
    SUM(CASE WHEN last_name IS NULL THEN 1 ELSE 0 END) AS last_name_null,
    SUM(CASE WHEN email IS NULL THEN 1 ELSE 0 END) AS email_null,
    SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS phone_null,
    SUM(CASE WHEN active IS NULL THEN 1 ELSE 0 END) AS active_null,
    SUM(CASE WHEN store_id IS NULL THEN 1 ELSE 0 END) AS store_id_null,
    SUM(CASE WHEN manager_id IS NULL THEN 1 ELSE 0 END) AS manager_id_null
FROM staffs;

-- 6.5 Check Duplicated on _id and email
SELECT staff_id, COUNT(*) AS duplicate_count
FROM staffs 
GROUP BY staff_id
HAVING COUNT(*)>1;

-- 6.6 Data Cleaning (formatting)
ALTER TABLE staffs
MODIFY COLUMN staff_id INT NOT NULL,
MODIFY COLUMN first_name VARCHAR(50),
MODIFY COLUMN last_name VARCHAR(50),
MODIFY COLUMN email VARCHAR(100),
MODIFY COLUMN phone VARCHAR(50),
MODIFY COLUMN active TINYINT(1),
MODIFY COLUMN store_id INT NOT NULL,
MODIFY COLUMN manager_id INT;

-- 6.7 Add Primary Key
ALTER TABLE staffs
ADD primary key (staff_id);

-- 6.8 Final check
DESCRIBE staffs;
SELECT * FROM staffs;

-- 7. stocks Table

-- 7.1 Preview Data
SELECT * FROM stocks LIMIT 10;

-- 7.2 Check Table Structure
DESCRIBE stocks;

-- 7.3 Count Total Rows
SELECT COUNT(*) FROM stocks;

-- 7.4 Check Null Values
SELECT
	COUNT(*) AS total_rows,
    SUM(CASE WHEN store_id IS NULL THEN 1 ELSE 0 END) AS store_id_null,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS product_id_null,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS quantity_null
FROM stocks;

-- 7.5 Check Duplicated on _id and email
SELECT store_id, product_id, COUNT(*) AS duplicate_count
FROM stocks 
GROUP BY store_id, product_id
HAVING COUNT(*)>1;

-- 7.6 Data Cleaning (formatting)
ALTER TABLE stocks
MODIFY COLUMN store_id INT NOT NULL,
MODIFY COLUMN product_id INT NOT NULL,
MODIFY COLUMN quantity INT NOT NULL;

-- 7.7 Add Primary Key
ALTER TABLE stocks
ADD primary key (store_id, product_id);

-- 7.8 Final check
DESCRIBE stocks;
SELECT * FROM stocks;

-- 8. stores Table

-- 8.1 Preview Data
SELECT * FROM stores LIMIT 10;

-- 8.2 Check Table Structure
DESCRIBE stores;

-- 8.3 Count Total Rows
SELECT COUNT(*) FROM stores;

-- 8.4 Data Cleaning (formatting)
ALTER TABLE stores
MODIFY COLUMN store_id INT NOT NULL,
MODIFY COLUMN store_name VARCHAR(100),
MODIFY COLUMN phone VARCHAR(50),
MODIFY COLUMN email VARCHAR(100),
MODIFY COLUMN street VARCHAR(100),
MODIFY COLUMN city VARCHAR(50),
MODIFY COLUMN state VARCHAR(10),
MODIFY COLUMN zip_code VARCHAR(20);

-- 8.5 Add Primary Key
ALTER TABLE stores
ADD primary key (store_id);

-- 8.6 Final check
DESCRIBE stores;
SELECT * FROM stores;

-- 9. Orders Table

-- 9.1 Preview Data
SELECT * FROM orders LIMIT 10;

-- 9.2 Check Table Structure
DESCRIBE orders; 

-- 9.3 Count Total Rows
SELECT COUNT(*) FROM orders;

-- 9.4 Check Null Values
SELECT
	COUNT(*) AS total_rows,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS order_id_null,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS customer_id_null,
    SUM(CASE WHEN order_status IS NULL THEN 1 ELSE 0 END) AS order_status_null,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS order_date_null,
    SUM(CASE WHEN required_date IS NULL THEN 1 ELSE 0 END) AS required_date_null,
    SUM(CASE WHEN shipped_date IS NULL THEN 1 ELSE 0 END) AS shipped_date_null,
    SUM(CASE WHEN store_id IS NULL THEN 1 ELSE 0 END) AS store_id_null,
    SUM(CASE WHEN staff_id IS NULL THEN 1 ELSE 0 END) AS staff_id_null
FROM orders;

-- 9.5 Check Duplicated on _id
SELECT order_id, COUNT(*) AS duplicate_count
FROM orders 
GROUP BY order_id
HAVING COUNT(*)>1;

-- 9.6 Data Cleaning (formatting)
ALTER TABLE orders
MODIFY COLUMN order_id INT NOT NULL,
MODIFY COLUMN customer_id INT NOT NULL,
MODIFY COLUMN order_status INT,
MODIFY COLUMN order_date DATE NOT NULL,
MODIFY COLUMN required_date DATE,
MODIFY COLUMN shipped_date DATE,
MODIFY COLUMN store_id INT NOT NULL,
MODIFY COLUMN staff_id INT NOT NULL;

-- 8.5 Add Primary Key
ALTER TABLE orders
ADD primary key (order_id);

-- 8.6 Final check
DESCRIBE orders;
SELECT * FROM orders;