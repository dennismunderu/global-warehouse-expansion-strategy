CREATE DATABASE supply_chain_db;


CREATE TABLE categories
(
    category_id INT PRIMARY KEY,
    category_name TEXT,
    department_name TEXT
);


CREATE TABLE customer_segments
(
    segment_id	INT PRIMARY KEY,
    customer_segments TEXT
);


CREATE TABLE payment_types
(
    payment_id	INT PRIMARY KEY,
    payment_type TEXT
);

CREATE TABLE shipping_mode
(
    shipping_id	INT PRIMARY KEY,
    shipping_mode TEXT
);


CREATE TABLE products
(
    product_id INT PRIMARY KEY,
    product_name TEXT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);


CREATE TABLE customers
(
    customer_id NUMERIC(12,4) PRIMARY KEY,
    customer_city TEXT,
    customer_state TEXT,
    customer_zipcode NUMERIC(12,4),
    customer_country TEXT,
    segment_id INT,
    FOREIGN KEY (segment_id) REFERENCES customer_segments(segment_id)
);


CREATE TABLE orders
(
    order_id NUMERIC(12,4) PRIMARY KEY,
    customer_id NUMERIC(12,4),
    order_date TIMESTAMP,
    shipping_date TIMESTAMP,
    order_status TEXT,
    order_city TEXT,
    order_state	TEXT,
    order_country TEXT,
    market TEXT,
    order_region TEXT,
    payment_id INT,
    shipping_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (payment_id) REFERENCES payment_types(payment_id),
    FOREIGN KEY (shipping_id) REFERENCES shipping_mode(shipping_id)
);


CREATE TABLE order_items
(
    order_id NUMERIC(12,4),
    product_id	INT,
    product_price NUMERIC(10,5),
    quantity INT,
    discount NUMERIC(10,5),
    discount_rate NUMERIC(5,3),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);



COPY categories
FROM 'C:/Users/user/Desktop/LAST_FOLDER/Postgres_files/categories.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY customer_segments
FROM 'C:/Users/user/Desktop/LAST_FOLDER/Postgres_files/customer_segments.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY payment_types
FROM 'C:/Users/user/Desktop/LAST_FOLDER/Postgres_files/payment_types.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY shipping_mode
FROM 'C:/Users/user/Desktop/LAST_FOLDER/Postgres_files/shipping_mode.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY products
FROM 'C:/Users/user/Desktop/LAST_FOLDER/Postgres_files/products.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY customers
FROM 'C:/Users/user/Desktop/LAST_FOLDER/Postgres_files/customers.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY orders
FROM 'C:/Users/user/Desktop/LAST_FOLDER/Postgres_files/orders.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY order_items
FROM 'C:/Users/user/Desktop/LAST_FOLDER/Postgres_files/order_items.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');


-- THE CUSTOMERS TABLE HAS DUPLICATES CAUING ERROR WHEN COPYING

CREATE TABLE customers_staging
(
    customer_id NUMERIC(12,4),
    customer_city TEXT,
    customer_state TEXT,
    customer_zipcode NUMERIC(12,4),
    customer_country TEXT,
    segment_id INT
);

COPY customers_staging
FROM 'C:/Users/user/Desktop/LAST_FOLDER/Postgres_files/customers.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

SELECT customer_id, COUNT(*)
FROM customers_staging
GROUP BY customer_id
HAVING COUNT(*) > 1;

DELETE FROM customers_staging a
USING (
    SELECT customer_id, 
           ctid, 
           row_number() OVER (PARTITION BY customer_id ORDER BY ctid) AS rn
    FROM customers_staging
) b
WHERE a.customer_id = b.customer_id
  AND a.ctid = b.ctid
  AND b.rn > 1;



ALTER TABLE customers_staging
ADD COLUMN new_customer_id SERIAL;


SELECT *
FROM customers_staging;


ALTER TABLE orders
DROP CONSTRAINT orders_customer_id_fkey;

ALTER TABLE customers
DROP CONSTRAINT customers_pkey;

ALTER TABLE customers
ALTER COLUMN customer_id
SET DATA TYPE INT
USING customer_id::INT;

ALTER TABLE customers
ALTER COLUMN customer_zipcode
SET DATA TYPE TEXT
USING customer_zipcode::TEXT;

ALTER TABLE customers
ADD PRIMARY KEY (customer_id);

ALTER TABLE orders
ALTER column customer_id
SET DATA TYPE INT
USING customer_id::INT;

ALTER TABLE orders
ADD CONSTRAINT orders_customer_id_fkey
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);


INSERT INTO customers
(
    customer_id,
    customer_city,
    customer_state,
    customer_zipcode,
    customer_country,
    segment_id
)
SELECT DISTINCT
    new_customer_id,
    customer_city,
    customer_state,
    customer_zipcode,
    customer_country,
    segment_id
FROM customers_staging;

ALTER TABLE order_items
DROP CONSTRAINT order_items_order_id_fkey;

ALTER TABLE orders
DROP CONSTRAINT orders_pkey;

ALTER TABLE order_items
ALTER COLUMN order_id
SET DATA TYPE TEXT
USING order_id::TEXT;

ALTER TABLE orders
ALTER COLUMN order_id
SET DATA TYPE TEXT
USING order_id::TEXT;

ALTER TABLE orders
ADD PRIMARY KEY (order_id);

ALTER TABLE order_items
ADD CONSTRAINT order_items_order_id_fkey
FOREIGN KEY (order_id) REFERENCES orders(order_id);


COPY orders
FROM 'C:/Users/user/Desktop/LAST_FOLDER/Postgres_files/orders.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY order_items
FROM 'C:/Users/user/Desktop/LAST_FOLDER/Postgres_files/order_items.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

SELECT *
FROM orders
LIMIT 100;

