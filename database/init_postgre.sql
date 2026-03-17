-- СТВОРЕННЯ ТАБЛИЦЬ 

CREATE TABLE products (
    id INTEGER,
    name VARCHAR(255),
    category VARCHAR(100)
);

CREATE TABLE suppliers (
    id INTEGER,
    name VARCHAR(255),
    country VARCHAR(100),
    category VARCHAR(100),
    contract_number VARCHAR(50)
);

CREATE TABLE supplier_offers (
    id INTEGER,
    product_id INTEGER,
    supplier_id INTEGER,
    unit_price NUMERIC(12, 2),
    delivery_days INTEGER,
    start_date DATE,
    end_date DATE
);

CREATE TABLE warehouse (
    id INTEGER,
    product_id INTEGER,
    quantity INTEGER DEFAULT 0,
    cell_number VARCHAR(20)
);

CREATE TABLE sales (
    id INTEGER,
    product_id INTEGER,
    customer_name VARCHAR(255),
    quantity INTEGER,
    sale_price NUMERIC(12, 2),
    sale_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE purchase_orders (
    id INTEGER,
    supplier_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    total_amount NUMERIC(15, 2),
    order_date DATE DEFAULT CURRENT_DATE
);

-- ДОДАВАННЯ КОНСТРЕЙНТІВ 

-- Primary Keys
ALTER TABLE products ADD CONSTRAINT pk_products PRIMARY KEY (id);
ALTER TABLE suppliers ADD CONSTRAINT pk_suppliers PRIMARY KEY (id);
ALTER TABLE supplier_offers ADD CONSTRAINT pk_supplier_offers PRIMARY KEY (id);
ALTER TABLE warehouse ADD CONSTRAINT pk_warehouse PRIMARY KEY (id);
ALTER TABLE sales ADD CONSTRAINT pk_sales PRIMARY KEY (id);
ALTER TABLE purchase_orders ADD CONSTRAINT pk_purchase_orders PRIMARY KEY (id);

-- NOT NULL & UNIQUE
ALTER TABLE products ALTER COLUMN name SET NOT NULL;
ALTER TABLE warehouse ADD CONSTRAINT unq_warehouse_product UNIQUE (product_id);
ALTER TABLE warehouse ALTER COLUMN cell_number SET NOT NULL;

ALTER TABLE sales ALTER COLUMN product_id SET NOT NULL;
ALTER TABLE warehouse ALTER COLUMN product_id SET NOT NULL;
ALTER TABLE purchase_orders ALTER COLUMN supplier_id SET NOT NULL;
ALTER TABLE purchase_orders ALTER COLUMN product_id SET NOT NULL;
ALTER TABLE supplier_offers ALTER COLUMN product_id SET NOT NULL;
ALTER TABLE supplier_offers ALTER COLUMN supplier_id SET NOT NULL;

-- Foreign Keys
ALTER TABLE supplier_offers ADD CONSTRAINT fk_off_product FOREIGN KEY (product_id) REFERENCES products(id);
ALTER TABLE supplier_offers ADD CONSTRAINT fk_off_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(id);

ALTER TABLE warehouse ADD CONSTRAINT fk_war_product FOREIGN KEY (product_id) REFERENCES products(id);

ALTER TABLE sales ADD CONSTRAINT fk_sal_product FOREIGN KEY (product_id) REFERENCES products(id);

ALTER TABLE purchase_orders ADD CONSTRAINT fk_pur_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(id);
ALTER TABLE purchase_orders ADD CONSTRAINT fk_pur_product FOREIGN KEY (product_id) REFERENCES products(id);

-- Логічні перевірки 
ALTER TABLE suppliers ADD CONSTRAINT chk_supplier_cat 
    CHECK (category IN ('Фірма', 'Дилер', 'Виробництво', 'Дрібний постачальник', 'Магазин'));

ALTER TABLE supplier_offers ADD CONSTRAINT chk_price_pos CHECK (unit_price > 0);
ALTER TABLE sales ADD CONSTRAINT chk_sale_qty CHECK (quantity > 0);

-- КОМЕНТАРІ 
COMMENT ON TABLE supplier_offers IS 'Прайс-лист постачальників для аналізу цін';
COMMENT ON COLUMN products.name IS 'Назва запчастини';
COMMENT ON COLUMN suppliers.contract_number IS 'Тільки для фірм/дилерів (null для дрібних)';
COMMENT ON COLUMN warehouse.cell_number IS 'Номер комірки на складі';
COMMENT ON COLUMN sales.customer_name IS 'ПІБ Покупця';


-- ТОВАРИ 
INSERT INTO products (id, name, category) VALUES (1, 'Гальмівні колодки передні', 'Гальмівна система');
INSERT INTO products (id, name, category) VALUES (2, 'Фільтр масляний', 'Розхідники');
INSERT INTO products (id, name, category) VALUES (3, 'Амортизатор задній', 'Підвіска');
INSERT INTO products (id, name, category) VALUES (4, 'Свічка запалювання', 'Електроніка');
INSERT INTO products (id, name, category) VALUES (5, 'Ремінь ГРМ', 'Двигун');
INSERT INTO products (id, name, category) VALUES (6, 'Радіатор охолодження', 'Охолодження');
INSERT INTO products (id, name, category) VALUES (7, 'Акумулятор 60Ah', 'Електроніка');

-- ПОСТАЧАЛЬНИКИ 
INSERT INTO suppliers (id, name, country, category, contract_number) VALUES (101, 'Bosch GmbH', 'Німеччина', 'Фірма', 'CNT-2024-001');
INSERT INTO suppliers (id, name, country, category, contract_number) VALUES (102, 'Inter Cars', 'Польща', 'Дилер', 'DLR-PL-99');
INSERT INTO suppliers (id, name, country, category, contract_number) VALUES (103, 'Майстерня Петренка', 'Україна', 'Виробництво', NULL);
INSERT INTO suppliers (id, name, country, category, contract_number) VALUES (104, 'AutoParts Store', 'Литва', 'Магазин', NULL);
INSERT INTO suppliers (id, name, country, category, contract_number) VALUES (105, 'Denso Corp', 'Японія', 'Фірма', 'CNT-JP-505');

-- ПРОПОЗИЦІЇ ПОСТАЧАЛЬНИКІВ 
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (1, 1, 101, 1200.50, 3, DATE '2026-01-01', DATE '2026-12-31');
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (2, 1, 103, 850.00, 1, DATE '2026-02-01', DATE '2026-06-01');
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (3, 2, 102, 350.00, 5, DATE '2026-01-10', DATE '2026-12-31');
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (4, 4, 105, 450.75, 10, DATE '2026-01-01', DATE '2026-12-31');
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (5, 5, 101, 2100.00, 4, DATE '2026-01-01', DATE '2026-12-31');
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (6, 2, 101, 400.00, 2, CURRENT_DATE - 30, CURRENT_DATE + 300);
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (7, 2, 104, 320.00, 1, CURRENT_DATE - 30, CURRENT_DATE + 300);
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (8, 4, 101, 480.00, 3, CURRENT_DATE - 30, CURRENT_DATE + 300);
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (9, 7, 105, 3200.00, 7, CURRENT_DATE - 30, CURRENT_DATE + 300);

-- СКЛАД 
INSERT INTO warehouse (id, product_id, quantity, cell_number) VALUES (1, 1, 25, 'A-101');
INSERT INTO warehouse (id, product_id, quantity, cell_number) VALUES (2, 2, 100, 'B-202');
INSERT INTO warehouse (id, product_id, quantity, cell_number) VALUES (3, 3, 10, 'C-303');
INSERT INTO warehouse (id, product_id, quantity, cell_number) VALUES (4, 4, 50, 'A-102');
INSERT INTO warehouse (id, product_id, quantity, cell_number) VALUES (5, 5, 5, 'D-404');
INSERT INTO warehouse (id, product_id, quantity, cell_number) VALUES (6, 7, 15, 'E-505');

-- ПРОДАЖІ 
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (1, 1, 'Іван Іванов', 2, 1500.00, CURRENT_DATE - 10);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (2, 2, 'Олена Коваленко', 1, 450.00, CURRENT_DATE - 5);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (3, 1, 'Дмитро Сидорчук', 4, 1450.00, CURRENT_DATE - 2);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (4, 4, 'АТ Автотранс', 12, 550.00, CURRENT_DATE - 20);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (5, 5, 'Ігор Мельник', 1, 2500.00, CURRENT_DATE - 1);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (6, 2, 'Іван Іванов', 3, 450.00, CURRENT_DATE - 8);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (7, 4, 'Іван Іванов', 1, 600.00, CURRENT_DATE - 4);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (8, 1, 'Олена Коваленко', 2, 1550.00, CURRENT_DATE - 12);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (9, 2, 'АТ Автотранс', 20, 400.00, CURRENT_DATE - 15);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (10, 5, 'АТ Автотранс', 5, 2300.00, CURRENT_DATE - 3);

-- ЗАМОВЛЕННЯ МАГАЗИНУ 
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (1, 101, 1, 50, 60025.00, CURRENT_DATE - 30);
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (2, 102, 2, 200, 70000.00, CURRENT_DATE - 25);
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (3, 103, 1, 10, 8500.00, CURRENT_DATE - 15);
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (4, 105, 4, 100, 45075.00, CURRENT_DATE - 40);
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (5, 101, 5, 20, 42000.00, CURRENT_DATE - 5);
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (6, 101, 2, 50, 17500.00, CURRENT_DATE - 18);
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (7, 101, 4, 30, 13500.00, CURRENT_DATE - 10);
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (8, 102, 1, 20, 24000.00, CURRENT_DATE - 12);
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (9, 102, 3, 15, 45000.00, CURRENT_DATE - 2);

COMMIT;