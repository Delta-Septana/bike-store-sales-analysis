USE bike_store;

-- 1. Product Shemas

-- 1.1 products to categories
ALTER TABLE products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (category_id) REFERENCES categories (category_id);

-- 1.2 products to brands
ALTER TABLE products
ADD CONSTRAINT fk_products_brands
FOREIGN KEY (brand_id) REFERENCES brands (brand_id);

-- 1.3 stocks to products
ALTER TABLE stocks
ADD CONSTRAINT fk_stocks_products
FOREIGN KEY (product_id) REFERENCES products (product_id);


-- 2. Sales Schemas

-- 2.1 orders to customers
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id) REFERENCES customers (customer_id);

-- 2.2 orders to stores
ALTER TABLE orders
ADD CONSTRAINT fk_orders_stores
FOREIGN KEY (store_id) REFERENCES stores (store_id);

-- 2.3 orders to staffs
ALTER TABLE orders
ADD CONSTRAINT fk_orders_staffs
FOREIGN KEY (staff_id) REFERENCES staffs (staff_id);

-- 2.4 staffs to stores
ALTER TABLE staffs
ADD CONSTRAINT fk_staffs_stores
FOREIGN KEY (store_id) REFERENCES stores (store_id);

-- 2.5 staffs to manager
CREATE INDEX idx_manager_id ON staffs(manager_id);

ALTER TABLE staffs
ADD CONSTRAINT fk_staffs_manager
FOREIGN KEY (manager_id) REFERENCES staffs (staff_id);

-- 2.6 order_items to orders
ALTER TABLE order_items
ADD CONSTRAINT fk_orderitems_orders
FOREIGN KEY (order_id) REFERENCES orders (order_id);


-- 3. Sales-Production Schemas

-- 3.1 order_items to products
ALTER TABLE order_items
ADD CONSTRAINT fk_orderitems_products
FOREIGN KEY (product_id) REFERENCES products (product_id);

-- 3.2 stocks to stores
ALTER TABLE stocks
ADD CONSTRAINT fk_stocks_stores
FOREIGN KEY (store_id) REFERENCES stores (store_id);


-- 4. Additional Constraints

-- 4.1 stocks
ALTER TABLE stocks
ADD CONSTRAINT check_stock_positive CHECK (quantity >= 0);

-- 4.2 list_price and discount
ALTER TABLE products
ADD CONSTRAINT check_product_price CHECK (list_price > 0);

ALTER TABLE order_items
ADD CONSTRAINT check_item_price CHECK (list_price > 0);

ALTER TABLE order_items
ADD CONSTRAINT check_discount_range CHECK (discount >= 0 AND discount <= 1);

-- 4.3 date
ALTER TABLE orders
ADD CONSTRAINT check_order_timeline CHECK (shipped_date >= order_date OR shipped_date IS NULL);