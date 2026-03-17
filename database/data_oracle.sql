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
VALUES (1, 1, 101, 1200.50, 3, TO_DATE('2026-01-01','YYYY-MM-DD'), TO_DATE('2026-12-31','YYYY-MM-DD'));
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (2, 1, 103, 850.00, 1, TO_DATE('2026-02-01','YYYY-MM-DD'), TO_DATE('2026-06-01','YYYY-MM-DD'));
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (3, 2, 102, 350.00, 5, TO_DATE('2026-01-10','YYYY-MM-DD'), TO_DATE('2026-12-31','YYYY-MM-DD'));
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (4, 4, 105, 450.75, 10, TO_DATE('2026-01-01','YYYY-MM-DD'), TO_DATE('2026-12-31','YYYY-MM-DD'));
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (5, 5, 101, 2100.00, 4, TO_DATE('2026-01-01','YYYY-MM-DD'), TO_DATE('2026-12-31','YYYY-MM-DD'));
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (6, 2, 101, 400.00, 2, SYSDATE - 30, SYSDATE + 300);
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (7, 2, 104, 320.00, 1, SYSDATE - 30, SYSDATE + 300);
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (8, 4, 101, 480.00, 3, SYSDATE - 30, SYSDATE + 300);
INSERT INTO supplier_offers (id, product_id, supplier_id, unit_price, delivery_days, start_date, end_date) 
VALUES (9, 7, 105, 3200.00, 7, SYSDATE - 30, SYSDATE + 300);

-- СКЛАД 
INSERT INTO warehouse (id, product_id, quantity, cell_number) VALUES (1, 1, 25, 'A-101');
INSERT INTO warehouse (id, product_id, quantity, cell_number) VALUES (2, 2, 100, 'B-202');
INSERT INTO warehouse (id, product_id, quantity, cell_number) VALUES (3, 3, 10, 'C-303');
INSERT INTO warehouse (id, product_id, quantity, cell_number) VALUES (4, 4, 50, 'A-102');
INSERT INTO warehouse (id, product_id, quantity, cell_number) VALUES (5, 5, 5, 'D-404');
INSERT INTO warehouse (id, product_id, quantity, cell_number) VALUES (6, 7, 15, 'E-505');

-- ПРОДАЖІ 
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (1, 1, 'Іван Іванов', 2, 1500.00, SYSDATE - 10);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (2, 2, 'Олена Коваленко', 1, 450.00, SYSDATE - 5);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (3, 1, 'Дмитро Сидорчук', 4, 1450.00, SYSDATE - 2);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (4, 4, 'АТ Автотранс', 12, 550.00, SYSDATE - 20);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (5, 5, 'Ігор Мельник', 1, 2500.00, SYSDATE - 1);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (6, 2, 'Іван Іванов', 3, 450.00, SYSDATE - 8);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (7, 4, 'Іван Іванов', 1, 600.00, SYSDATE - 4);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (8, 1, 'Олена Коваленко', 2, 1550.00, SYSDATE - 12);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (9, 2, 'АТ Автотранс', 20, 400.00, SYSDATE - 15);
INSERT INTO sales (id, product_id, customer_name, quantity, sale_price, sale_date) 
VALUES (10, 5, 'АТ Автотранс', 5, 2300.00, SYSDATE - 3);

-- ЗАМОВЛЕННЯ МАГАЗИНУ 
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (1, 101, 1, 50, 60025.00, SYSDATE - 30);
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (2, 102, 2, 200, 70000.00, SYSDATE - 25);
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (3, 103, 1, 10, 8500.00, SYSDATE - 15);
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (4, 105, 4, 100, 45075.00, SYSDATE - 40);
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (5, 101, 5, 20, 42000.00, SYSDATE - 5);
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (6, 101, 2, 50, 17500.00, SYSDATE - 18);
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (7, 101, 4, 30, 13500.00, SYSDATE - 10);
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (8, 102, 1, 20, 24000.00, SYSDATE - 12);
INSERT INTO purchase_orders (id, supplier_id, product_id, quantity, total_amount, order_date) 
VALUES (9, 102, 3, 15, 45000.00, SYSDATE - 2);

COMMIT;