USE bike_store;

-- 1. Sales Analysis
CREATE OR REPLACE VIEW v_sales_analysis AS
SELECT
	o.order_id,
    o.order_date,
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    p.product_name,
    cat.category_name,
    b.brand_name,
    oi.quantity,
    oi.list_price,
    oi.discount,
    (oi.quantity * oi.list_price * (1 - oi.discount)) AS total_revenue
    FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
JOIN brands b ON p.brand_id = b.brand_id
JOIN customers c ON o.customer_id = c.customer_id;

SELECT * FROM v_sales_analysis LIMIT 10;
    
-- 2. Inventory
CREATE OR REPLACE VIEW v_inventory_status AS
SELECT
	s.store_name,
    p.product_name,
    cat.category_name,
    b.brand_name,
    st.quantity AS stock_level
FROM stocks st
JOIN products p ON st.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
JOIN brands b ON p.brand_id = b.brand_id
JOIN stores s ON st.store_id = s.store_id;

SELECT * FROM v_inventory_status LIMIT 10;

-- 3. Staff Performance
CREATE OR REPLACE VIEW v_staff_performance AS
SELECT
	stf.staff_id,
    CONCAT(stf.first_name, ' ', stf.last_name) AS staff_name,
    s.store_name,
    COUNT(o.order_id) AS total_orders_handled
FROM staffs stf
JOIN stores s ON stf.store_id = s.store_id
LEFT JOIN orders o ON stf.staff_id = o.staff_id
GROUP BY stf.staff_id, stf.first_name, stf.last_name, s.store_name;

SELECT * FROM v_staff_performance LIMIT 10;
    
    
    