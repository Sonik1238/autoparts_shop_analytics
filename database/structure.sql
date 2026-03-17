-- СТВОРЕННЯ ТАБЛИЦЬ 

CREATE TABLE products (
    id NUMBER,
    name VARCHAR2(255),
    category VARCHAR2(100)
);

CREATE TABLE suppliers (
    id NUMBER,
    name VARCHAR2(255),
    country VARCHAR2(100),
    category VARCHAR2(100),
    contract_number VARCHAR2(50)
);

CREATE TABLE supplier_offers (
    id NUMBER,
    product_id NUMBER,
    supplier_id NUMBER,
    unit_price NUMBER(12, 2),
    delivery_days NUMBER,
    start_date DATE,
    end_date DATE
);

CREATE TABLE warehouse (
    id NUMBER,
    product_id NUMBER,
    quantity NUMBER DEFAULT 0,
    cell_number VARCHAR2(20)
);

CREATE TABLE sales (
    id NUMBER,
    product_id NUMBER,
    customer_name VARCHAR2(255),
    quantity NUMBER,
    sale_price NUMBER(12, 2),
    sale_date DATE DEFAULT SYSDATE
);

CREATE TABLE purchase_orders (
    id NUMBER,
    supplier_id NUMBER,
    product_id NUMBER,
    quantity NUMBER,
    total_amount NUMBER(15, 2),
    order_date DATE DEFAULT SYSDATE
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
ALTER TABLE products MODIFY name NOT NULL;
ALTER TABLE warehouse ADD CONSTRAINT unq_warehouse_product UNIQUE (product_id);
ALTER TABLE warehouse MODIFY cell_number NOT NULL;

ALTER TABLE sales MODIFY product_id NOT NULL;
ALTER TABLE warehouse MODIFY product_id NOT NULL;
ALTER TABLE purchase_orders MODIFY supplier_id NOT NULL;
ALTER TABLE purchase_orders MODIFY product_id NOT NULL;
ALTER TABLE supplier_offers MODIFY product_id NOT NULL;
ALTER TABLE supplier_offers MODIFY supplier_id NOT NULL;

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