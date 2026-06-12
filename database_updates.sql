-- WMS catalog and order lifecycle database update.
-- Run this on the backend SQL database. Existing products are not modified.

ALTER TABLE products
  ADD COLUMN marketplace_source VARCHAR(80) NULL,
  ADD COLUMN marketplace_product_id VARCHAR(255) NULL,
  ADD COLUMN marketplace_product_url VARCHAR(1500) NULL,
  ADD COLUMN marketplace_price DECIMAL(12,2) NULL,
  ADD COLUMN marketplace_price_checked_at TIMESTAMP NULL,
  ADD COLUMN quality VARCHAR(500) NULL;

ALTER TABLE orders
  MODIFY COLUMN customer_name VARCHAR(10000) NULL,
  ADD COLUMN product_name VARCHAR(255) NULL,
  ADD COLUMN quantity INT NULL,
  ADD COLUMN phone VARCHAR(50) NULL,
  ADD COLUMN address VARCHAR(1000) NULL,
  ADD COLUMN payment VARCHAR(100) NULL,
  ADD COLUMN payment_status VARCHAR(100) NULL,
  ADD COLUMN product_photo VARCHAR(1500) NULL,
  ADD COLUMN cancel_reason VARCHAR(500) NULL,
  ADD COLUMN return_reason VARCHAR(500) NULL,
  ADD COLUMN exchange_reason VARCHAR(500) NULL,
  ADD COLUMN request_type VARCHAR(40) NULL,
  ADD COLUMN request_status VARCHAR(40) NULL,
  ADD COLUMN request_target_status VARCHAR(40) NULL,
  ADD COLUMN requested_at TIMESTAMP NULL;

-- Complete customer catalog seed. Existing product rows are kept and duplicates are skipped by name.
INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'LED Television', 'WMS Catalog', 'LED Television Standard', 'Black, Silver', 10, 27999, 'Electronics', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20LED%20Television%20Standard%20LED%20Television%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('LED Television'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Home Projector', 'WMS Catalog', 'Home Projector Standard', 'Black, Silver', 10, 18999, 'Electronics', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Home%20Projector%20Standard%20Home%20Projector%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Home Projector'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Bluetooth Audio Receiver', 'WMS Catalog', 'Bluetooth Audio Receiver Standard', 'Black, Silver', 10, 1499, 'Electronics', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Bluetooth%20Audio%20Receiver%20Standard%20Bluetooth%20Audio%20Receiver%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Bluetooth Audio Receiver'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Digital Alarm Clock', 'WMS Catalog', 'Digital Alarm Clock Standard', 'Black, Silver', 10, 999, 'Electronics', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Digital%20Alarm%20Clock%20Standard%20Digital%20Alarm%20Clock%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Digital Alarm Clock'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Mobile Phone', 'WMS Catalog', 'Mobile Phone Standard', 'Black, Silver', 10, 12999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mobile%20Phone%20Standard%20Mobile%20Phone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Mobile Phone'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smartphone', 'WMS Catalog', 'Smartphone Standard', 'Black, Silver', 10, 17999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smartphone%20Standard%20Smartphone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smartphone'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Gaming Phone', 'WMS Catalog', 'Gaming Phone Standard', 'Black, Silver', 10, 34999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Phone%20Standard%20Gaming%20Phone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Gaming Phone'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Tablet', 'WMS Catalog', 'Tablet Standard', 'Black, Silver', 10, 21999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Tablet%20Standard%20Tablet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Tablet'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'iPad', 'WMS Catalog', 'iPad Standard', 'Black, Silver', 10, 44999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20iPad%20Standard%20iPad%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('iPad'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Laptop', 'WMS Catalog', 'Laptop Standard', 'Black, Silver', 10, 54999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Laptop%20Standard%20Laptop%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Laptop'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Gaming Laptop', 'WMS Catalog', 'Gaming Laptop Standard', 'Black, Silver', 10, 89999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Laptop%20Standard%20Gaming%20Laptop%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Gaming Laptop'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Business Laptop', 'WMS Catalog', 'Business Laptop Standard', 'Black, Silver', 10, 64999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Business%20Laptop%20Standard%20Business%20Laptop%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Business Laptop'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Chromebook', 'WMS Catalog', 'Chromebook Standard', 'Black, Silver', 10, 28999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Chromebook%20Standard%20Chromebook%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Chromebook'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'MacBook', 'WMS Catalog', 'MacBook Standard', 'Black, Silver', 10, 99999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20MacBook%20Standard%20MacBook%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('MacBook'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Desktop PC', 'WMS Catalog', 'Desktop PC Standard', 'Black, Silver', 10, 45999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Desktop%20PC%20Standard%20Desktop%20PC%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Desktop PC'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'All-in-One PC', 'WMS Catalog', 'All-in-One PC Standard', 'Black, Silver', 10, 59999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20All-in-One%20PC%20Standard%20All-in-One%20PC%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('All-in-One PC'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Mini PC', 'WMS Catalog', 'Mini PC Standard', 'Black, Silver', 10, 32999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mini%20PC%20Standard%20Mini%20PC%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Mini PC'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Monitor', 'WMS Catalog', 'Monitor Standard', 'Black, Silver', 10, 11999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Monitor%20Standard%20Monitor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Monitor'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Curved Monitor', 'WMS Catalog', 'Curved Monitor Standard', 'Black, Silver', 10, 24999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Curved%20Monitor%20Standard%20Curved%20Monitor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Curved Monitor'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT '4K Monitor', 'WMS Catalog', '4K Monitor Standard', 'Black, Silver', 10, 32999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%204K%20Monitor%20Standard%204K%20Monitor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('4K Monitor'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart TV', 'WMS Catalog', 'Smart TV Standard', 'Black, Silver', 10, 34999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20TV%20Standard%20Smart%20TV%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart TV'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Android TV', 'WMS Catalog', 'Android TV Standard', 'Black, Silver', 10, 29999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Android%20TV%20Standard%20Android%20TV%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Android TV'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'OLED TV', 'WMS Catalog', 'OLED TV Standard', 'Black, Silver', 10, 99999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20OLED%20TV%20Standard%20OLED%20TV%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('OLED TV'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'QLED TV', 'WMS Catalog', 'QLED TV Standard', 'Black, Silver', 10, 79999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20QLED%20TV%20Standard%20QLED%20TV%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('QLED TV'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Projector', 'WMS Catalog', 'Projector Standard', 'Black, Silver', 10, 27999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Projector%20Standard%20Projector%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Projector'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Webcam', 'WMS Catalog', 'Webcam Standard', 'Black, Silver', 10, 2499, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Webcam%20Standard%20Webcam%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Webcam'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Digital Camera', 'WMS Catalog', 'Digital Camera Standard', 'Black, Silver', 10, 28999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Digital%20Camera%20Standard%20Digital%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Digital Camera'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'DSLR Camera', 'WMS Catalog', 'DSLR Camera Standard', 'Black, Silver', 10, 54999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20DSLR%20Camera%20Standard%20DSLR%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('DSLR Camera'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Mirrorless Camera', 'WMS Catalog', 'Mirrorless Camera Standard', 'Black, Silver', 10, 74999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mirrorless%20Camera%20Standard%20Mirrorless%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Mirrorless Camera'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'CCTV Camera', 'WMS Catalog', 'CCTV Camera Standard', 'Black, Silver', 10, 3999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20CCTV%20Camera%20Standard%20CCTV%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('CCTV Camera'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Security Camera', 'WMS Catalog', 'Security Camera Standard', 'Black, Silver', 10, 4999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Security%20Camera%20Standard%20Security%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Security Camera'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Drone Camera', 'WMS Catalog', 'Drone Camera Standard', 'Black, Silver', 10, 69999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Drone%20Camera%20Standard%20Drone%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Drone Camera'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Printer', 'WMS Catalog', 'Printer Standard', 'Black, Silver', 10, 8999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Printer%20Standard%20Printer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Printer'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Scanner', 'WMS Catalog', 'Scanner Standard', 'Black, Silver', 10, 7999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Scanner%20Standard%20Scanner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Scanner'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Photocopier', 'WMS Catalog', 'Photocopier Standard', 'Black, Silver', 10, 45999, 'Electronics Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Photocopier%20Standard%20Photocopier%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Photocopier'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Android Smartphone', 'WMS Catalog', 'Android Smartphone Standard', 'Black, Silver', 10, 15999, 'Mobiles', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Android%20Smartphone%20Standard%20Android%20Smartphone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Android Smartphone'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT '5G Smartphone', 'WMS Catalog', '5G Smartphone Standard', 'Black, Silver', 10, 22999, 'Mobiles', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%205G%20Smartphone%20Standard%205G%20Smartphone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('5G Smartphone'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Feature Phone', 'WMS Catalog', 'Feature Phone Standard', 'Black, Silver', 10, 1999, 'Mobiles', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Feature%20Phone%20Standard%20Feature%20Phone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Feature Phone'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Rugged Mobile', 'WMS Catalog', 'Rugged Mobile Standard', 'Black, Silver', 10, 11999, 'Mobiles', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Rugged%20Mobile%20Standard%20Rugged%20Mobile%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Rugged Mobile'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Mobile Charger', 'WMS Catalog', 'Mobile Charger Standard', 'Black, Silver', 10, 799, 'Mobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mobile%20Charger%20Standard%20Mobile%20Charger%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Mobile Charger'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Fast Charger', 'WMS Catalog', 'Fast Charger Standard', 'Black, Silver', 10, 1199, 'Mobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Fast%20Charger%20Standard%20Fast%20Charger%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Fast Charger'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Wireless Charger', 'WMS Catalog', 'Wireless Charger Standard', 'Black, Silver', 10, 1699, 'Mobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Wireless%20Charger%20Standard%20Wireless%20Charger%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Wireless Charger'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'USB Cable', 'WMS Catalog', 'USB Cable Standard', 'Black, Silver', 10, 299, 'Mobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20USB%20Cable%20Standard%20USB%20Cable%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('USB Cable'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Type-C Cable', 'WMS Catalog', 'Type-C Cable Standard', 'Black, Silver', 10, 399, 'Mobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Type-C%20Cable%20Standard%20Type-C%20Cable%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Type-C Cable'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Lightning Cable', 'WMS Catalog', 'Lightning Cable Standard', 'Black, Silver', 10, 799, 'Mobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Lightning%20Cable%20Standard%20Lightning%20Cable%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Lightning Cable'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'OTG Cable', 'WMS Catalog', 'OTG Cable Standard', 'Black, Silver', 10, 249, 'Mobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20OTG%20Cable%20Standard%20OTG%20Cable%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('OTG Cable'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Power Bank', 'WMS Catalog', 'Power Bank Standard', 'Black, Silver', 10, 1999, 'Mobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Power%20Bank%20Standard%20Power%20Bank%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Power Bank'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Mobile Cover', 'WMS Catalog', 'Mobile Cover Standard', 'Black, Silver', 10, 499, 'Mobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mobile%20Cover%20Standard%20Mobile%20Cover%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Mobile Cover'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Phone Case', 'WMS Catalog', 'Phone Case Standard', 'Black, Silver', 10, 599, 'Mobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Phone%20Case%20Standard%20Phone%20Case%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Phone Case'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Tempered Glass', 'WMS Catalog', 'Tempered Glass Standard', 'Black, Silver', 10, 299, 'Mobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Tempered%20Glass%20Standard%20Tempered%20Glass%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Tempered Glass'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Screen Protector', 'WMS Catalog', 'Screen Protector Standard', 'Black, Silver', 10, 249, 'Mobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Screen%20Protector%20Standard%20Screen%20Protector%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Screen Protector'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Selfie Stick', 'WMS Catalog', 'Selfie Stick Standard', 'Black, Silver', 10, 799, 'Mobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Selfie%20Stick%20Standard%20Selfie%20Stick%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Selfie Stick'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Mobile Stand', 'WMS Catalog', 'Mobile Stand Standard', 'Black, Silver', 10, 349, 'Mobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mobile%20Stand%20Standard%20Mobile%20Stand%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Mobile Stand'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Car Charger', 'WMS Catalog', 'Car Charger Standard', 'Black, Silver', 10, 899, 'Mobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Car%20Charger%20Standard%20Car%20Charger%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Car Charger'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Earbuds', 'WMS Catalog', 'Earbuds Standard', 'Black, Silver', 10, 1499, 'Audio Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Earbuds%20Standard%20Earbuds%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Earbuds'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'TWS Earbuds', 'WMS Catalog', 'TWS Earbuds Standard', 'Black, Silver', 10, 2499, 'Audio Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20TWS%20Earbuds%20Standard%20TWS%20Earbuds%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('TWS Earbuds'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Neckband', 'WMS Catalog', 'Neckband Standard', 'Black, Silver', 10, 1299, 'Audio Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Neckband%20Standard%20Neckband%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Neckband'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Headphones', 'WMS Catalog', 'Headphones Standard', 'Black, Silver', 10, 1999, 'Audio Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Headphones%20Standard%20Headphones%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Headphones'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Gaming Headset', 'WMS Catalog', 'Gaming Headset Standard', 'Black, Silver', 10, 3499, 'Audio Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Headset%20Standard%20Gaming%20Headset%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Gaming Headset'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Bluetooth Speaker', 'WMS Catalog', 'Bluetooth Speaker Standard', 'Black, Silver', 10, 2499, 'Audio Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Bluetooth%20Speaker%20Standard%20Bluetooth%20Speaker%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Bluetooth Speaker'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Soundbar', 'WMS Catalog', 'Soundbar Standard', 'Black, Silver', 10, 7999, 'Audio Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Soundbar%20Standard%20Soundbar%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Soundbar'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Home Theater', 'WMS Catalog', 'Home Theater Standard', 'Black, Silver', 10, 19999, 'Audio Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Home%20Theater%20Standard%20Home%20Theater%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Home Theater'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Wireless Mic', 'WMS Catalog', 'Wireless Mic Standard', 'Black, Silver', 10, 2999, 'Audio Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Wireless%20Mic%20Standard%20Wireless%20Mic%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Wireless Mic'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Studio Mic', 'WMS Catalog', 'Studio Mic Standard', 'Black, Silver', 10, 5999, 'Audio Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Studio%20Mic%20Standard%20Studio%20Mic%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Studio Mic'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Laptop Sleeve', 'WMS Catalog', 'Laptop Sleeve Standard', 'Black, Silver', 10, 799, 'Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Laptop%20Sleeve%20Standard%20Laptop%20Sleeve%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Laptop Sleeve'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Cable Organizer', 'WMS Catalog', 'Cable Organizer Standard', 'Black, Silver', 10, 299, 'Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Cable%20Organizer%20Standard%20Cable%20Organizer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Cable Organizer'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Desk Organizer', 'WMS Catalog', 'Desk Organizer Standard', 'Black, Silver', 10, 699, 'Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Desk%20Organizer%20Standard%20Desk%20Organizer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Desk Organizer'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Universal Adapter', 'WMS Catalog', 'Universal Adapter Standard', 'Black, Silver', 10, 899, 'Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Universal%20Adapter%20Standard%20Universal%20Adapter%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Universal Adapter'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Keyboard', 'WMS Catalog', 'Keyboard Standard', 'Black, Silver', 10, 999, 'Computer Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Keyboard%20Standard%20Keyboard%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Keyboard'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Mechanical Keyboard', 'WMS Catalog', 'Mechanical Keyboard Standard', 'Black, Silver', 10, 3499, 'Computer Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mechanical%20Keyboard%20Standard%20Mechanical%20Keyboard%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Mechanical Keyboard'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Gaming Keyboard', 'WMS Catalog', 'Gaming Keyboard Standard', 'Black, Silver', 10, 2999, 'Computer Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Keyboard%20Standard%20Gaming%20Keyboard%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Gaming Keyboard'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Mouse', 'WMS Catalog', 'Mouse Standard', 'Black, Silver', 10, 599, 'Computer Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mouse%20Standard%20Mouse%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Mouse'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Gaming Mouse', 'WMS Catalog', 'Gaming Mouse Standard', 'Black, Silver', 10, 1499, 'Computer Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Mouse%20Standard%20Gaming%20Mouse%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Gaming Mouse'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Mouse Pad', 'WMS Catalog', 'Mouse Pad Standard', 'Black, Silver', 10, 299, 'Computer Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mouse%20Pad%20Standard%20Mouse%20Pad%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Mouse Pad'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Graphic Tablet', 'WMS Catalog', 'Graphic Tablet Standard', 'Black, Silver', 10, 5999, 'Computer Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Graphic%20Tablet%20Standard%20Graphic%20Tablet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Graphic Tablet'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'USB Hub', 'WMS Catalog', 'USB Hub Standard', 'Black, Silver', 10, 999, 'Computer Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20USB%20Hub%20Standard%20USB%20Hub%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('USB Hub'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Docking Station', 'WMS Catalog', 'Docking Station Standard', 'Black, Silver', 10, 3999, 'Computer Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Docking%20Station%20Standard%20Docking%20Station%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Docking Station'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Laptop Cooling Pad', 'WMS Catalog', 'Laptop Cooling Pad Standard', 'Black, Silver', 10, 1299, 'Computer Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Laptop%20Cooling%20Pad%20Standard%20Laptop%20Cooling%20Pad%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Laptop Cooling Pad'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'RAM', 'WMS Catalog', 'RAM Standard', 'Black, Silver', 10, 2499, 'Computer Components', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20RAM%20Standard%20RAM%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('RAM'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'DDR4 RAM', 'WMS Catalog', 'DDR4 RAM Standard', 'Black, Silver', 10, 2799, 'Computer Components', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20DDR4%20RAM%20Standard%20DDR4%20RAM%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('DDR4 RAM'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'DDR5 RAM', 'WMS Catalog', 'DDR5 RAM Standard', 'Black, Silver', 10, 4999, 'Computer Components', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20DDR5%20RAM%20Standard%20DDR5%20RAM%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('DDR5 RAM'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'SSD', 'WMS Catalog', 'SSD Standard', 'Black, Silver', 10, 3499, 'Computer Components', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20SSD%20Standard%20SSD%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('SSD'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'NVMe SSD', 'WMS Catalog', 'NVMe SSD Standard', 'Black, Silver', 10, 4999, 'Computer Components', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20NVMe%20SSD%20Standard%20NVMe%20SSD%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('NVMe SSD'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'HDD', 'WMS Catalog', 'HDD Standard', 'Black, Silver', 10, 3499, 'Computer Components', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20HDD%20Standard%20HDD%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('HDD'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'External HDD', 'WMS Catalog', 'External HDD Standard', 'Black, Silver', 10, 4999, 'Computer Components', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20External%20HDD%20Standard%20External%20HDD%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('External HDD'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'External SSD', 'WMS Catalog', 'External SSD Standard', 'Black, Silver', 10, 6999, 'Computer Components', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20External%20SSD%20Standard%20External%20SSD%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('External SSD'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Graphics Card', 'WMS Catalog', 'Graphics Card Standard', 'Black, Silver', 10, 24999, 'Computer Components', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Graphics%20Card%20Standard%20Graphics%20Card%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Graphics Card'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Processor', 'WMS Catalog', 'Processor Standard', 'Black, Silver', 10, 15999, 'Computer Components', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Processor%20Standard%20Processor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Processor'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Motherboard', 'WMS Catalog', 'Motherboard Standard', 'Black, Silver', 10, 8999, 'Computer Components', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Motherboard%20Standard%20Motherboard%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Motherboard'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Power Supply', 'WMS Catalog', 'Power Supply Standard', 'Black, Silver', 10, 3999, 'Computer Components', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Power%20Supply%20Standard%20Power%20Supply%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Power Supply'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'CPU Cooler', 'WMS Catalog', 'CPU Cooler Standard', 'Black, Silver', 10, 2499, 'Computer Components', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20CPU%20Cooler%20Standard%20CPU%20Cooler%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('CPU Cooler'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Cabinet', 'WMS Catalog', 'Cabinet Standard', 'Black, Silver', 10, 3499, 'Computer Components', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Cabinet%20Standard%20Cabinet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Cabinet'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'WiFi Card', 'WMS Catalog', 'WiFi Card Standard', 'Black, Silver', 10, 1499, 'Computer Components', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20WiFi%20Card%20Standard%20WiFi%20Card%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('WiFi Card'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'WiFi Router', 'WMS Catalog', 'WiFi Router Standard', 'Black, Silver', 10, 1999, 'Networking Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20WiFi%20Router%20Standard%20WiFi%20Router%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('WiFi Router'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Gaming Router', 'WMS Catalog', 'Gaming Router Standard', 'Black, Silver', 10, 6999, 'Networking Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Router%20Standard%20Gaming%20Router%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Gaming Router'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Modem', 'WMS Catalog', 'Modem Standard', 'Black, Silver', 10, 1799, 'Networking Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Modem%20Standard%20Modem%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Modem'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'LAN Cable', 'WMS Catalog', 'LAN Cable Standard', 'Black, Silver', 10, 299, 'Networking Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20LAN%20Cable%20Standard%20LAN%20Cable%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('LAN Cable'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Ethernet Cable', 'WMS Catalog', 'Ethernet Cable Standard', 'Black, Silver', 10, 299, 'Networking Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Ethernet%20Cable%20Standard%20Ethernet%20Cable%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Ethernet Cable'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Network Switch', 'WMS Catalog', 'Network Switch Standard', 'Black, Silver', 10, 2499, 'Networking Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Network%20Switch%20Standard%20Network%20Switch%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Network Switch'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Access Point', 'WMS Catalog', 'Access Point Standard', 'Black, Silver', 10, 3999, 'Networking Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Access%20Point%20Standard%20Access%20Point%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Access Point'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'WiFi Extender', 'WMS Catalog', 'WiFi Extender Standard', 'Black, Silver', 10, 1999, 'Networking Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20WiFi%20Extender%20Standard%20WiFi%20Extender%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('WiFi Extender'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Gaming Console', 'WMS Catalog', 'Gaming Console Standard', 'Black, Silver', 10, 39999, 'Gaming', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Console%20Standard%20Gaming%20Console%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Gaming Console'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Arcade Stick', 'WMS Catalog', 'Arcade Stick Standard', 'Black, Silver', 10, 4999, 'Gaming', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Arcade%20Stick%20Standard%20Arcade%20Stick%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Arcade Stick'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Gaming Capture Dock', 'WMS Catalog', 'Gaming Capture Dock Standard', 'Black, Silver', 10, 7999, 'Gaming', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Capture%20Dock%20Standard%20Gaming%20Capture%20Dock%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Gaming Capture Dock'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Gaming Mouse Pad XL', 'WMS Catalog', 'Gaming Mouse Pad XL Standard', 'Black, Silver', 10, 999, 'Gaming', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Mouse%20Pad%20XL%20Standard%20Gaming%20Mouse%20Pad%20XL%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Gaming Mouse Pad XL'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'PlayStation 5', 'WMS Catalog', 'PlayStation 5 Standard', 'Black, Silver', 10, 54999, 'Gaming Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20PlayStation%205%20Standard%20PlayStation%205%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('PlayStation 5'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Xbox Series X', 'WMS Catalog', 'Xbox Series X Standard', 'Black, Silver', 10, 52999, 'Gaming Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Xbox%20Series%20X%20Standard%20Xbox%20Series%20X%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Xbox Series X'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Nintendo Switch', 'WMS Catalog', 'Nintendo Switch Standard', 'Black, Silver', 10, 32999, 'Gaming Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Nintendo%20Switch%20Standard%20Nintendo%20Switch%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Nintendo Switch'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Gaming Chair', 'WMS Catalog', 'Gaming Chair Standard', 'Black, Silver', 10, 12999, 'Gaming Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Chair%20Standard%20Gaming%20Chair%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Gaming Chair'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Gaming Desk', 'WMS Catalog', 'Gaming Desk Standard', 'Black, Silver', 10, 9999, 'Gaming Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Desk%20Standard%20Gaming%20Desk%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Gaming Desk'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Gaming Controller', 'WMS Catalog', 'Gaming Controller Standard', 'Black, Silver', 10, 3499, 'Gaming Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Controller%20Standard%20Gaming%20Controller%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Gaming Controller'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'VR Headset', 'WMS Catalog', 'VR Headset Standard', 'Black, Silver', 10, 29999, 'Gaming Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20VR%20Headset%20Standard%20VR%20Headset%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('VR Headset'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Steering Wheel Controller', 'WMS Catalog', 'Steering Wheel Controller Standard', 'Black, Silver', 10, 14999, 'Gaming Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Steering%20Wheel%20Controller%20Standard%20Steering%20Wheel%20Controller%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Steering Wheel Controller'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Watch', 'WMS Catalog', 'Smart Watch Standard', 'Black, Silver', 10, 4999, 'Smart Devices', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Watch%20Standard%20Smart%20Watch%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Watch'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Fitness Band', 'WMS Catalog', 'Fitness Band Standard', 'Black, Silver', 10, 1999, 'Smart Devices', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Fitness%20Band%20Standard%20Fitness%20Band%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Fitness Band'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Ring', 'WMS Catalog', 'Smart Ring Standard', 'Black, Silver', 10, 9999, 'Smart Devices', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Ring%20Standard%20Smart%20Ring%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Ring'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Bulb', 'WMS Catalog', 'Smart Bulb Standard', 'Black, Silver', 10, 699, 'Smart Devices', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Bulb%20Standard%20Smart%20Bulb%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Bulb'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Plug', 'WMS Catalog', 'Smart Plug Standard', 'Black, Silver', 10, 999, 'Smart Devices', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Plug%20Standard%20Smart%20Plug%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Plug'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Lock', 'WMS Catalog', 'Smart Lock Standard', 'Black, Silver', 10, 8999, 'Smart Devices', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Lock%20Standard%20Smart%20Lock%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Lock'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Alexa Speaker', 'WMS Catalog', 'Alexa Speaker Standard', 'Black, Silver', 10, 4499, 'Smart Devices', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Alexa%20Speaker%20Standard%20Alexa%20Speaker%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Alexa Speaker'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Google Nest', 'WMS Catalog', 'Google Nest Standard', 'Black, Silver', 10, 5999, 'Smart Devices', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Google%20Nest%20Standard%20Google%20Nest%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Google Nest'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Doorbell', 'WMS Catalog', 'Smart Doorbell Standard', 'Black, Silver', 10, 7999, 'Smart Devices', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Doorbell%20Standard%20Smart%20Doorbell%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Doorbell'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Office File Cabinet', 'WMS Catalog', 'Office File Cabinet Standard', 'Black, Silver', 10, 6499, 'Office', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Office%20File%20Cabinet%20Standard%20Office%20File%20Cabinet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Office File Cabinet'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Office Desk Lamp', 'WMS Catalog', 'Office Desk Lamp Standard', 'Black, Silver', 10, 1499, 'Office', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Office%20Desk%20Lamp%20Standard%20Office%20Desk%20Lamp%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Office Desk Lamp'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Conference Phone', 'WMS Catalog', 'Conference Phone Standard', 'Black, Silver', 10, 8999, 'Office', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Conference%20Phone%20Standard%20Conference%20Phone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Conference Phone'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Document Shredder', 'WMS Catalog', 'Document Shredder Standard', 'Black, Silver', 10, 5999, 'Office', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Document%20Shredder%20Standard%20Document%20Shredder%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Document Shredder'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Office Chair', 'WMS Catalog', 'Office Chair Standard', 'Black, Silver', 10, 5499, 'Office Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Office%20Chair%20Standard%20Office%20Chair%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Office Chair'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Ergonomic Chair', 'WMS Catalog', 'Ergonomic Chair Standard', 'Black, Silver', 10, 8999, 'Office Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Ergonomic%20Chair%20Standard%20Ergonomic%20Chair%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Ergonomic Chair'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Office Table', 'WMS Catalog', 'Office Table Standard', 'Black, Silver', 10, 7499, 'Office Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Office%20Table%20Standard%20Office%20Table%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Office Table'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Study Table', 'WMS Catalog', 'Study Table Standard', 'Black, Silver', 10, 3999, 'Office Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Study%20Table%20Standard%20Study%20Table%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Study Table'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Whiteboard', 'WMS Catalog', 'Whiteboard Standard', 'Black, Silver', 10, 1999, 'Office Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Whiteboard%20Standard%20Whiteboard%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Whiteboard'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Attendance Machine', 'WMS Catalog', 'Attendance Machine Standard', 'Black, Silver', 10, 5999, 'Office Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Attendance%20Machine%20Standard%20Attendance%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Attendance Machine'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Barcode Scanner', 'WMS Catalog', 'Barcode Scanner Standard', 'Black, Silver', 10, 3499, 'Office Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Barcode%20Scanner%20Standard%20Barcode%20Scanner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Barcode Scanner'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Label Printer', 'WMS Catalog', 'Label Printer Standard', 'Black, Silver', 10, 6999, 'Office Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Label%20Printer%20Standard%20Label%20Printer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Label Printer'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'POS Machine', 'WMS Catalog', 'POS Machine Standard', 'Black, Silver', 10, 14999, 'Office Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20POS%20Machine%20Standard%20POS%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('POS Machine'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Refrigerator', 'WMS Catalog', 'Refrigerator Standard', 'Black, Silver', 10, 24999, 'Home Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Refrigerator%20Standard%20Refrigerator%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Refrigerator'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Washing Machine', 'WMS Catalog', 'Washing Machine Standard', 'Black, Silver', 10, 21999, 'Home Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Washing%20Machine%20Standard%20Washing%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Washing Machine'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Microwave Oven', 'WMS Catalog', 'Microwave Oven Standard', 'Black, Silver', 10, 8999, 'Home Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Microwave%20Oven%20Standard%20Microwave%20Oven%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Microwave Oven'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Air Conditioner', 'WMS Catalog', 'Air Conditioner Standard', 'Black, Silver', 10, 34999, 'Home Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Air%20Conditioner%20Standard%20Air%20Conditioner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Air Conditioner'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Air Cooler', 'WMS Catalog', 'Air Cooler Standard', 'Black, Silver', 10, 8999, 'Home Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Air%20Cooler%20Standard%20Air%20Cooler%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Air Cooler'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Water Purifier', 'WMS Catalog', 'Water Purifier Standard', 'Black, Silver', 10, 9999, 'Home Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Water%20Purifier%20Standard%20Water%20Purifier%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Water Purifier'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Vacuum Cleaner', 'WMS Catalog', 'Vacuum Cleaner Standard', 'Black, Silver', 10, 6999, 'Home Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Vacuum%20Cleaner%20Standard%20Vacuum%20Cleaner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Vacuum Cleaner'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Dishwasher', 'WMS Catalog', 'Dishwasher Standard', 'Black, Silver', 10, 39999, 'Home Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Dishwasher%20Standard%20Dishwasher%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Dishwasher'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Geyser', 'WMS Catalog', 'Geyser Standard', 'Black, Silver', 10, 7999, 'Home Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Geyser%20Standard%20Geyser%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Geyser'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Induction Cooker', 'WMS Catalog', 'Induction Cooker Standard', 'Black, Silver', 10, 2999, 'Home Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Induction%20Cooker%20Standard%20Induction%20Cooker%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Induction Cooker'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Electric Kettle', 'WMS Catalog', 'Electric Kettle Standard', 'Black, Silver', 10, 1499, 'Home Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Electric%20Kettle%20Standard%20Electric%20Kettle%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Electric Kettle'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Mixer Grinder', 'WMS Catalog', 'Mixer Grinder Standard', 'Black, Silver', 10, 3999, 'Home Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mixer%20Grinder%20Standard%20Mixer%20Grinder%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Mixer Grinder'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Ceiling Fan', 'WMS Catalog', 'Ceiling Fan Standard', 'Black, Silver', 10, 2499, 'Home Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Ceiling%20Fan%20Standard%20Ceiling%20Fan%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Ceiling Fan'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Table Fan', 'WMS Catalog', 'Table Fan Standard', 'Black, Silver', 10, 1799, 'Home Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Table%20Fan%20Standard%20Table%20Fan%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Table Fan'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Room Heater', 'WMS Catalog', 'Room Heater Standard', 'Black, Silver', 10, 2499, 'Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Room%20Heater%20Standard%20Room%20Heater%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Room Heater'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Steam Iron', 'WMS Catalog', 'Steam Iron Standard', 'Black, Silver', 10, 1299, 'Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Steam%20Iron%20Standard%20Steam%20Iron%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Steam Iron'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Hand Blender', 'WMS Catalog', 'Hand Blender Standard', 'Black, Silver', 10, 1899, 'Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Hand%20Blender%20Standard%20Hand%20Blender%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Hand Blender'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Electric Chopper', 'WMS Catalog', 'Electric Chopper Standard', 'Black, Silver', 10, 1599, 'Appliances', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Electric%20Chopper%20Standard%20Electric%20Chopper%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Electric Chopper'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Sofa', 'WMS Catalog', 'Sofa Standard', 'Black, Silver', 10, 24999, 'Furniture', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Sofa%20Standard%20Sofa%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Sofa'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Recliner Sofa', 'WMS Catalog', 'Recliner Sofa Standard', 'Black, Silver', 10, 39999, 'Furniture', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Recliner%20Sofa%20Standard%20Recliner%20Sofa%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Recliner Sofa'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Bed', 'WMS Catalog', 'Bed Standard', 'Black, Silver', 10, 19999, 'Furniture', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Bed%20Standard%20Bed%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Bed'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Mattress', 'WMS Catalog', 'Mattress Standard', 'Black, Silver', 10, 8999, 'Furniture', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mattress%20Standard%20Mattress%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Mattress'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Dining Table', 'WMS Catalog', 'Dining Table Standard', 'Black, Silver', 10, 18999, 'Furniture', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Dining%20Table%20Standard%20Dining%20Table%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Dining Table'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Wardrobe', 'WMS Catalog', 'Wardrobe Standard', 'Black, Silver', 10, 16999, 'Furniture', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Wardrobe%20Standard%20Wardrobe%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Wardrobe'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Cupboard', 'WMS Catalog', 'Cupboard Standard', 'Black, Silver', 10, 9999, 'Furniture', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Cupboard%20Standard%20Cupboard%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Cupboard'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Bookshelf', 'WMS Catalog', 'Bookshelf Standard', 'Black, Silver', 10, 4999, 'Furniture', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Bookshelf%20Standard%20Bookshelf%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Bookshelf'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'TV Unit', 'WMS Catalog', 'TV Unit Standard', 'Black, Silver', 10, 7999, 'Furniture', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20TV%20Unit%20Standard%20TV%20Unit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('TV Unit'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Shoe Rack', 'WMS Catalog', 'Shoe Rack Standard', 'Black, Silver', 10, 3499, 'Furniture', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Shoe%20Rack%20Standard%20Shoe%20Rack%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Shoe Rack'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Fitness Tracker', 'WMS Catalog', 'Fitness Tracker Standard', 'Black, Silver', 10, 2499, 'Wearables', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Fitness%20Tracker%20Standard%20Fitness%20Tracker%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Fitness Tracker'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'VR Glasses', 'WMS Catalog', 'VR Glasses Standard', 'Black, Silver', 10, 12999, 'Wearables', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20VR%20Glasses%20Standard%20VR%20Glasses%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('VR Glasses'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'AR Glasses', 'WMS Catalog', 'AR Glasses Standard', 'Black, Silver', 10, 49999, 'Wearables', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20AR%20Glasses%20Standard%20AR%20Glasses%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('AR Glasses'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Pendrive', 'WMS Catalog', 'Pendrive Standard', 'Black, Silver', 10, 599, 'Storage Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Pendrive%20Standard%20Pendrive%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Pendrive'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Memory Card', 'WMS Catalog', 'Memory Card Standard', 'Black, Silver', 10, 799, 'Storage Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Memory%20Card%20Standard%20Memory%20Card%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Memory Card'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'NAS Storage', 'WMS Catalog', 'NAS Storage Standard', 'Black, Silver', 10, 29999, 'Storage Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20NAS%20Storage%20Standard%20NAS%20Storage%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('NAS Storage'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Hard Disk Enclosure', 'WMS Catalog', 'Hard Disk Enclosure Standard', 'Black, Silver', 10, 999, 'Storage Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Hard%20Disk%20Enclosure%20Standard%20Hard%20Disk%20Enclosure%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Hard Disk Enclosure'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Car Vacuum Cleaner', 'WMS Catalog', 'Car Vacuum Cleaner Standard', 'Black, Silver', 10, 2499, 'Automobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Car%20Vacuum%20Cleaner%20Standard%20Car%20Vacuum%20Cleaner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Car Vacuum Cleaner'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Dash Camera', 'WMS Catalog', 'Dash Camera Standard', 'Black, Silver', 10, 4999, 'Automobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Dash%20Camera%20Standard%20Dash%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Dash Camera'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Car Stereo', 'WMS Catalog', 'Car Stereo Standard', 'Black, Silver', 10, 6999, 'Automobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Car%20Stereo%20Standard%20Car%20Stereo%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Car Stereo'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'GPS Tracker', 'WMS Catalog', 'GPS Tracker Standard', 'Black, Silver', 10, 2999, 'Automobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20GPS%20Tracker%20Standard%20GPS%20Tracker%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('GPS Tracker'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Bike Helmet', 'WMS Catalog', 'Bike Helmet Standard', 'Black, Silver', 10, 1999, 'Automobile Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Bike%20Helmet%20Standard%20Bike%20Helmet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Bike Helmet'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Air Fryer', 'WMS Catalog', 'Air Fryer Standard', 'Black, Silver', 10, 7999, 'Kitchen Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Air%20Fryer%20Standard%20Air%20Fryer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Air Fryer'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Coffee Machine', 'WMS Catalog', 'Coffee Machine Standard', 'Black, Silver', 10, 9999, 'Kitchen Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Coffee%20Machine%20Standard%20Coffee%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Coffee Machine'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Toaster', 'WMS Catalog', 'Toaster Standard', 'Black, Silver', 10, 1999, 'Kitchen Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Toaster%20Standard%20Toaster%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Toaster'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Rice Cooker', 'WMS Catalog', 'Rice Cooker Standard', 'Black, Silver', 10, 2999, 'Kitchen Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Rice%20Cooker%20Standard%20Rice%20Cooker%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Rice Cooker'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Juicer', 'WMS Catalog', 'Juicer Standard', 'Black, Silver', 10, 3499, 'Kitchen Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Juicer%20Standard%20Juicer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Juicer'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Hair Dryer', 'WMS Catalog', 'Hair Dryer Standard', 'Black, Silver', 10, 1499, 'Beauty & Personal Care', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Hair%20Dryer%20Standard%20Hair%20Dryer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Hair Dryer'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Hair Straightener', 'WMS Catalog', 'Hair Straightener Standard', 'Black, Silver', 10, 1999, 'Beauty & Personal Care', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Hair%20Straightener%20Standard%20Hair%20Straightener%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Hair Straightener'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Trimmer', 'WMS Catalog', 'Trimmer Standard', 'Black, Silver', 10, 1299, 'Beauty & Personal Care', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Trimmer%20Standard%20Trimmer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Trimmer'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Electric Toothbrush', 'WMS Catalog', 'Electric Toothbrush Standard', 'Black, Silver', 10, 2499, 'Beauty & Personal Care', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Electric%20Toothbrush%20Standard%20Electric%20Toothbrush%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Electric Toothbrush'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Shaver', 'WMS Catalog', 'Shaver Standard', 'Black, Silver', 10, 1999, 'Beauty & Personal Care', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Shaver%20Standard%20Shaver%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Shaver'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Action Camera', 'WMS Catalog', 'Action Camera Standard', 'Black, Silver', 10, 12999, 'Camera & Photography', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Action%20Camera%20Standard%20Action%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Action Camera'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'GoPro', 'WMS Catalog', 'GoPro Standard', 'Black, Silver', 10, 34999, 'Camera & Photography', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20GoPro%20Standard%20GoPro%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('GoPro'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Camera Lens', 'WMS Catalog', 'Camera Lens Standard', 'Black, Silver', 10, 18999, 'Camera & Photography', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Camera%20Lens%20Standard%20Camera%20Lens%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Camera Lens'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Tripod', 'WMS Catalog', 'Tripod Standard', 'Black, Silver', 10, 1499, 'Camera & Photography', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Tripod%20Standard%20Tripod%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Tripod'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Ring Light', 'WMS Catalog', 'Ring Light Standard', 'Black, Silver', 10, 1999, 'Camera & Photography', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Ring%20Light%20Standard%20Ring%20Light%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Ring Light'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Studio Light', 'WMS Catalog', 'Studio Light Standard', 'Black, Silver', 10, 4999, 'Camera & Photography', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Studio%20Light%20Standard%20Studio%20Light%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Studio Light'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Gimbal', 'WMS Catalog', 'Gimbal Standard', 'Black, Silver', 10, 7999, 'Camera & Photography', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gimbal%20Standard%20Gimbal%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Gimbal'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Camera Battery', 'WMS Catalog', 'Camera Battery Standard', 'Black, Silver', 10, 2499, 'Camera & Photography', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Camera%20Battery%20Standard%20Camera%20Battery%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Camera Battery'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Memory Card Reader', 'WMS Catalog', 'Memory Card Reader Standard', 'Black, Silver', 10, 699, 'Camera & Photography', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Memory%20Card%20Reader%20Standard%20Memory%20Card%20Reader%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Memory Card Reader'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Door Lock', 'WMS Catalog', 'Smart Door Lock Standard', 'Black, Silver', 10, 8999, 'Smart Home', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Door%20Lock%20Standard%20Smart%20Door%20Lock%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Door Lock'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Video Doorbell', 'WMS Catalog', 'Video Doorbell Standard', 'Black, Silver', 10, 6999, 'Smart Home', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Video%20Doorbell%20Standard%20Video%20Doorbell%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Video Doorbell'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Curtain', 'WMS Catalog', 'Smart Curtain Standard', 'Black, Silver', 10, 9999, 'Smart Home', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Curtain%20Standard%20Smart%20Curtain%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Curtain'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Thermostat', 'WMS Catalog', 'Smart Thermostat Standard', 'Black, Silver', 10, 7999, 'Smart Home', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Thermostat%20Standard%20Smart%20Thermostat%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Thermostat'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Motion Sensor', 'WMS Catalog', 'Motion Sensor Standard', 'Black, Silver', 10, 1499, 'Smart Home', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Motion%20Sensor%20Standard%20Motion%20Sensor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Motion Sensor'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smoke Detector', 'WMS Catalog', 'Smoke Detector Standard', 'Black, Silver', 10, 1999, 'Smart Home', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smoke%20Detector%20Standard%20Smoke%20Detector%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smoke Detector'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Switch', 'WMS Catalog', 'Smart Switch Standard', 'Black, Silver', 10, 1299, 'Smart Home', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Switch%20Standard%20Smart%20Switch%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Switch'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Sensor', 'WMS Catalog', 'Smart Sensor Standard', 'Black, Silver', 10, 1699, 'Smart Home', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Sensor%20Standard%20Smart%20Sensor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Sensor'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Treadmill', 'WMS Catalog', 'Treadmill Standard', 'Black, Silver', 10, 34999, 'Fitness & Health', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Treadmill%20Standard%20Treadmill%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Treadmill'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Exercise Cycle', 'WMS Catalog', 'Exercise Cycle Standard', 'Black, Silver', 10, 12999, 'Fitness & Health', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Exercise%20Cycle%20Standard%20Exercise%20Cycle%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Exercise Cycle'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Dumbbells', 'WMS Catalog', 'Dumbbells Standard', 'Black, Silver', 10, 2499, 'Fitness & Health', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Dumbbells%20Standard%20Dumbbells%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Dumbbells'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Yoga Mat', 'WMS Catalog', 'Yoga Mat Standard', 'Black, Silver', 10, 799, 'Fitness & Health', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Yoga%20Mat%20Standard%20Yoga%20Mat%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Yoga Mat'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Massager', 'WMS Catalog', 'Massager Standard', 'Black, Silver', 10, 3999, 'Fitness & Health', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Massager%20Standard%20Massager%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Massager'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'BP Monitor', 'WMS Catalog', 'BP Monitor Standard', 'Black, Silver', 10, 1999, 'Fitness & Health', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20BP%20Monitor%20Standard%20BP%20Monitor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('BP Monitor'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Glucose Meter', 'WMS Catalog', 'Glucose Meter Standard', 'Black, Silver', 10, 1499, 'Fitness & Health', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Glucose%20Meter%20Standard%20Glucose%20Meter%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Glucose Meter'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Oximeter', 'WMS Catalog', 'Oximeter Standard', 'Black, Silver', 10, 999, 'Fitness & Health', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Oximeter%20Standard%20Oximeter%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Oximeter'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Weighing Machine', 'WMS Catalog', 'Weighing Machine Standard', 'Black, Silver', 10, 1299, 'Fitness & Health', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Weighing%20Machine%20Standard%20Weighing%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Weighing Machine'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Calculator', 'WMS Catalog', 'Calculator Standard', 'Black, Silver', 10, 399, 'School & Study', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Calculator%20Standard%20Calculator%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Calculator'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Scientific Calculator', 'WMS Catalog', 'Scientific Calculator Standard', 'Black, Silver', 10, 999, 'School & Study', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Scientific%20Calculator%20Standard%20Scientific%20Calculator%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Scientific Calculator'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Tablet for Study', 'WMS Catalog', 'Tablet for Study Standard', 'Black, Silver', 10, 15999, 'School & Study', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Tablet%20for%20Study%20Standard%20Tablet%20for%20Study%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Tablet for Study'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'E-Book Reader', 'WMS Catalog', 'E-Book Reader Standard', 'Black, Silver', 10, 9999, 'School & Study', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20E-Book%20Reader%20Standard%20E-Book%20Reader%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('E-Book Reader'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Study Lamp', 'WMS Catalog', 'Study Lamp Standard', 'Black, Silver', 10, 899, 'School & Study', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Study%20Lamp%20Standard%20Study%20Lamp%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Study Lamp'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Printer Ink', 'WMS Catalog', 'Printer Ink Standard', 'Black, Silver', 10, 699, 'School & Study', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Printer%20Ink%20Standard%20Printer%20Ink%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Printer Ink'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Stationery Kit', 'WMS Catalog', 'Stationery Kit Standard', 'Black, Silver', 10, 499, 'School & Study', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Stationery%20Kit%20Standard%20Stationery%20Kit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Stationery Kit'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Barcode Printer', 'WMS Catalog', 'Barcode Printer Standard', 'Black, Silver', 10, 12999, 'Industrial Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Barcode%20Printer%20Standard%20Barcode%20Printer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Barcode Printer'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'RFID Scanner', 'WMS Catalog', 'RFID Scanner Standard', 'Black, Silver', 10, 15999, 'Industrial Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20RFID%20Scanner%20Standard%20RFID%20Scanner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('RFID Scanner'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Warehouse Scanner', 'WMS Catalog', 'Warehouse Scanner Standard', 'Black, Silver', 10, 8999, 'Industrial Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Warehouse%20Scanner%20Standard%20Warehouse%20Scanner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Warehouse Scanner'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Conveyor Belt', 'WMS Catalog', 'Conveyor Belt Standard', 'Black, Silver', 10, 79999, 'Industrial Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Conveyor%20Belt%20Standard%20Conveyor%20Belt%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Conveyor Belt'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Packaging Machine', 'WMS Catalog', 'Packaging Machine Standard', 'Black, Silver', 10, 59999, 'Industrial Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Packaging%20Machine%20Standard%20Packaging%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Packaging Machine'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Industrial Fan', 'WMS Catalog', 'Industrial Fan Standard', 'Black, Silver', 10, 6999, 'Industrial Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Industrial%20Fan%20Standard%20Industrial%20Fan%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Industrial Fan'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Safety Helmet', 'WMS Catalog', 'Safety Helmet Standard', 'Black, Silver', 10, 799, 'Industrial Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Safety%20Helmet%20Standard%20Safety%20Helmet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Safety Helmet'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Safety Gloves', 'WMS Catalog', 'Safety Gloves Standard', 'Black, Silver', 10, 399, 'Industrial Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Safety%20Gloves%20Standard%20Safety%20Gloves%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Safety Gloves'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Industrial Drill', 'WMS Catalog', 'Industrial Drill Standard', 'Black, Silver', 10, 4999, 'Industrial', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Industrial%20Drill%20Standard%20Industrial%20Drill%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Industrial Drill'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Measuring Caliper', 'WMS Catalog', 'Measuring Caliper Standard', 'Black, Silver', 10, 1299, 'Industrial', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Measuring%20Caliper%20Standard%20Measuring%20Caliper%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Measuring Caliper'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Safety Harness', 'WMS Catalog', 'Safety Harness Standard', 'Black, Silver', 10, 2499, 'Industrial', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Safety%20Harness%20Standard%20Safety%20Harness%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Safety Harness'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Tool Kit', 'WMS Catalog', 'Tool Kit Standard', 'Black, Silver', 10, 3499, 'Industrial', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Tool%20Kit%20Standard%20Tool%20Kit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Tool Kit'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Server Rack', 'WMS Catalog', 'Server Rack Standard', 'Black, Silver', 10, 24999, 'Server & Enterprise', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Server%20Rack%20Standard%20Server%20Rack%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Server Rack'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'NAS Server', 'WMS Catalog', 'NAS Server Standard', 'Black, Silver', 10, 69999, 'Server & Enterprise', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20NAS%20Server%20Standard%20NAS%20Server%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('NAS Server'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Enterprise SSD', 'WMS Catalog', 'Enterprise SSD Standard', 'Black, Silver', 10, 14999, 'Server & Enterprise', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Enterprise%20SSD%20Standard%20Enterprise%20SSD%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Enterprise SSD'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Rack Switch', 'WMS Catalog', 'Rack Switch Standard', 'Black, Silver', 10, 29999, 'Server & Enterprise', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Rack%20Switch%20Standard%20Rack%20Switch%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Rack Switch'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Firewall Device', 'WMS Catalog', 'Firewall Device Standard', 'Black, Silver', 10, 39999, 'Server & Enterprise', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Firewall%20Device%20Standard%20Firewall%20Device%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Firewall Device'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'UPS', 'WMS Catalog', 'UPS Standard', 'Black, Silver', 10, 7999, 'Server & Enterprise', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20UPS%20Standard%20UPS%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('UPS'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Data Backup Device', 'WMS Catalog', 'Data Backup Device Standard', 'Black, Silver', 10, 24999, 'Server & Enterprise', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Data%20Backup%20Device%20Standard%20Data%20Backup%20Device%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Data Backup Device'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Enterprise Router', 'WMS Catalog', 'Enterprise Router Standard', 'Black, Silver', 10, 44999, 'Enterprise', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Enterprise%20Router%20Standard%20Enterprise%20Router%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Enterprise Router'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Managed Firewall', 'WMS Catalog', 'Managed Firewall Standard', 'Black, Silver', 10, 69999, 'Enterprise', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Managed%20Firewall%20Standard%20Managed%20Firewall%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Managed Firewall'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Rackmount UPS', 'WMS Catalog', 'Rackmount UPS Standard', 'Black, Silver', 10, 29999, 'Enterprise', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Rackmount%20UPS%20Standard%20Rackmount%20UPS%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Rackmount UPS'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Enterprise Access Controller', 'WMS Catalog', 'Enterprise Access Controller Standard', 'Black, Silver', 10, 19999, 'Enterprise', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Enterprise%20Access%20Controller%20Standard%20Enterprise%20Access%20Controller%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Enterprise Access Controller'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Extension Board', 'WMS Catalog', 'Extension Board Standard', 'Black, Silver', 10, 599, 'Electric Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Extension%20Board%20Standard%20Extension%20Board%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Extension Board'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Inverter', 'WMS Catalog', 'Inverter Standard', 'Black, Silver', 10, 15999, 'Electric Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Inverter%20Standard%20Inverter%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Inverter'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'UPS Battery', 'WMS Catalog', 'UPS Battery Standard', 'Black, Silver', 10, 5999, 'Electric Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20UPS%20Battery%20Standard%20UPS%20Battery%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('UPS Battery'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Solar Panel', 'WMS Catalog', 'Solar Panel Standard', 'Black, Silver', 10, 12999, 'Electric Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Solar%20Panel%20Standard%20Solar%20Panel%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Solar Panel'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'LED Strip', 'WMS Catalog', 'LED Strip Standard', 'Black, Silver', 10, 899, 'Electric Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20LED%20Strip%20Standard%20LED%20Strip%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('LED Strip'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Emergency Light', 'WMS Catalog', 'Emergency Light Standard', 'Black, Silver', 10, 1299, 'Electric Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Emergency%20Light%20Standard%20Emergency%20Light%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Emergency Light'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Trolley Bag', 'WMS Catalog', 'Trolley Bag Standard', 'Black, Silver', 10, 3999, 'Travel Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Trolley%20Bag%20Standard%20Trolley%20Bag%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Trolley Bag'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Travel Backpack', 'WMS Catalog', 'Travel Backpack Standard', 'Black, Silver', 10, 2499, 'Travel Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Travel%20Backpack%20Standard%20Travel%20Backpack%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Travel Backpack'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Travel Adapter', 'WMS Catalog', 'Travel Adapter Standard', 'Black, Silver', 10, 799, 'Travel Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Travel%20Adapter%20Standard%20Travel%20Adapter%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Travel Adapter'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Neck Pillow', 'WMS Catalog', 'Neck Pillow Standard', 'Black, Silver', 10, 699, 'Travel Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Neck%20Pillow%20Standard%20Neck%20Pillow%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Neck Pillow'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Jacket', 'WMS Catalog', 'Smart Jacket Standard', 'Black, Silver', 10, 9999, 'Fashion Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Jacket%20Standard%20Smart%20Jacket%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Jacket'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Digital Watch', 'WMS Catalog', 'Digital Watch Standard', 'Black, Silver', 10, 1999, 'Fashion Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Digital%20Watch%20Standard%20Digital%20Watch%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Digital Watch'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Wallet', 'WMS Catalog', 'Wallet Standard', 'Black, Silver', 10, 999, 'Fashion Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Wallet%20Standard%20Wallet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Wallet'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Belt', 'WMS Catalog', 'Belt Standard', 'Black, Silver', 10, 799, 'Fashion Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Belt%20Standard%20Belt%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Belt'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Sunglasses', 'WMS Catalog', 'Sunglasses Standard', 'Black, Silver', 10, 1499, 'Fashion Accessories', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Sunglasses%20Standard%20Sunglasses%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Sunglasses'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Baby Monitor', 'WMS Catalog', 'Baby Monitor Standard', 'Black, Silver', 10, 5999, 'Baby Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Baby%20Monitor%20Standard%20Baby%20Monitor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Baby Monitor'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Baby Stroller', 'WMS Catalog', 'Baby Stroller Standard', 'Black, Silver', 10, 8999, 'Baby Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Baby%20Stroller%20Standard%20Baby%20Stroller%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Baby Stroller'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Milk Warmer', 'WMS Catalog', 'Milk Warmer Standard', 'Black, Silver', 10, 2499, 'Baby Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Milk%20Warmer%20Standard%20Milk%20Warmer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Milk Warmer'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Baby Camera', 'WMS Catalog', 'Baby Camera Standard', 'Black, Silver', 10, 4999, 'Baby Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Baby%20Camera%20Standard%20Baby%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Baby Camera'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Pet Camera', 'WMS Catalog', 'Pet Camera Standard', 'Black, Silver', 10, 4999, 'Pet Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Pet%20Camera%20Standard%20Pet%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Pet Camera'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Pet Feeder', 'WMS Catalog', 'Smart Pet Feeder Standard', 'Black, Silver', 10, 7999, 'Pet Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Pet%20Feeder%20Standard%20Smart%20Pet%20Feeder%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Pet Feeder'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Pet Tracker', 'WMS Catalog', 'Pet Tracker Standard', 'Black, Silver', 10, 2999, 'Pet Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Pet%20Tracker%20Standard%20Pet%20Tracker%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Pet Tracker'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Mac Studio', 'WMS Catalog', 'Mac Studio Standard', 'Black, Silver', 10, 199999, 'Luxury Electronics', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mac%20Studio%20Standard%20Mac%20Studio%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Mac Studio'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'iMac', 'WMS Catalog', 'iMac Standard', 'Black, Silver', 10, 139999, 'Luxury Electronics', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20iMac%20Standard%20iMac%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('iMac'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'UltraWide Monitor', 'WMS Catalog', 'UltraWide Monitor Standard', 'Black, Silver', 10, 59999, 'Luxury Electronics', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20UltraWide%20Monitor%20Standard%20UltraWide%20Monitor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('UltraWide Monitor'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Foldable Phone', 'WMS Catalog', 'Foldable Phone Standard', 'Black, Silver', 10, 129999, 'Luxury Electronics', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Foldable%20Phone%20Standard%20Foldable%20Phone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Foldable Phone'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Luxury Smart Watch', 'WMS Catalog', 'Luxury Smart Watch Standard', 'Black, Silver', 10, 69999, 'Luxury Electronics', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Luxury%20Smart%20Watch%20Standard%20Luxury%20Smart%20Watch%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Luxury Smart Watch'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Podcast Mic', 'WMS Catalog', 'Podcast Mic Standard', 'Black, Silver', 10, 7999, 'Content Creator Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Podcast%20Mic%20Standard%20Podcast%20Mic%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Podcast Mic'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Stream Deck', 'WMS Catalog', 'Stream Deck Standard', 'Black, Silver', 10, 14999, 'Content Creator Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Stream%20Deck%20Standard%20Stream%20Deck%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Stream Deck'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Capture Card', 'WMS Catalog', 'Capture Card Standard', 'Black, Silver', 10, 12999, 'Content Creator Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Capture%20Card%20Standard%20Capture%20Card%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Capture Card'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Green Screen', 'WMS Catalog', 'Green Screen Standard', 'Black, Silver', 10, 2999, 'Content Creator Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Green%20Screen%20Standard%20Green%20Screen%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Green Screen'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'RGB Lights', 'WMS Catalog', 'RGB Lights Standard', 'Black, Silver', 10, 2499, 'Content Creator Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20RGB%20Lights%20Standard%20RGB%20Lights%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('RGB Lights'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Biometric Lock', 'WMS Catalog', 'Biometric Lock Standard', 'Black, Silver', 10, 8999, 'Cyber Security Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Biometric%20Lock%20Standard%20Biometric%20Lock%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Biometric Lock'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Fingerprint Scanner', 'WMS Catalog', 'Fingerprint Scanner Standard', 'Black, Silver', 10, 3499, 'Cyber Security Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Fingerprint%20Scanner%20Standard%20Fingerprint%20Scanner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Fingerprint Scanner'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart CCTV', 'WMS Catalog', 'Smart CCTV Standard', 'Black, Silver', 10, 6999, 'Cyber Security Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20CCTV%20Standard%20Smart%20CCTV%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart CCTV'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Face Recognition Camera', 'WMS Catalog', 'Face Recognition Camera Standard', 'Black, Silver', 10, 14999, 'Cyber Security Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Face%20Recognition%20Camera%20Standard%20Face%20Recognition%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Face Recognition Camera'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'AI Speaker', 'WMS Catalog', 'AI Speaker Standard', 'Black, Silver', 10, 5999, 'AI Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20AI%20Speaker%20Standard%20AI%20Speaker%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('AI Speaker'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'AI Robot Vacuum', 'WMS Catalog', 'AI Robot Vacuum Standard', 'Black, Silver', 10, 24999, 'AI Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20AI%20Robot%20Vacuum%20Standard%20AI%20Robot%20Vacuum%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('AI Robot Vacuum'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'AI Security Camera', 'WMS Catalog', 'AI Security Camera Standard', 'Black, Silver', 10, 9999, 'AI Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20AI%20Security%20Camera%20Standard%20AI%20Security%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('AI Security Camera'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'AI Translation Device', 'WMS Catalog', 'AI Translation Device Standard', 'Black, Silver', 10, 12999, 'AI Devices', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20AI%20Translation%20Device%20Standard%20AI%20Translation%20Device%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('AI Translation Device'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'AI Meeting Recorder', 'WMS Catalog', 'AI Meeting Recorder Standard', 'Black, Silver', 10, 9999, 'AI Devices', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20AI%20Meeting%20Recorder%20Standard%20AI%20Meeting%20Recorder%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('AI Meeting Recorder'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'AI Vision Sensor', 'WMS Catalog', 'AI Vision Sensor Standard', 'Black, Silver', 10, 18999, 'AI Devices', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20AI%20Vision%20Sensor%20Standard%20AI%20Vision%20Sensor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('AI Vision Sensor'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'AI Voice Assistant Hub', 'WMS Catalog', 'AI Voice Assistant Hub Standard', 'Black, Silver', 10, 7999, 'AI Devices', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20AI%20Voice%20Assistant%20Hub%20Standard%20AI%20Voice%20Assistant%20Hub%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('AI Voice Assistant Hub'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Storage Bin', 'WMS Catalog', 'Storage Bin Standard', 'Black, Silver', 10, 499, 'Warehouse Related Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Storage%20Bin%20Standard%20Storage%20Bin%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Storage Bin'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Pallet', 'WMS Catalog', 'Pallet Standard', 'Black, Silver', 10, 1499, 'Warehouse Related Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Pallet%20Standard%20Pallet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Pallet'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Industrial Rack', 'WMS Catalog', 'Industrial Rack Standard', 'Black, Silver', 10, 19999, 'Warehouse Related Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Industrial%20Rack%20Standard%20Industrial%20Rack%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Industrial Rack'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Hand Trolley', 'WMS Catalog', 'Hand Trolley Standard', 'Black, Silver', 10, 6999, 'Warehouse Related Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Hand%20Trolley%20Standard%20Hand%20Trolley%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Hand Trolley'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Forklift', 'WMS Catalog', 'Forklift Standard', 'Black, Silver', 10, 699999, 'Warehouse Related Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Forklift%20Standard%20Forklift%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Forklift'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Packaging Tape', 'WMS Catalog', 'Packaging Tape Standard', 'Black, Silver', 10, 199, 'Warehouse Related Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Packaging%20Tape%20Standard%20Packaging%20Tape%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Packaging Tape'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'QR Scanner', 'WMS Catalog', 'QR Scanner Standard', 'Black, Silver', 10, 3999, 'Warehouse Related Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20QR%20Scanner%20Standard%20QR%20Scanner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('QR Scanner'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'ECG Machine', 'WMS Catalog', 'ECG Machine Standard', 'Black, Silver', 10, 49999, 'Medical Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20ECG%20Machine%20Standard%20ECG%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('ECG Machine'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Digital Thermometer', 'WMS Catalog', 'Digital Thermometer Standard', 'Black, Silver', 10, 799, 'Medical Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Digital%20Thermometer%20Standard%20Digital%20Thermometer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Digital Thermometer'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Medical Monitor', 'WMS Catalog', 'Medical Monitor Standard', 'Black, Silver', 10, 34999, 'Medical Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Medical%20Monitor%20Standard%20Medical%20Monitor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Medical Monitor'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Hospital Bed', 'WMS Catalog', 'Hospital Bed Standard', 'Black, Silver', 10, 39999, 'Medical Products', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Hospital%20Bed%20Standard%20Hospital%20Bed%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Hospital Bed'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'First Aid Kit', 'WMS Catalog', 'First Aid Kit Standard', 'Black, Silver', 10, 999, 'Medical', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20First%20Aid%20Kit%20Standard%20First%20Aid%20Kit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('First Aid Kit'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Nebulizer', 'WMS Catalog', 'Nebulizer Standard', 'Black, Silver', 10, 2499, 'Medical', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Nebulizer%20Standard%20Nebulizer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Nebulizer'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Infrared Thermometer', 'WMS Catalog', 'Infrared Thermometer Standard', 'Black, Silver', 10, 1499, 'Medical', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Infrared%20Thermometer%20Standard%20Infrared%20Thermometer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Infrared Thermometer'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Pulse Monitor', 'WMS Catalog', 'Pulse Monitor Standard', 'Black, Silver', 10, 2999, 'Medical', 'Premium verified stock', 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Pulse%20Monitor%20Standard%20Pulse%20Monitor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Pulse Monitor'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Remote Control Car', 'Maisto', 'Rock Crawler 4x4', 'Black, Silver', 18, 2499, 'Toys & Kids', 'Premium ABS body, rechargeable battery', 'https://tse1.mm.bing.net/th?q=Maisto%20Rock%20Crawler%204x4%20Remote%20Control%20Car%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Remote Control Car'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Drone Toy', 'Syma', 'X5C Explorer', 'Black, Silver', 10, 4999, 'Toys & Kids', 'HD camera toy drone, beginner safe guards', 'https://tse1.mm.bing.net/th?q=Syma%20X5C%20Explorer%20Drone%20Toy%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Drone Toy'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Robot Toy', 'Makeblock', 'mBot STEM Robot', 'Black, Silver', 8, 8999, 'Toys & Kids', 'STEM learning kit, programmable sensors', 'https://tse1.mm.bing.net/th?q=Makeblock%20mBot%20STEM%20Robot%20Robot%20Toy%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Robot Toy'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Educational Toy', 'Fisher-Price', 'Think & Learn Code-a-Pillar', 'Black, Silver', 20, 2999, 'Toys & Kids', 'Child-safe plastic, early coding activity', 'https://tse1.mm.bing.net/th?q=Fisher-Price%20Think%20%26%20Learn%20Code-a-Pillar%20Educational%20Toy%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Educational Toy'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Building Blocks', 'LEGO', 'Classic Medium Creative Brick Box 10696', 'Black, Silver', 16, 3499, 'Toys & Kids', 'Original interlocking bricks, durable ABS', 'https://tse1.mm.bing.net/th?q=LEGO%20Classic%20Medium%20Creative%20Brick%20Box%2010696%20Building%20Blocks%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Building Blocks'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Learning Tablet', 'Samsung', 'Galaxy Tab A9 Kids Edition', 'Black, Silver', 7, 13999, 'Toys & Kids', 'Kid mode, protective case, HD display', 'https://tse1.mm.bing.net/th?q=Samsung%20Galaxy%20Tab%20A9%20Kids%20Edition%20Smart%20Learning%20Tablet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Learning Tablet'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Kids Smart Watch', 'Noise', 'Scout Kids Smartwatch', 'Black, Silver', 14, 2499, 'Toys & Kids', 'GPS-ready design, splash resistant body', 'https://tse1.mm.bing.net/th?q=Noise%20Scout%20Kids%20Smartwatch%20Kids%20Smart%20Watch%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Kids Smart Watch'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Shoes', 'Bata', 'Power Lace-Up Walking Shoes', 'Black, Silver', 35, 1999, 'Fashion', 'Comfort outsole, everyday synthetic upper', 'https://tse1.mm.bing.net/th?q=Bata%20Power%20Lace-Up%20Walking%20Shoes%20Shoes%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Shoes'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Sneakers', 'Nike', 'Court Vision Low', 'Black, Silver', 22, 5495, 'Fashion', 'Leather-look upper, cushioned daily wear', 'https://tse1.mm.bing.net/th?q=Nike%20Court%20Vision%20Low%20Sneakers%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Sneakers'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Sports Shoes', 'Adidas', 'Duramo SL', 'Black, Silver', 26, 4999, 'Fashion', 'Lightweight running sole, breathable mesh', 'https://tse1.mm.bing.net/th?q=Adidas%20Duramo%20SL%20Sports%20Shoes%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Sports Shoes'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Sandals', 'Crocs', 'Classic Sandal 2.0', 'Black, Silver', 28, 2995, 'Fashion', 'Croslite cushioning, water friendly', 'https://tse1.mm.bing.net/th?q=Crocs%20Classic%20Sandal%202.0%20Sandals%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Sandals'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'T-Shirts', 'U.S. Polo Assn.', 'Cotton Crew Neck Tee', 'Black, Silver', 60, 999, 'Fashion', 'Bio-washed cotton, regular fit', 'https://tse1.mm.bing.net/th?q=U.S.%20Polo%20Assn.%20Cotton%20Crew%20Neck%20Tee%20T-Shirts%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('T-Shirts'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Hoodies', 'Puma', 'Essentials Fleece Hoodie', 'Black, Silver', 24, 2999, 'Fashion', 'Warm fleece, ribbed cuffs', 'https://tse1.mm.bing.net/th?q=Puma%20Essentials%20Fleece%20Hoodie%20Hoodies%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Hoodies'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Jackets', 'Decathlon', 'Quechua NH100 Padded Jacket', 'Black, Silver', 18, 3499, 'Fashion', 'Lightweight insulation, outdoor ready', 'https://tse1.mm.bing.net/th?q=Decathlon%20Quechua%20NH100%20Padded%20Jacket%20Jackets%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Jackets'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Jeans', 'Levi''s', '511 Slim Fit', 'Black, Silver', 30, 3999, 'Fashion', 'Stretch denim, durable stitching', 'https://tse1.mm.bing.net/th?q=Levi''s%20511%20Slim%20Fit%20Jeans%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Jeans'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Caps', 'New Era', '9FORTY Adjustable Cap', 'Black, Silver', 40, 1499, 'Fashion', 'Structured cotton twill, adjustable strap', 'https://tse1.mm.bing.net/th?q=New%20Era%209FORTY%20Adjustable%20Cap%20Caps%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Caps'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Bags', 'Wildcraft', 'Hypadura Laptop Backpack', 'Black, Silver', 34, 2299, 'Fashion', 'Water resistant fabric, padded laptop sleeve', 'https://tse1.mm.bing.net/th?q=Wildcraft%20Hypadura%20Laptop%20Backpack%20Bags%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Bags'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Backpack', 'Skybags', 'Brat 22L Backpack', 'Black, Silver', 45, 1299, 'Bags & Travel', 'Daily carry polyester, padded straps', 'https://tse1.mm.bing.net/th?q=Skybags%20Brat%2022L%20Backpack%20Backpack%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Backpack'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Laptop Bag', 'HP', 'Renew Business 15.6 Bag', 'Black, Silver', 25, 1999, 'Bags & Travel', 'Recycled fabric, padded laptop compartment', 'https://tse1.mm.bing.net/th?q=HP%20Renew%20Business%2015.6%20Bag%20Laptop%20Bag%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Laptop Bag'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Trolley Bag', 'American Tourister', 'Ivy Spinner 68 cm', 'Black, Silver', 15, 6499, 'Bags & Travel', 'Hard shell, 360 degree spinner wheels', 'https://tse1.mm.bing.net/th?q=American%20Tourister%20Ivy%20Spinner%2068%20cm%20Trolley%20Bag%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Trolley Bag'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Duffel Bag', 'Safari', 'Seek 55L Duffel', 'Black, Silver', 32, 1899, 'Bags & Travel', 'High capacity travel fabric, side handles', 'https://tse1.mm.bing.net/th?q=Safari%20Seek%2055L%20Duffel%20Duffel%20Bag%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Duffel Bag'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Travel Backpack', 'Aristocrat', 'Urban Trek 45L', 'Black, Silver', 20, 2499, 'Bags & Travel', 'Cabin-friendly design, multi-pocket storage', 'https://tse1.mm.bing.net/th?q=Aristocrat%20Urban%20Trek%2045L%20Travel%20Backpack%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Travel Backpack'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Passport Holder', 'DailyObjects', 'Slim Travel Organizer', 'Black, Silver', 38, 999, 'Bags & Travel', 'Vegan leather, card and passport slots', 'https://tse1.mm.bing.net/th?q=DailyObjects%20Slim%20Travel%20Organizer%20Passport%20Holder%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Passport Holder'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'LED Lamp', 'Philips', 'Hue Go Portable Lamp', 'Black, Silver', 12, 7499, 'Home Decor', 'Smart color lighting, dimmable LED', 'https://tse1.mm.bing.net/th?q=Philips%20Hue%20Go%20Portable%20Lamp%20LED%20Lamp%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('LED Lamp'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Wall Clock', 'Seiko', 'QXA761 Wall Clock', 'Black, Silver', 22, 2499, 'Home Decor', 'Quiet sweep movement, premium dial', 'https://tse1.mm.bing.net/th?q=Seiko%20QXA761%20Wall%20Clock%20Wall%20Clock%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Wall Clock'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Wall Painting', 'Art Street', 'Canvas Wall Art Set', 'Black, Silver', 18, 1999, 'Home Decor', 'Fade-resistant canvas print', 'https://tse1.mm.bing.net/th?q=Art%20Street%20Canvas%20Wall%20Art%20Set%20Wall%20Painting%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Wall Painting'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Mirror', 'Hindware', 'Illusion LED Smart Mirror', 'Black, Silver', 6, 12999, 'Home Decor', 'Touch LED, anti-fog bathroom mirror', 'https://tse1.mm.bing.net/th?q=Hindware%20Illusion%20LED%20Smart%20Mirror%20Smart%20Mirror%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Mirror'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Curtains', 'Story@Home', 'Blackout Eyelet Curtains', 'Black, Silver', 30, 1499, 'Home Decor', 'Room darkening fabric, machine washable', 'https://tse1.mm.bing.net/th?q=Story%40Home%20Blackout%20Eyelet%20Curtains%20Curtains%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Curtains'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Carpets', 'Status Contract', 'Modern Area Rug 5x7', 'Black, Silver', 14, 3999, 'Home Decor', 'Soft pile, anti-skid backing', 'https://tse1.mm.bing.net/th?q=Status%20Contract%20Modern%20Area%20Rug%205x7%20Carpets%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Carpets'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Sofa Cover', 'Home Centre', 'Elastic Stretch Sofa Cover', 'Black, Silver', 20, 2499, 'Home Decor', 'Washable stretch fabric, anti-slip fit', 'https://tse1.mm.bing.net/th?q=Home%20Centre%20Elastic%20Stretch%20Sofa%20Cover%20Sofa%20Cover%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Sofa Cover'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Water Pump', 'Crompton', 'Mini Master Plus 1HP', 'Black, Silver', 12, 5999, 'Garden Products', 'Copper winding, high flow garden use', 'https://tse1.mm.bing.net/th?q=Crompton%20Mini%20Master%20Plus%201HP%20Water%20Pump%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Water Pump'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Garden Lights', 'Philips', 'Outdoor Solar Spike Light', 'Black, Silver', 30, 1999, 'Garden Products', 'Solar charging, weather resistant', 'https://tse1.mm.bing.net/th?q=Philips%20Outdoor%20Solar%20Spike%20Light%20Garden%20Lights%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Garden Lights'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Plant Pots', 'Ugaoo', 'Self Watering Planter Set', 'Black, Silver', 50, 999, 'Garden Products', 'UV-stable plastic, self watering tray', 'https://tse1.mm.bing.net/th?q=Ugaoo%20Self%20Watering%20Planter%20Set%20Plant%20Pots%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Plant Pots'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Grass Cutter', 'Bosch', 'EasyGrassCut 23', 'Black, Silver', 9, 4999, 'Garden Products', 'Electric trimmer, ergonomic handle', 'https://tse1.mm.bing.net/th?q=Bosch%20EasyGrassCut%2023%20Grass%20Cutter%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Grass Cutter'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Mini Fountain', 'Generic', 'Solar Garden Fountain 3W', 'Black, Silver', 16, 1499, 'Garden Products', 'Solar pump, decorative water flow', 'https://tse1.mm.bing.net/th?q=Generic%20Solar%20Garden%20Fountain%203W%20Mini%20Fountain%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Mini Fountain'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Bicycle', 'Hero', 'Sprint Milano 26T', 'Black, Silver', 10, 9999, 'Sports & Outdoor', 'Steel frame, city ride geometry', 'https://tse1.mm.bing.net/th?q=Hero%20Sprint%20Milano%2026T%20Bicycle%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Bicycle'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Gym Equipment', 'Lifelong', 'Home Gym Combo Bench', 'Black, Silver', 7, 14999, 'Sports & Outdoor', 'Multi-workout steel frame set', 'https://tse1.mm.bing.net/th?q=Lifelong%20Home%20Gym%20Combo%20Bench%20Gym%20Equipment%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Gym Equipment'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Cricket Bat', 'SG', 'Scorer Classic English Willow', 'Black, Silver', 20, 4999, 'Sports & Outdoor', 'Willow blade, cane handle grip', 'https://tse1.mm.bing.net/th?q=SG%20Scorer%20Classic%20English%20Willow%20Cricket%20Bat%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Cricket Bat'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Football', 'Nivia', 'Storm Football Size 5', 'Black, Silver', 40, 899, 'Sports & Outdoor', 'Machine stitched, training grade', 'https://tse1.mm.bing.net/th?q=Nivia%20Storm%20Football%20Size%205%20Football%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Football'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Badminton Kit', 'Yonex', 'GR 303 Combo Kit', 'Black, Silver', 25, 1999, 'Sports & Outdoor', 'Aluminium racquets, nylon shuttle set', 'https://tse1.mm.bing.net/th?q=Yonex%20GR%20303%20Combo%20Kit%20Badminton%20Kit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Badminton Kit'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Dumbbells', 'Amazon Basics', 'Rubber Encased Pair 10kg', 'Black, Silver', 18, 3499, 'Sports & Outdoor', 'Hex rubber design, knurled grip', 'https://tse1.mm.bing.net/th?q=Amazon%20Basics%20Rubber%20Encased%20Pair%2010kg%20Dumbbells%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Dumbbells'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Treadmill', 'Fitkit', 'FT200M Motorized Treadmill', 'Black, Silver', 5, 39999, 'Sports & Outdoor', 'Motorized belt, shock absorption', 'https://tse1.mm.bing.net/th?q=Fitkit%20FT200M%20Motorized%20Treadmill%20Treadmill%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Treadmill'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Yoga Mat', 'Boldfit', '6mm Anti-Skid Yoga Mat', 'Black, Silver', 55, 799, 'Sports & Outdoor', 'NBR foam, anti-skid texture', 'https://tse1.mm.bing.net/th?q=Boldfit%206mm%20Anti-Skid%20Yoga%20Mat%20Yoga%20Mat%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Yoga Mat'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Energy Drink', 'Red Bull', 'Energy Drink 250ml Pack', 'Black, Silver', 120, 125, 'Food & Beverage', 'Sealed beverage stock, FSSAI packed', 'https://tse1.mm.bing.net/th?q=Red%20Bull%20Energy%20Drink%20250ml%20Pack%20Energy%20Drink%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Energy Drink'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Coffee Beans', 'Blue Tokai', 'Attikan Estate Medium Roast 250g', 'Black, Silver', 60, 499, 'Food & Beverage', 'Fresh roast arabica beans', 'https://tse1.mm.bing.net/th?q=Blue%20Tokai%20Attikan%20Estate%20Medium%20Roast%20250g%20Coffee%20Beans%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Coffee Beans'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Protein Powder', 'Optimum Nutrition', 'Gold Standard Whey 2lb', 'Black, Silver', 20, 3299, 'Food & Beverage', 'Imported whey blend, sealed jar', 'https://tse1.mm.bing.net/th?q=Optimum%20Nutrition%20Gold%20Standard%20Whey%202lb%20Protein%20Powder%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Protein Powder'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Snacks', 'Haldiram''s', 'Namkeen Combo Pack', 'Black, Silver', 100, 299, 'Food & Beverage', 'Factory sealed, long shelf life', 'https://tse1.mm.bing.net/th?q=Haldiram''s%20Namkeen%20Combo%20Pack%20Snacks%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Snacks'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Dry Fruits', 'Tata Sampann', 'California Almonds 500g', 'Black, Silver', 70, 599, 'Food & Beverage', 'Premium grade nuts, resealable pouch', 'https://tse1.mm.bing.net/th?q=Tata%20Sampann%20California%20Almonds%20500g%20Dry%20Fruits%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Dry Fruits'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Packaged Foods', 'MTR', 'Ready To Eat Meal Pack', 'Black, Silver', 90, 199, 'Food & Beverage', 'Retort packed, ready-to-eat', 'https://tse1.mm.bing.net/th?q=MTR%20Ready%20To%20Eat%20Meal%20Pack%20Packaged%20Foods%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Packaged Foods'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Face Wash', 'Himalaya', 'Purifying Neem Face Wash 150ml', 'Black, Silver', 80, 199, 'Beauty Products', 'Dermatologically tested daily care', 'https://tse1.mm.bing.net/th?q=Himalaya%20Purifying%20Neem%20Face%20Wash%20150ml%20Face%20Wash%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Face Wash'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Moisturizer', 'Cetaphil', 'Moisturising Lotion 250ml', 'Black, Silver', 45, 899, 'Beauty Products', 'Sensitive skin formula', 'https://tse1.mm.bing.net/th?q=Cetaphil%20Moisturising%20Lotion%20250ml%20Moisturizer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Moisturizer'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Sunscreen', 'La Shield', 'SPF 40 Gel 60g', 'Black, Silver', 50, 699, 'Beauty Products', 'Broad spectrum UV protection', 'https://tse1.mm.bing.net/th?q=La%20Shield%20SPF%2040%20Gel%2060g%20Sunscreen%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Sunscreen'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Perfume', 'Skinn by Titan', 'Raw Eau De Parfum 100ml', 'Black, Silver', 24, 2495, 'Beauty Products', 'Long lasting EDP fragrance', 'https://tse1.mm.bing.net/th?q=Skinn%20by%20Titan%20Raw%20Eau%20De%20Parfum%20100ml%20Perfume%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Perfume'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Makeup Kit', 'Lakme', '9 to 5 Makeup Starter Kit', 'Black, Silver', 18, 1999, 'Beauty Products', 'Daily use cosmetic combo', 'https://tse1.mm.bing.net/th?q=Lakme%209%20to%205%20Makeup%20Starter%20Kit%20Makeup%20Kit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Makeup Kit'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Nail Polish', 'Colorbar', 'Vegan Nail Lacquer', 'Black, Silver', 65, 299, 'Beauty Products', 'Gloss finish, quick dry formula', 'https://tse1.mm.bing.net/th?q=Colorbar%20Vegan%20Nail%20Lacquer%20Nail%20Polish%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Nail Polish'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Fire Extinguisher', 'Ceasefire', 'ABC Powder 2kg', 'Black, Silver', 20, 1899, 'Safety Products', 'ISI marked, multipurpose safety use', 'https://tse1.mm.bing.net/th?q=Ceasefire%20ABC%20Powder%202kg%20Fire%20Extinguisher%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Fire Extinguisher'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Safety Shoes', 'Allen Cooper', 'AC-1156 Steel Toe', 'Black, Silver', 30, 1799, 'Safety Products', 'Steel toe, oil resistant sole', 'https://tse1.mm.bing.net/th?q=Allen%20Cooper%20AC-1156%20Steel%20Toe%20Safety%20Shoes%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Safety Shoes'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Helmet', 'Studds', 'Thunder D4 Full Face', 'Black, Silver', 28, 1499, 'Safety Products', 'ISI certified shell, clear visor', 'https://tse1.mm.bing.net/th?q=Studds%20Thunder%20D4%20Full%20Face%20Helmet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Helmet'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Gloves', '3M', 'Comfort Grip Safety Gloves', 'Black, Silver', 70, 399, 'Safety Products', 'Grip coating, industrial hand safety', 'https://tse1.mm.bing.net/th?q=3M%20Comfort%20Grip%20Safety%20Gloves%20Gloves%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Gloves'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Safety Jacket', 'Karam', 'Reflective Safety Vest', 'Black, Silver', 80, 499, 'Safety Products', 'High visibility reflective strips', 'https://tse1.mm.bing.net/th?q=Karam%20Reflective%20Safety%20Vest%20Safety%20Jacket%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Safety Jacket'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Drill Machine', 'Bosch', 'GSB 501 Impact Drill', 'Black, Silver', 15, 2999, 'Tools & Hardware', '500W motor, concrete and wood drilling', 'https://tse1.mm.bing.net/th?q=Bosch%20GSB%20501%20Impact%20Drill%20Drill%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Drill Machine'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Screwdriver Set', 'Stanley', 'STHT62511 9-Piece Set', 'Black, Silver', 40, 699, 'Tools & Hardware', 'Magnetic tips, chrome vanadium steel', 'https://tse1.mm.bing.net/th?q=Stanley%20STHT62511%209-Piece%20Set%20Screwdriver%20Set%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Screwdriver Set'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Hammer', 'Taparia', 'Claw Hammer 450g', 'Black, Silver', 35, 499, 'Tools & Hardware', 'Forged steel head, wooden handle', 'https://tse1.mm.bing.net/th?q=Taparia%20Claw%20Hammer%20450g%20Hammer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Hammer'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Tool Kit', 'Black+Decker', 'A7073 76-Piece Kit', 'Black, Silver', 22, 2499, 'Tools & Hardware', 'Home repair multi-tool case', 'https://tse1.mm.bing.net/th?q=Black%2BDecker%20A7073%2076-Piece%20Kit%20Tool%20Kit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Tool Kit'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Measuring Tape', 'Stanley', 'Tylon 5m Tape', 'Black, Silver', 60, 349, 'Tools & Hardware', 'Locking blade, metric markings', 'https://tse1.mm.bing.net/th?q=Stanley%20Tylon%205m%20Tape%20Measuring%20Tape%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Measuring Tape'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Inverter Battery', 'Exide', 'Inva Tubular IT500', 'Black, Silver', 12, 15999, 'Battery & Power', 'Tall tubular battery, long backup', 'https://tse1.mm.bing.net/th?q=Exide%20Inva%20Tubular%20IT500%20Inverter%20Battery%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Inverter Battery'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Power Station', 'EcoFlow', 'RIVER 2 Portable Power Station', 'Black, Silver', 8, 24999, 'Battery & Power', 'LFP battery, fast charging output', 'https://tse1.mm.bing.net/th?q=EcoFlow%20RIVER%202%20Portable%20Power%20Station%20Power%20Station%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Power Station'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Solar Battery', 'Luminous', 'Solar C10 Tubular 150Ah', 'Black, Silver', 10, 17999, 'Battery & Power', 'Solar compatible deep-cycle battery', 'https://tse1.mm.bing.net/th?q=Luminous%20Solar%20C10%20Tubular%20150Ah%20Solar%20Battery%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Solar Battery'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'UPS', 'APC', 'BX1100C-IN 1100VA', 'Black, Silver', 18, 6499, 'Battery & Power', 'Automatic voltage regulation backup', 'https://tse1.mm.bing.net/th?q=APC%20BX1100C-IN%201100VA%20UPS%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('UPS'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Emergency Light', 'Wipro', 'Coral Rechargeable LED Light', 'Black, Silver', 35, 1299, 'Battery & Power', 'Rechargeable LED, power cut backup', 'https://tse1.mm.bing.net/th?q=Wipro%20Coral%20Rechargeable%20LED%20Light%20Emergency%20Light%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Emergency Light'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Programming Books', 'O''Reilly', 'Learning Python 5th Edition', 'Black, Silver', 24, 2499, 'Books & Education', 'Original paperback, reference grade', 'https://tse1.mm.bing.net/th?q=O''Reilly%20Learning%20Python%205th%20Edition%20Programming%20Books%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Programming Books'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'AI Books', 'Pearson', 'Artificial Intelligence A Modern Approach', 'Black, Silver', 18, 1999, 'Books & Education', 'Academic AI textbook', 'https://tse1.mm.bing.net/th?q=Pearson%20Artificial%20Intelligence%20A%20Modern%20Approach%20AI%20Books%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('AI Books'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Data Science Books', 'O''Reilly', 'Python for Data Analysis', 'Black, Silver', 20, 1799, 'Books & Education', 'Practical data science reference', 'https://tse1.mm.bing.net/th?q=O''Reilly%20Python%20for%20Data%20Analysis%20Data%20Science%20Books%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Data Science Books'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Competitive Exam Books', 'Arihant', 'General Knowledge 2026', 'Black, Silver', 50, 399, 'Books & Education', 'Latest exam prep edition', 'https://tse1.mm.bing.net/th?q=Arihant%20General%20Knowledge%202026%20Competitive%20Exam%20Books%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Competitive Exam Books'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'English Speaking Books', 'McGraw Hill', 'Spoken English for India', 'Black, Silver', 45, 299, 'Books & Education', 'Beginner friendly language practice', 'https://tse1.mm.bing.net/th?q=McGraw%20Hill%20Spoken%20English%20for%20India%20English%20Speaking%20Books%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('English Speaking Books'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Bike Cover', 'Autofact', 'Waterproof Bike Cover XL', 'Black, Silver', 42, 699, 'Bike Accessories', 'Dustproof and rain resistant fabric', 'https://tse1.mm.bing.net/th?q=Autofact%20Waterproof%20Bike%20Cover%20XL%20Bike%20Cover%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Bike Cover'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Bike Light', 'NiteRider', 'Swift 300 Front Light', 'Black, Silver', 20, 2499, 'Bike Accessories', 'USB rechargeable, bright LED beam', 'https://tse1.mm.bing.net/th?q=NiteRider%20Swift%20300%20Front%20Light%20Bike%20Light%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Bike Light'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Riding Gloves', 'Rynox', 'Air GT Gloves', 'Black, Silver', 24, 2450, 'Bike Accessories', 'Knuckle protection, breathable mesh', 'https://tse1.mm.bing.net/th?q=Rynox%20Air%20GT%20Gloves%20Riding%20Gloves%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Riding Gloves'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Mobile Holder', 'BOBO', 'BM10H Bike Phone Holder', 'Black, Silver', 35, 899, 'Bike Accessories', '360 degree mount, secure grip', 'https://tse1.mm.bing.net/th?q=BOBO%20BM10H%20Bike%20Phone%20Holder%20Mobile%20Holder%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Mobile Holder'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Bike Lock', 'Godrej', 'Shutter Lock Heavy Duty', 'Black, Silver', 38, 599, 'Bike Accessories', 'Hardened steel security lock', 'https://tse1.mm.bing.net/th?q=Godrej%20Shutter%20Lock%20Heavy%20Duty%20Bike%20Lock%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Bike Lock'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Car Cover', 'Autofurnish', 'Silver Matty Car Body Cover', 'Black, Silver', 25, 1499, 'Car Accessories', 'Water resistant, mirror pocket fit', 'https://tse1.mm.bing.net/th?q=Autofurnish%20Silver%20Matty%20Car%20Body%20Cover%20Car%20Cover%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Car Cover'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Seat Cover', 'Elegant', 'Leatherette Seat Cover Set', 'Black, Silver', 12, 5499, 'Car Accessories', 'Premium leatherette, custom fit', 'https://tse1.mm.bing.net/th?q=Elegant%20Leatherette%20Seat%20Cover%20Set%20Seat%20Cover%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Seat Cover'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Car Perfume', 'Godrej Aer', 'Twist Car Freshener', 'Black, Silver', 80, 299, 'Car Accessories', 'Long lasting fragrance diffuser', 'https://tse1.mm.bing.net/th?q=Godrej%20Aer%20Twist%20Car%20Freshener%20Car%20Perfume%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Car Perfume'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Air Compressor', 'Bergmann', 'Typhoon Digital Inflator', 'Black, Silver', 18, 2499, 'Car Accessories', 'Digital pressure gauge, 12V plug', 'https://tse1.mm.bing.net/th?q=Bergmann%20Typhoon%20Digital%20Inflator%20Air%20Compressor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Air Compressor'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Jump Starter', 'NOCO', 'Boost Plus GB40', 'Black, Silver', 8, 9999, 'Car Accessories', 'Lithium jump starter, safety clamps', 'https://tse1.mm.bing.net/th?q=NOCO%20Boost%20Plus%20GB40%20Jump%20Starter%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Jump Starter'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Gift Cards', 'Amazon Pay', 'Digital Gift Card', 'Black, Silver', 100, 1000, 'E-Commerce Products', 'Instant digital delivery, redeemable balance', 'https://tse1.mm.bing.net/th?q=Amazon%20Pay%20Digital%20Gift%20Card%20Gift%20Cards%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Gift Cards'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Coupons', 'WMS Deals', 'Shopping Coupon Pack', 'Black, Silver', 200, 199, 'E-Commerce Products', 'Digital coupon code bundle', 'https://tse1.mm.bing.net/th?q=WMS%20Deals%20Shopping%20Coupon%20Pack%20Coupons%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Coupons'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Digital Subscription', 'Microsoft', 'Microsoft 365 Personal 1 Year', 'Black, Silver', 40, 4899, 'E-Commerce Products', 'Licensed subscription, digital activation', 'https://tse1.mm.bing.net/th?q=Microsoft%20Microsoft%20365%20Personal%201%20Year%20Digital%20Subscription%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Digital Subscription'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Software License', 'Quick Heal', 'Total Security 1 User 1 Year', 'Black, Silver', 45, 1299, 'E-Commerce Products', 'Original activation key', 'https://tse1.mm.bing.net/th?q=Quick%20Heal%20Total%20Security%201%20User%201%20Year%20Software%20License%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Software License'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Raspberry Pi', 'Raspberry Pi', 'Raspberry Pi 5 8GB', 'Black, Silver', 12, 8999, 'Advanced Tech', 'Official SBC board, 8GB RAM', 'https://tse1.mm.bing.net/th?q=Raspberry%20Pi%20Raspberry%20Pi%205%208GB%20Raspberry%20Pi%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Raspberry Pi'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Arduino Kit', 'Arduino', 'Starter Kit K000007', 'Black, Silver', 14, 7499, 'Advanced Tech', 'Original board kit, project components', 'https://tse1.mm.bing.net/th?q=Arduino%20Starter%20Kit%20K000007%20Arduino%20Kit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Arduino Kit'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'IoT Sensor', 'Bosch', 'BME680 Environmental Sensor', 'Black, Silver', 30, 1999, 'Advanced Tech', 'Gas, humidity, pressure and temperature sensing', 'https://tse1.mm.bing.net/th?q=Bosch%20BME680%20Environmental%20Sensor%20IoT%20Sensor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('IoT Sensor'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'AI Camera', 'Hikvision', 'AcuSense 4MP IP Camera', 'Black, Silver', 16, 8999, 'Advanced Tech', 'AI human detection, night vision', 'https://tse1.mm.bing.net/th?q=Hikvision%20AcuSense%204MP%20IP%20Camera%20AI%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('AI Camera'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Robotics Kit', 'Makeblock', 'Ultimate 2.0 Robot Kit', 'Black, Silver', 6, 29999, 'Advanced Tech', 'Aluminium frame, programmable robotics', 'https://tse1.mm.bing.net/th?q=Makeblock%20Ultimate%202.0%20Robot%20Kit%20Robotics%20Kit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Robotics Kit'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Conveyor Motor', 'Bonfiglioli', 'C Series Geared Motor', 'Black, Silver', 5, 34999, 'Industrial Equipment', 'Industrial duty geared motor', 'https://tse1.mm.bing.net/th?q=Bonfiglioli%20C%20Series%20Geared%20Motor%20Conveyor%20Motor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Conveyor Motor'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Warehouse Robot', 'MiR', 'MiR100 Autonomous Mobile Robot', 'Black, Silver', 2, 899999, 'Industrial Equipment', 'Autonomous warehouse transport robot', 'https://tse1.mm.bing.net/th?q=MiR%20MiR100%20Autonomous%20Mobile%20Robot%20Warehouse%20Robot%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Warehouse Robot'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'RFID Tag', 'Zebra', 'Z-Select RFID Label Roll', 'Black, Silver', 100, 1499, 'Industrial Equipment', 'UHF RFID labels for inventory tracking', 'https://tse1.mm.bing.net/th?q=Zebra%20Z-Select%20RFID%20Label%20Roll%20RFID%20Tag%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('RFID Tag'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Scanner', 'Zebra', 'DS2278 Wireless Scanner', 'Black, Silver', 12, 15999, 'Industrial Equipment', '2D barcode scanning, Bluetooth cradle', 'https://tse1.mm.bing.net/th?q=Zebra%20DS2278%20Wireless%20Scanner%20Smart%20Scanner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Scanner'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Label Machine', 'Brother', 'PT-D210 Label Maker', 'Black, Silver', 18, 3999, 'Industrial Equipment', 'Thermal label printing, office grade', 'https://tse1.mm.bing.net/th?q=Brother%20PT-D210%20Label%20Maker%20Label%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Label Machine'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Aquarium', 'Sobo', 'Glass Aquarium 2ft', 'Black, Silver', 10, 3499, 'Aquarium & Pets', 'Clear glass tank, home aquarium setup', 'https://tse1.mm.bing.net/th?q=Sobo%20Glass%20Aquarium%202ft%20Aquarium%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Aquarium'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Fish Tank Light', 'Hygger', 'Clip-On LED Aquarium Light', 'Black, Silver', 18, 1999, 'Aquarium & Pets', 'Full spectrum LED, adjustable brightness', 'https://tse1.mm.bing.net/th?q=Hygger%20Clip-On%20LED%20Aquarium%20Light%20Fish%20Tank%20Light%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Fish Tank Light'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Pet Food', 'Pedigree', 'Adult Chicken & Vegetables 3kg', 'Black, Silver', 60, 799, 'Aquarium & Pets', 'Sealed nutrition pack', 'https://tse1.mm.bing.net/th?q=Pedigree%20Adult%20Chicken%20%26%20Vegetables%203kg%20Pet%20Food%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Pet Food'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Pet Bed', 'Heads Up For Tails', 'Donut Plush Pet Bed', 'Black, Silver', 20, 1999, 'Aquarium & Pets', 'Soft washable plush bed', 'https://tse1.mm.bing.net/th?q=Heads%20Up%20For%20Tails%20Donut%20Plush%20Pet%20Bed%20Pet%20Bed%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Pet Bed'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Dog Leash', 'Trixie', 'Classic Nylon Leash', 'Black, Silver', 45, 499, 'Aquarium & Pets', 'Durable nylon, strong metal hook', 'https://tse1.mm.bing.net/th?q=Trixie%20Classic%20Nylon%20Leash%20Dog%20Leash%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Dog Leash'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Mop', 'Scotch-Brite', '2-in-1 Spin Mop', 'Black, Silver', 35, 1499, 'Cleaning Products', 'Microfiber mop, bucket wringer', 'https://tse1.mm.bing.net/th?q=Scotch-Brite%202-in-1%20Spin%20Mop%20Mop%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Mop'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Floor Cleaner', 'Lizol', 'Disinfectant Surface Cleaner 2L', 'Black, Silver', 90, 399, 'Cleaning Products', 'Disinfectant liquid, sealed bottle', 'https://tse1.mm.bing.net/th?q=Lizol%20Disinfectant%20Surface%20Cleaner%202L%20Floor%20Cleaner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Floor Cleaner'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Glass Cleaner', 'Colin', 'Glass Cleaner Spray 500ml', 'Black, Silver', 100, 149, 'Cleaning Products', 'Streak-free glass cleaning', 'https://tse1.mm.bing.net/th?q=Colin%20Glass%20Cleaner%20Spray%20500ml%20Glass%20Cleaner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Glass Cleaner'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Vacuum Robot', 'iRobot', 'Roomba i2', 'Black, Silver', 8, 24999, 'Cleaning Products', 'Smart navigation, automatic cleaning', 'https://tse1.mm.bing.net/th?q=iRobot%20Roomba%20i2%20Vacuum%20Robot%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Vacuum Robot'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Desk', 'IKEA', 'IDASEN Sit-Stand Desk', 'Black, Silver', 5, 49999, 'Smart Furniture', 'Electric height adjustment, sturdy frame', 'https://tse1.mm.bing.net/th?q=IKEA%20IDASEN%20Sit-Stand%20Desk%20Smart%20Desk%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Desk'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Electric Chair', 'Sleepyhead', 'RX5 Motorized Recliner', 'Black, Silver', 6, 39999, 'Smart Furniture', 'Motorized recline, cushioned leatherette', 'https://tse1.mm.bing.net/th?q=Sleepyhead%20RX5%20Motorized%20Recliner%20Electric%20Chair%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Electric Chair'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Adjustable Bed', 'Duroflex', 'Elevate Adjustable Bed', 'Black, Silver', 4, 79999, 'Smart Furniture', 'Motorized head and foot adjustment', 'https://tse1.mm.bing.net/th?q=Duroflex%20Elevate%20Adjustable%20Bed%20Adjustable%20Bed%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Adjustable Bed'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Cabinet', 'Godrej Interio', 'Smart Lock Storage Cabinet', 'Black, Silver', 8, 24999, 'Smart Furniture', 'Digital lock, steel storage body', 'https://tse1.mm.bing.net/th?q=Godrej%20Interio%20Smart%20Lock%20Storage%20Cabinet%20Smart%20Cabinet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Cabinet'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Mac Pro', 'Apple', 'Mac Pro M2 Ultra', 'Black, Silver', 2, 729900, 'Ultra Premium Products', 'Workstation grade Apple silicon desktop', 'https://tse1.mm.bing.net/th?q=Apple%20Mac%20Pro%20M2%20Ultra%20Mac%20Pro%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Mac Pro'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Alienware Laptop', 'Dell', 'Alienware m18 R2', 'Black, Silver', 3, 349990, 'Ultra Premium Products', 'High-end gaming laptop, RTX graphics', 'https://tse1.mm.bing.net/th?q=Dell%20Alienware%20m18%20R2%20Alienware%20Laptop%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Alienware Laptop'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Tesla Accessories', 'Tesla', 'Wall Connector Gen 3', 'Black, Silver', 5, 49999, 'Ultra Premium Products', 'EV charging accessory, Wi-Fi enabled', 'https://tse1.mm.bing.net/th?q=Tesla%20Wall%20Connector%20Gen%203%20Tesla%20Accessories%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Tesla Accessories'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Apple Vision Pro', 'Apple', 'Vision Pro 256GB', 'Black, Silver', 2, 349900, 'Ultra Premium Products', 'Spatial computing headset, micro-OLED display', 'https://tse1.mm.bing.net/th?q=Apple%20Vision%20Pro%20256GB%20Apple%20Vision%20Pro%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Apple Vision Pro'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'DJI Drone', 'DJI', 'Mini 4 Pro Fly More Combo', 'Black, Silver', 4, 109999, 'Ultra Premium Products', '4K camera drone, obstacle sensing', 'https://tse1.mm.bing.net/th?q=DJI%20Mini%204%20Pro%20Fly%20More%20Combo%20DJI%20Drone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('DJI Drone'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'AI Assistant Device', 'Amazon', 'Echo Show 8 3rd Gen', 'Black, Silver', 12, 13999, 'Future Ready Products', 'Voice assistant smart display', 'https://tse1.mm.bing.net/th?q=Amazon%20Echo%20Show%208%203rd%20Gen%20AI%20Assistant%20Device%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('AI Assistant Device'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Smart Glasses', 'Ray-Ban Meta', 'Wayfarer Smart Glasses', 'Black, Silver', 7, 32999, 'Future Ready Products', 'Camera, speakers and AI assistant support', 'https://tse1.mm.bing.net/th?q=Ray-Ban%20Meta%20Wayfarer%20Smart%20Glasses%20Smart%20Glasses%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Smart Glasses'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Hologram Projector', 'Looking Glass', 'Portrait 3D Display', 'Black, Silver', 4, 64999, 'Future Ready Products', 'Glasses-free 3D holographic display', 'https://tse1.mm.bing.net/th?q=Looking%20Glass%20Portrait%203D%20Display%20Hologram%20Projector%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Hologram Projector'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Digital Whiteboard', 'Samsung', 'Flip Pro WM65B', 'Black, Silver', 3, 159999, 'Future Ready Products', 'Interactive 4K collaboration display', 'https://tse1.mm.bing.net/th?q=Samsung%20Flip%20Pro%20WM65B%20Digital%20Whiteboard%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Digital Whiteboard'));

INSERT INTO products (name, brand, model, colors, quantity, price, category, quality, photo)
SELECT 'Robot Assistant', 'Temi', 'Personal Robot V3', 'Black, Silver', 2, 299999, 'Future Ready Products', 'Autonomous assistant robot with display', 'https://tse1.mm.bing.net/th?q=Temi%20Personal%20Robot%20V3%20Robot%20Assistant%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE LOWER(name) = LOWER('Robot Assistant'));

-- Restock existing catalog products and fill real model/price/quality/photo fields.
UPDATE products
SET brand = 'WMS Catalog',
    model = 'LED Television Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 27999 ELSE price END,
    category = 'Electronics',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20LED%20Television%20Standard%20LED%20Television%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('LED Television');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Home Projector Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 18999 ELSE price END,
    category = 'Electronics',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Home%20Projector%20Standard%20Home%20Projector%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Home Projector');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Bluetooth Audio Receiver Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Electronics',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Bluetooth%20Audio%20Receiver%20Standard%20Bluetooth%20Audio%20Receiver%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Bluetooth Audio Receiver');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Digital Alarm Clock Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 999 ELSE price END,
    category = 'Electronics',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Digital%20Alarm%20Clock%20Standard%20Digital%20Alarm%20Clock%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Digital Alarm Clock');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Mobile Phone Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 12999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mobile%20Phone%20Standard%20Mobile%20Phone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Mobile Phone');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smartphone Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 17999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smartphone%20Standard%20Smartphone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smartphone');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Gaming Phone Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 34999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Phone%20Standard%20Gaming%20Phone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Gaming Phone');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Tablet Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 21999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Tablet%20Standard%20Tablet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Tablet');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'iPad Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 44999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20iPad%20Standard%20iPad%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('iPad');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Laptop Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 54999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Laptop%20Standard%20Laptop%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Laptop');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Gaming Laptop Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 89999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Laptop%20Standard%20Gaming%20Laptop%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Gaming Laptop');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Business Laptop Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 64999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Business%20Laptop%20Standard%20Business%20Laptop%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Business Laptop');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Chromebook Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 28999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Chromebook%20Standard%20Chromebook%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Chromebook');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'MacBook Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 99999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20MacBook%20Standard%20MacBook%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('MacBook');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Desktop PC Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 45999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Desktop%20PC%20Standard%20Desktop%20PC%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Desktop PC');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'All-in-One PC Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 59999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20All-in-One%20PC%20Standard%20All-in-One%20PC%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('All-in-One PC');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Mini PC Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 32999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mini%20PC%20Standard%20Mini%20PC%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Mini PC');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Monitor Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 11999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Monitor%20Standard%20Monitor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Monitor');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Curved Monitor Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 24999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Curved%20Monitor%20Standard%20Curved%20Monitor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Curved Monitor');

UPDATE products
SET brand = 'WMS Catalog',
    model = '4K Monitor Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 32999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%204K%20Monitor%20Standard%204K%20Monitor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('4K Monitor');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smart TV Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 34999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20TV%20Standard%20Smart%20TV%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart TV');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Android TV Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 29999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Android%20TV%20Standard%20Android%20TV%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Android TV');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'OLED TV Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 99999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20OLED%20TV%20Standard%20OLED%20TV%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('OLED TV');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'QLED TV Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 79999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20QLED%20TV%20Standard%20QLED%20TV%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('QLED TV');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Projector Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 27999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Projector%20Standard%20Projector%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Projector');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Webcam Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Webcam%20Standard%20Webcam%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Webcam');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Digital Camera Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 28999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Digital%20Camera%20Standard%20Digital%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Digital Camera');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'DSLR Camera Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 54999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20DSLR%20Camera%20Standard%20DSLR%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('DSLR Camera');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Mirrorless Camera Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 74999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mirrorless%20Camera%20Standard%20Mirrorless%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Mirrorless Camera');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'CCTV Camera Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20CCTV%20Camera%20Standard%20CCTV%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('CCTV Camera');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Security Camera Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Security%20Camera%20Standard%20Security%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Security Camera');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Drone Camera Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 69999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Drone%20Camera%20Standard%20Drone%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Drone Camera');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Printer Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 8999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Printer%20Standard%20Printer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Printer');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Scanner Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 7999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Scanner%20Standard%20Scanner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Scanner');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Photocopier Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 45999 ELSE price END,
    category = 'Electronics Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Photocopier%20Standard%20Photocopier%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Photocopier');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Android Smartphone Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 15999 ELSE price END,
    category = 'Mobiles',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Android%20Smartphone%20Standard%20Android%20Smartphone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Android Smartphone');

UPDATE products
SET brand = 'WMS Catalog',
    model = '5G Smartphone Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 22999 ELSE price END,
    category = 'Mobiles',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%205G%20Smartphone%20Standard%205G%20Smartphone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('5G Smartphone');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Feature Phone Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Mobiles',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Feature%20Phone%20Standard%20Feature%20Phone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Feature Phone');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Rugged Mobile Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 11999 ELSE price END,
    category = 'Mobiles',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Rugged%20Mobile%20Standard%20Rugged%20Mobile%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Rugged Mobile');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Mobile Charger Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 799 ELSE price END,
    category = 'Mobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mobile%20Charger%20Standard%20Mobile%20Charger%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Mobile Charger');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Fast Charger Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1199 ELSE price END,
    category = 'Mobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Fast%20Charger%20Standard%20Fast%20Charger%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Fast Charger');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Wireless Charger Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1699 ELSE price END,
    category = 'Mobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Wireless%20Charger%20Standard%20Wireless%20Charger%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Wireless Charger');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'USB Cable Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 299 ELSE price END,
    category = 'Mobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20USB%20Cable%20Standard%20USB%20Cable%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('USB Cable');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Type-C Cable Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 399 ELSE price END,
    category = 'Mobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Type-C%20Cable%20Standard%20Type-C%20Cable%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Type-C Cable');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Lightning Cable Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 799 ELSE price END,
    category = 'Mobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Lightning%20Cable%20Standard%20Lightning%20Cable%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Lightning Cable');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'OTG Cable Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 249 ELSE price END,
    category = 'Mobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20OTG%20Cable%20Standard%20OTG%20Cable%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('OTG Cable');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Power Bank Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Mobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Power%20Bank%20Standard%20Power%20Bank%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Power Bank');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Mobile Cover Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 499 ELSE price END,
    category = 'Mobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mobile%20Cover%20Standard%20Mobile%20Cover%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Mobile Cover');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Phone Case Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 599 ELSE price END,
    category = 'Mobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Phone%20Case%20Standard%20Phone%20Case%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Phone Case');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Tempered Glass Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 299 ELSE price END,
    category = 'Mobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Tempered%20Glass%20Standard%20Tempered%20Glass%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Tempered Glass');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Screen Protector Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 249 ELSE price END,
    category = 'Mobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Screen%20Protector%20Standard%20Screen%20Protector%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Screen Protector');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Selfie Stick Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 799 ELSE price END,
    category = 'Mobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Selfie%20Stick%20Standard%20Selfie%20Stick%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Selfie Stick');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Mobile Stand Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 349 ELSE price END,
    category = 'Mobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mobile%20Stand%20Standard%20Mobile%20Stand%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Mobile Stand');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Car Charger Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 899 ELSE price END,
    category = 'Mobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Car%20Charger%20Standard%20Car%20Charger%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Car Charger');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Earbuds Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Audio Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Earbuds%20Standard%20Earbuds%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Earbuds');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'TWS Earbuds Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Audio Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20TWS%20Earbuds%20Standard%20TWS%20Earbuds%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('TWS Earbuds');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Neckband Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1299 ELSE price END,
    category = 'Audio Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Neckband%20Standard%20Neckband%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Neckband');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Headphones Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Audio Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Headphones%20Standard%20Headphones%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Headphones');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Gaming Headset Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3499 ELSE price END,
    category = 'Audio Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Headset%20Standard%20Gaming%20Headset%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Gaming Headset');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Bluetooth Speaker Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Audio Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Bluetooth%20Speaker%20Standard%20Bluetooth%20Speaker%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Bluetooth Speaker');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Soundbar Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 7999 ELSE price END,
    category = 'Audio Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Soundbar%20Standard%20Soundbar%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Soundbar');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Home Theater Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 19999 ELSE price END,
    category = 'Audio Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Home%20Theater%20Standard%20Home%20Theater%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Home Theater');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Wireless Mic Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2999 ELSE price END,
    category = 'Audio Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Wireless%20Mic%20Standard%20Wireless%20Mic%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Wireless Mic');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Studio Mic Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 5999 ELSE price END,
    category = 'Audio Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Studio%20Mic%20Standard%20Studio%20Mic%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Studio Mic');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Laptop Sleeve Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 799 ELSE price END,
    category = 'Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Laptop%20Sleeve%20Standard%20Laptop%20Sleeve%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Laptop Sleeve');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Cable Organizer Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 299 ELSE price END,
    category = 'Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Cable%20Organizer%20Standard%20Cable%20Organizer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Cable Organizer');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Desk Organizer Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 699 ELSE price END,
    category = 'Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Desk%20Organizer%20Standard%20Desk%20Organizer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Desk Organizer');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Universal Adapter Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 899 ELSE price END,
    category = 'Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Universal%20Adapter%20Standard%20Universal%20Adapter%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Universal Adapter');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Keyboard Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 999 ELSE price END,
    category = 'Computer Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Keyboard%20Standard%20Keyboard%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Keyboard');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Mechanical Keyboard Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3499 ELSE price END,
    category = 'Computer Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mechanical%20Keyboard%20Standard%20Mechanical%20Keyboard%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Mechanical Keyboard');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Gaming Keyboard Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2999 ELSE price END,
    category = 'Computer Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Keyboard%20Standard%20Gaming%20Keyboard%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Gaming Keyboard');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Mouse Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 599 ELSE price END,
    category = 'Computer Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mouse%20Standard%20Mouse%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Mouse');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Gaming Mouse Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Computer Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Mouse%20Standard%20Gaming%20Mouse%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Gaming Mouse');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Mouse Pad Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 299 ELSE price END,
    category = 'Computer Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mouse%20Pad%20Standard%20Mouse%20Pad%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Mouse Pad');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Graphic Tablet Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 5999 ELSE price END,
    category = 'Computer Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Graphic%20Tablet%20Standard%20Graphic%20Tablet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Graphic Tablet');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'USB Hub Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 999 ELSE price END,
    category = 'Computer Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20USB%20Hub%20Standard%20USB%20Hub%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('USB Hub');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Docking Station Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3999 ELSE price END,
    category = 'Computer Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Docking%20Station%20Standard%20Docking%20Station%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Docking Station');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Laptop Cooling Pad Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1299 ELSE price END,
    category = 'Computer Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Laptop%20Cooling%20Pad%20Standard%20Laptop%20Cooling%20Pad%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Laptop Cooling Pad');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'RAM Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Computer Components',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20RAM%20Standard%20RAM%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('RAM');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'DDR4 RAM Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2799 ELSE price END,
    category = 'Computer Components',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20DDR4%20RAM%20Standard%20DDR4%20RAM%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('DDR4 RAM');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'DDR5 RAM Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4999 ELSE price END,
    category = 'Computer Components',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20DDR5%20RAM%20Standard%20DDR5%20RAM%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('DDR5 RAM');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'SSD Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3499 ELSE price END,
    category = 'Computer Components',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20SSD%20Standard%20SSD%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('SSD');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'NVMe SSD Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4999 ELSE price END,
    category = 'Computer Components',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20NVMe%20SSD%20Standard%20NVMe%20SSD%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('NVMe SSD');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'HDD Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3499 ELSE price END,
    category = 'Computer Components',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20HDD%20Standard%20HDD%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('HDD');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'External HDD Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4999 ELSE price END,
    category = 'Computer Components',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20External%20HDD%20Standard%20External%20HDD%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('External HDD');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'External SSD Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 6999 ELSE price END,
    category = 'Computer Components',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20External%20SSD%20Standard%20External%20SSD%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('External SSD');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Graphics Card Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 24999 ELSE price END,
    category = 'Computer Components',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Graphics%20Card%20Standard%20Graphics%20Card%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Graphics Card');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Processor Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 15999 ELSE price END,
    category = 'Computer Components',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Processor%20Standard%20Processor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Processor');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Motherboard Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 8999 ELSE price END,
    category = 'Computer Components',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Motherboard%20Standard%20Motherboard%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Motherboard');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Power Supply Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3999 ELSE price END,
    category = 'Computer Components',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Power%20Supply%20Standard%20Power%20Supply%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Power Supply');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'CPU Cooler Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Computer Components',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20CPU%20Cooler%20Standard%20CPU%20Cooler%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('CPU Cooler');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Cabinet Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3499 ELSE price END,
    category = 'Computer Components',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Cabinet%20Standard%20Cabinet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Cabinet');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'WiFi Card Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Computer Components',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20WiFi%20Card%20Standard%20WiFi%20Card%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('WiFi Card');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'WiFi Router Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Networking Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20WiFi%20Router%20Standard%20WiFi%20Router%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('WiFi Router');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Gaming Router Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 6999 ELSE price END,
    category = 'Networking Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Router%20Standard%20Gaming%20Router%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Gaming Router');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Modem Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1799 ELSE price END,
    category = 'Networking Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Modem%20Standard%20Modem%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Modem');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'LAN Cable Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 299 ELSE price END,
    category = 'Networking Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20LAN%20Cable%20Standard%20LAN%20Cable%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('LAN Cable');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Ethernet Cable Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 299 ELSE price END,
    category = 'Networking Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Ethernet%20Cable%20Standard%20Ethernet%20Cable%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Ethernet Cable');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Network Switch Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Networking Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Network%20Switch%20Standard%20Network%20Switch%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Network Switch');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Access Point Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3999 ELSE price END,
    category = 'Networking Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Access%20Point%20Standard%20Access%20Point%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Access Point');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'WiFi Extender Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Networking Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20WiFi%20Extender%20Standard%20WiFi%20Extender%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('WiFi Extender');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Gaming Console Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 39999 ELSE price END,
    category = 'Gaming',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Console%20Standard%20Gaming%20Console%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Gaming Console');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Arcade Stick Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4999 ELSE price END,
    category = 'Gaming',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Arcade%20Stick%20Standard%20Arcade%20Stick%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Arcade Stick');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Gaming Capture Dock Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 7999 ELSE price END,
    category = 'Gaming',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Capture%20Dock%20Standard%20Gaming%20Capture%20Dock%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Gaming Capture Dock');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Gaming Mouse Pad XL Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 999 ELSE price END,
    category = 'Gaming',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Mouse%20Pad%20XL%20Standard%20Gaming%20Mouse%20Pad%20XL%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Gaming Mouse Pad XL');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'PlayStation 5 Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 54999 ELSE price END,
    category = 'Gaming Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20PlayStation%205%20Standard%20PlayStation%205%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('PlayStation 5');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Xbox Series X Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 52999 ELSE price END,
    category = 'Gaming Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Xbox%20Series%20X%20Standard%20Xbox%20Series%20X%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Xbox Series X');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Nintendo Switch Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 32999 ELSE price END,
    category = 'Gaming Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Nintendo%20Switch%20Standard%20Nintendo%20Switch%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Nintendo Switch');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Gaming Chair Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 12999 ELSE price END,
    category = 'Gaming Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Chair%20Standard%20Gaming%20Chair%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Gaming Chair');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Gaming Desk Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 9999 ELSE price END,
    category = 'Gaming Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Desk%20Standard%20Gaming%20Desk%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Gaming Desk');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Gaming Controller Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3499 ELSE price END,
    category = 'Gaming Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gaming%20Controller%20Standard%20Gaming%20Controller%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Gaming Controller');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'VR Headset Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 29999 ELSE price END,
    category = 'Gaming Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20VR%20Headset%20Standard%20VR%20Headset%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('VR Headset');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Steering Wheel Controller Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 14999 ELSE price END,
    category = 'Gaming Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Steering%20Wheel%20Controller%20Standard%20Steering%20Wheel%20Controller%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Steering Wheel Controller');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smart Watch Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4999 ELSE price END,
    category = 'Smart Devices',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Watch%20Standard%20Smart%20Watch%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Watch');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Fitness Band Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Smart Devices',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Fitness%20Band%20Standard%20Fitness%20Band%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Fitness Band');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smart Ring Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 9999 ELSE price END,
    category = 'Smart Devices',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Ring%20Standard%20Smart%20Ring%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Ring');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smart Bulb Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 699 ELSE price END,
    category = 'Smart Devices',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Bulb%20Standard%20Smart%20Bulb%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Bulb');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smart Plug Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 999 ELSE price END,
    category = 'Smart Devices',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Plug%20Standard%20Smart%20Plug%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Plug');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smart Lock Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 8999 ELSE price END,
    category = 'Smart Devices',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Lock%20Standard%20Smart%20Lock%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Lock');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Alexa Speaker Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4499 ELSE price END,
    category = 'Smart Devices',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Alexa%20Speaker%20Standard%20Alexa%20Speaker%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Alexa Speaker');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Google Nest Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 5999 ELSE price END,
    category = 'Smart Devices',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Google%20Nest%20Standard%20Google%20Nest%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Google Nest');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smart Doorbell Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 7999 ELSE price END,
    category = 'Smart Devices',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Doorbell%20Standard%20Smart%20Doorbell%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Doorbell');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Office File Cabinet Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 6499 ELSE price END,
    category = 'Office',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Office%20File%20Cabinet%20Standard%20Office%20File%20Cabinet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Office File Cabinet');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Office Desk Lamp Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Office',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Office%20Desk%20Lamp%20Standard%20Office%20Desk%20Lamp%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Office Desk Lamp');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Conference Phone Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 8999 ELSE price END,
    category = 'Office',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Conference%20Phone%20Standard%20Conference%20Phone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Conference Phone');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Document Shredder Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 5999 ELSE price END,
    category = 'Office',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Document%20Shredder%20Standard%20Document%20Shredder%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Document Shredder');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Office Chair Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 5499 ELSE price END,
    category = 'Office Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Office%20Chair%20Standard%20Office%20Chair%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Office Chair');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Ergonomic Chair Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 8999 ELSE price END,
    category = 'Office Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Ergonomic%20Chair%20Standard%20Ergonomic%20Chair%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Ergonomic Chair');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Office Table Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 7499 ELSE price END,
    category = 'Office Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Office%20Table%20Standard%20Office%20Table%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Office Table');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Study Table Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3999 ELSE price END,
    category = 'Office Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Study%20Table%20Standard%20Study%20Table%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Study Table');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Whiteboard Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Office Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Whiteboard%20Standard%20Whiteboard%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Whiteboard');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Attendance Machine Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 5999 ELSE price END,
    category = 'Office Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Attendance%20Machine%20Standard%20Attendance%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Attendance Machine');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Barcode Scanner Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3499 ELSE price END,
    category = 'Office Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Barcode%20Scanner%20Standard%20Barcode%20Scanner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Barcode Scanner');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Label Printer Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 6999 ELSE price END,
    category = 'Office Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Label%20Printer%20Standard%20Label%20Printer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Label Printer');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'POS Machine Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 14999 ELSE price END,
    category = 'Office Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20POS%20Machine%20Standard%20POS%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('POS Machine');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Refrigerator Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 24999 ELSE price END,
    category = 'Home Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Refrigerator%20Standard%20Refrigerator%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Refrigerator');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Washing Machine Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 21999 ELSE price END,
    category = 'Home Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Washing%20Machine%20Standard%20Washing%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Washing Machine');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Microwave Oven Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 8999 ELSE price END,
    category = 'Home Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Microwave%20Oven%20Standard%20Microwave%20Oven%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Microwave Oven');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Air Conditioner Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 34999 ELSE price END,
    category = 'Home Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Air%20Conditioner%20Standard%20Air%20Conditioner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Air Conditioner');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Air Cooler Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 8999 ELSE price END,
    category = 'Home Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Air%20Cooler%20Standard%20Air%20Cooler%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Air Cooler');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Water Purifier Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 9999 ELSE price END,
    category = 'Home Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Water%20Purifier%20Standard%20Water%20Purifier%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Water Purifier');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Vacuum Cleaner Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 6999 ELSE price END,
    category = 'Home Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Vacuum%20Cleaner%20Standard%20Vacuum%20Cleaner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Vacuum Cleaner');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Dishwasher Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 39999 ELSE price END,
    category = 'Home Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Dishwasher%20Standard%20Dishwasher%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Dishwasher');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Geyser Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 7999 ELSE price END,
    category = 'Home Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Geyser%20Standard%20Geyser%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Geyser');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Induction Cooker Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2999 ELSE price END,
    category = 'Home Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Induction%20Cooker%20Standard%20Induction%20Cooker%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Induction Cooker');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Electric Kettle Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Home Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Electric%20Kettle%20Standard%20Electric%20Kettle%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Electric Kettle');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Mixer Grinder Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3999 ELSE price END,
    category = 'Home Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mixer%20Grinder%20Standard%20Mixer%20Grinder%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Mixer Grinder');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Ceiling Fan Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Home Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Ceiling%20Fan%20Standard%20Ceiling%20Fan%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Ceiling Fan');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Table Fan Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1799 ELSE price END,
    category = 'Home Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Table%20Fan%20Standard%20Table%20Fan%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Table Fan');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Room Heater Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Room%20Heater%20Standard%20Room%20Heater%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Room Heater');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Steam Iron Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1299 ELSE price END,
    category = 'Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Steam%20Iron%20Standard%20Steam%20Iron%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Steam Iron');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Hand Blender Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1899 ELSE price END,
    category = 'Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Hand%20Blender%20Standard%20Hand%20Blender%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Hand Blender');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Electric Chopper Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1599 ELSE price END,
    category = 'Appliances',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Electric%20Chopper%20Standard%20Electric%20Chopper%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Electric Chopper');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Sofa Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 24999 ELSE price END,
    category = 'Furniture',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Sofa%20Standard%20Sofa%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Sofa');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Recliner Sofa Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 39999 ELSE price END,
    category = 'Furniture',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Recliner%20Sofa%20Standard%20Recliner%20Sofa%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Recliner Sofa');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Bed Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 19999 ELSE price END,
    category = 'Furniture',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Bed%20Standard%20Bed%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Bed');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Mattress Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 8999 ELSE price END,
    category = 'Furniture',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mattress%20Standard%20Mattress%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Mattress');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Dining Table Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 18999 ELSE price END,
    category = 'Furniture',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Dining%20Table%20Standard%20Dining%20Table%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Dining Table');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Wardrobe Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 16999 ELSE price END,
    category = 'Furniture',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Wardrobe%20Standard%20Wardrobe%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Wardrobe');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Cupboard Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 9999 ELSE price END,
    category = 'Furniture',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Cupboard%20Standard%20Cupboard%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Cupboard');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Bookshelf Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4999 ELSE price END,
    category = 'Furniture',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Bookshelf%20Standard%20Bookshelf%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Bookshelf');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'TV Unit Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 7999 ELSE price END,
    category = 'Furniture',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20TV%20Unit%20Standard%20TV%20Unit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('TV Unit');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Shoe Rack Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3499 ELSE price END,
    category = 'Furniture',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Shoe%20Rack%20Standard%20Shoe%20Rack%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Shoe Rack');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Fitness Tracker Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Wearables',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Fitness%20Tracker%20Standard%20Fitness%20Tracker%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Fitness Tracker');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'VR Glasses Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 12999 ELSE price END,
    category = 'Wearables',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20VR%20Glasses%20Standard%20VR%20Glasses%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('VR Glasses');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'AR Glasses Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 49999 ELSE price END,
    category = 'Wearables',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20AR%20Glasses%20Standard%20AR%20Glasses%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('AR Glasses');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Pendrive Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 599 ELSE price END,
    category = 'Storage Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Pendrive%20Standard%20Pendrive%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Pendrive');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Memory Card Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 799 ELSE price END,
    category = 'Storage Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Memory%20Card%20Standard%20Memory%20Card%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Memory Card');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'NAS Storage Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 29999 ELSE price END,
    category = 'Storage Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20NAS%20Storage%20Standard%20NAS%20Storage%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('NAS Storage');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Hard Disk Enclosure Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 999 ELSE price END,
    category = 'Storage Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Hard%20Disk%20Enclosure%20Standard%20Hard%20Disk%20Enclosure%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Hard Disk Enclosure');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Car Vacuum Cleaner Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Automobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Car%20Vacuum%20Cleaner%20Standard%20Car%20Vacuum%20Cleaner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Car Vacuum Cleaner');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Dash Camera Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4999 ELSE price END,
    category = 'Automobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Dash%20Camera%20Standard%20Dash%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Dash Camera');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Car Stereo Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 6999 ELSE price END,
    category = 'Automobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Car%20Stereo%20Standard%20Car%20Stereo%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Car Stereo');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'GPS Tracker Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2999 ELSE price END,
    category = 'Automobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20GPS%20Tracker%20Standard%20GPS%20Tracker%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('GPS Tracker');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Bike Helmet Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Automobile Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Bike%20Helmet%20Standard%20Bike%20Helmet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Bike Helmet');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Air Fryer Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 7999 ELSE price END,
    category = 'Kitchen Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Air%20Fryer%20Standard%20Air%20Fryer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Air Fryer');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Coffee Machine Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 9999 ELSE price END,
    category = 'Kitchen Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Coffee%20Machine%20Standard%20Coffee%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Coffee Machine');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Toaster Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Kitchen Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Toaster%20Standard%20Toaster%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Toaster');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Rice Cooker Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2999 ELSE price END,
    category = 'Kitchen Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Rice%20Cooker%20Standard%20Rice%20Cooker%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Rice Cooker');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Juicer Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3499 ELSE price END,
    category = 'Kitchen Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Juicer%20Standard%20Juicer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Juicer');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Hair Dryer Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Beauty & Personal Care',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Hair%20Dryer%20Standard%20Hair%20Dryer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Hair Dryer');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Hair Straightener Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Beauty & Personal Care',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Hair%20Straightener%20Standard%20Hair%20Straightener%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Hair Straightener');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Trimmer Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1299 ELSE price END,
    category = 'Beauty & Personal Care',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Trimmer%20Standard%20Trimmer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Trimmer');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Electric Toothbrush Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Beauty & Personal Care',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Electric%20Toothbrush%20Standard%20Electric%20Toothbrush%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Electric Toothbrush');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Shaver Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Beauty & Personal Care',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Shaver%20Standard%20Shaver%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Shaver');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Action Camera Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 12999 ELSE price END,
    category = 'Camera & Photography',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Action%20Camera%20Standard%20Action%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Action Camera');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'GoPro Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 34999 ELSE price END,
    category = 'Camera & Photography',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20GoPro%20Standard%20GoPro%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('GoPro');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Camera Lens Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 18999 ELSE price END,
    category = 'Camera & Photography',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Camera%20Lens%20Standard%20Camera%20Lens%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Camera Lens');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Tripod Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Camera & Photography',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Tripod%20Standard%20Tripod%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Tripod');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Ring Light Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Camera & Photography',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Ring%20Light%20Standard%20Ring%20Light%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Ring Light');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Studio Light Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4999 ELSE price END,
    category = 'Camera & Photography',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Studio%20Light%20Standard%20Studio%20Light%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Studio Light');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Gimbal Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 7999 ELSE price END,
    category = 'Camera & Photography',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Gimbal%20Standard%20Gimbal%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Gimbal');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Camera Battery Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Camera & Photography',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Camera%20Battery%20Standard%20Camera%20Battery%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Camera Battery');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Memory Card Reader Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 699 ELSE price END,
    category = 'Camera & Photography',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Memory%20Card%20Reader%20Standard%20Memory%20Card%20Reader%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Memory Card Reader');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smart Door Lock Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 8999 ELSE price END,
    category = 'Smart Home',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Door%20Lock%20Standard%20Smart%20Door%20Lock%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Door Lock');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Video Doorbell Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 6999 ELSE price END,
    category = 'Smart Home',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Video%20Doorbell%20Standard%20Video%20Doorbell%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Video Doorbell');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smart Curtain Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 9999 ELSE price END,
    category = 'Smart Home',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Curtain%20Standard%20Smart%20Curtain%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Curtain');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smart Thermostat Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 7999 ELSE price END,
    category = 'Smart Home',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Thermostat%20Standard%20Smart%20Thermostat%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Thermostat');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Motion Sensor Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Smart Home',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Motion%20Sensor%20Standard%20Motion%20Sensor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Motion Sensor');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smoke Detector Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Smart Home',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smoke%20Detector%20Standard%20Smoke%20Detector%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smoke Detector');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smart Switch Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1299 ELSE price END,
    category = 'Smart Home',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Switch%20Standard%20Smart%20Switch%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Switch');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smart Sensor Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1699 ELSE price END,
    category = 'Smart Home',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Sensor%20Standard%20Smart%20Sensor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Sensor');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Treadmill Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 34999 ELSE price END,
    category = 'Fitness & Health',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Treadmill%20Standard%20Treadmill%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Treadmill');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Exercise Cycle Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 12999 ELSE price END,
    category = 'Fitness & Health',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Exercise%20Cycle%20Standard%20Exercise%20Cycle%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Exercise Cycle');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Dumbbells Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Fitness & Health',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Dumbbells%20Standard%20Dumbbells%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Dumbbells');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Yoga Mat Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 799 ELSE price END,
    category = 'Fitness & Health',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Yoga%20Mat%20Standard%20Yoga%20Mat%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Yoga Mat');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Massager Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3999 ELSE price END,
    category = 'Fitness & Health',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Massager%20Standard%20Massager%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Massager');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'BP Monitor Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Fitness & Health',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20BP%20Monitor%20Standard%20BP%20Monitor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('BP Monitor');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Glucose Meter Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Fitness & Health',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Glucose%20Meter%20Standard%20Glucose%20Meter%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Glucose Meter');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Oximeter Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 999 ELSE price END,
    category = 'Fitness & Health',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Oximeter%20Standard%20Oximeter%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Oximeter');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Weighing Machine Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1299 ELSE price END,
    category = 'Fitness & Health',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Weighing%20Machine%20Standard%20Weighing%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Weighing Machine');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Calculator Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 399 ELSE price END,
    category = 'School & Study',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Calculator%20Standard%20Calculator%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Calculator');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Scientific Calculator Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 999 ELSE price END,
    category = 'School & Study',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Scientific%20Calculator%20Standard%20Scientific%20Calculator%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Scientific Calculator');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Tablet for Study Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 15999 ELSE price END,
    category = 'School & Study',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Tablet%20for%20Study%20Standard%20Tablet%20for%20Study%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Tablet for Study');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'E-Book Reader Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 9999 ELSE price END,
    category = 'School & Study',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20E-Book%20Reader%20Standard%20E-Book%20Reader%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('E-Book Reader');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Study Lamp Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 899 ELSE price END,
    category = 'School & Study',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Study%20Lamp%20Standard%20Study%20Lamp%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Study Lamp');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Printer Ink Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 699 ELSE price END,
    category = 'School & Study',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Printer%20Ink%20Standard%20Printer%20Ink%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Printer Ink');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Stationery Kit Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 499 ELSE price END,
    category = 'School & Study',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Stationery%20Kit%20Standard%20Stationery%20Kit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Stationery Kit');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Barcode Printer Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 12999 ELSE price END,
    category = 'Industrial Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Barcode%20Printer%20Standard%20Barcode%20Printer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Barcode Printer');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'RFID Scanner Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 15999 ELSE price END,
    category = 'Industrial Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20RFID%20Scanner%20Standard%20RFID%20Scanner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('RFID Scanner');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Warehouse Scanner Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 8999 ELSE price END,
    category = 'Industrial Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Warehouse%20Scanner%20Standard%20Warehouse%20Scanner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Warehouse Scanner');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Conveyor Belt Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 79999 ELSE price END,
    category = 'Industrial Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Conveyor%20Belt%20Standard%20Conveyor%20Belt%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Conveyor Belt');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Packaging Machine Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 59999 ELSE price END,
    category = 'Industrial Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Packaging%20Machine%20Standard%20Packaging%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Packaging Machine');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Industrial Fan Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 6999 ELSE price END,
    category = 'Industrial Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Industrial%20Fan%20Standard%20Industrial%20Fan%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Industrial Fan');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Safety Helmet Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 799 ELSE price END,
    category = 'Industrial Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Safety%20Helmet%20Standard%20Safety%20Helmet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Safety Helmet');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Safety Gloves Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 399 ELSE price END,
    category = 'Industrial Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Safety%20Gloves%20Standard%20Safety%20Gloves%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Safety Gloves');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Industrial Drill Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4999 ELSE price END,
    category = 'Industrial',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Industrial%20Drill%20Standard%20Industrial%20Drill%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Industrial Drill');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Measuring Caliper Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1299 ELSE price END,
    category = 'Industrial',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Measuring%20Caliper%20Standard%20Measuring%20Caliper%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Measuring Caliper');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Safety Harness Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Industrial',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Safety%20Harness%20Standard%20Safety%20Harness%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Safety Harness');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Tool Kit Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3499 ELSE price END,
    category = 'Industrial',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Tool%20Kit%20Standard%20Tool%20Kit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Tool Kit');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Server Rack Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 24999 ELSE price END,
    category = 'Server & Enterprise',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Server%20Rack%20Standard%20Server%20Rack%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Server Rack');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'NAS Server Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 69999 ELSE price END,
    category = 'Server & Enterprise',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20NAS%20Server%20Standard%20NAS%20Server%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('NAS Server');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Enterprise SSD Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 14999 ELSE price END,
    category = 'Server & Enterprise',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Enterprise%20SSD%20Standard%20Enterprise%20SSD%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Enterprise SSD');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Rack Switch Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 29999 ELSE price END,
    category = 'Server & Enterprise',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Rack%20Switch%20Standard%20Rack%20Switch%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Rack Switch');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Firewall Device Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 39999 ELSE price END,
    category = 'Server & Enterprise',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Firewall%20Device%20Standard%20Firewall%20Device%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Firewall Device');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'UPS Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 7999 ELSE price END,
    category = 'Server & Enterprise',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20UPS%20Standard%20UPS%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('UPS');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Data Backup Device Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 24999 ELSE price END,
    category = 'Server & Enterprise',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Data%20Backup%20Device%20Standard%20Data%20Backup%20Device%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Data Backup Device');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Enterprise Router Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 44999 ELSE price END,
    category = 'Enterprise',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Enterprise%20Router%20Standard%20Enterprise%20Router%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Enterprise Router');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Managed Firewall Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 69999 ELSE price END,
    category = 'Enterprise',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Managed%20Firewall%20Standard%20Managed%20Firewall%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Managed Firewall');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Rackmount UPS Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 29999 ELSE price END,
    category = 'Enterprise',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Rackmount%20UPS%20Standard%20Rackmount%20UPS%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Rackmount UPS');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Enterprise Access Controller Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 19999 ELSE price END,
    category = 'Enterprise',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Enterprise%20Access%20Controller%20Standard%20Enterprise%20Access%20Controller%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Enterprise Access Controller');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Extension Board Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 599 ELSE price END,
    category = 'Electric Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Extension%20Board%20Standard%20Extension%20Board%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Extension Board');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Inverter Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 15999 ELSE price END,
    category = 'Electric Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Inverter%20Standard%20Inverter%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Inverter');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'UPS Battery Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 5999 ELSE price END,
    category = 'Electric Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20UPS%20Battery%20Standard%20UPS%20Battery%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('UPS Battery');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Solar Panel Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 12999 ELSE price END,
    category = 'Electric Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Solar%20Panel%20Standard%20Solar%20Panel%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Solar Panel');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'LED Strip Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 899 ELSE price END,
    category = 'Electric Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20LED%20Strip%20Standard%20LED%20Strip%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('LED Strip');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Emergency Light Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1299 ELSE price END,
    category = 'Electric Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Emergency%20Light%20Standard%20Emergency%20Light%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Emergency Light');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Trolley Bag Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3999 ELSE price END,
    category = 'Travel Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Trolley%20Bag%20Standard%20Trolley%20Bag%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Trolley Bag');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Travel Backpack Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Travel Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Travel%20Backpack%20Standard%20Travel%20Backpack%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Travel Backpack');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Travel Adapter Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 799 ELSE price END,
    category = 'Travel Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Travel%20Adapter%20Standard%20Travel%20Adapter%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Travel Adapter');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Neck Pillow Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 699 ELSE price END,
    category = 'Travel Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Neck%20Pillow%20Standard%20Neck%20Pillow%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Neck Pillow');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smart Jacket Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 9999 ELSE price END,
    category = 'Fashion Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Jacket%20Standard%20Smart%20Jacket%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Jacket');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Digital Watch Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Fashion Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Digital%20Watch%20Standard%20Digital%20Watch%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Digital Watch');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Wallet Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 999 ELSE price END,
    category = 'Fashion Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Wallet%20Standard%20Wallet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Wallet');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Belt Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 799 ELSE price END,
    category = 'Fashion Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Belt%20Standard%20Belt%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Belt');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Sunglasses Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Fashion Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Sunglasses%20Standard%20Sunglasses%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Sunglasses');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Baby Monitor Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 5999 ELSE price END,
    category = 'Baby Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Baby%20Monitor%20Standard%20Baby%20Monitor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Baby Monitor');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Baby Stroller Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 8999 ELSE price END,
    category = 'Baby Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Baby%20Stroller%20Standard%20Baby%20Stroller%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Baby Stroller');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Milk Warmer Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Baby Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Milk%20Warmer%20Standard%20Milk%20Warmer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Milk Warmer');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Baby Camera Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4999 ELSE price END,
    category = 'Baby Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Baby%20Camera%20Standard%20Baby%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Baby Camera');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Pet Camera Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4999 ELSE price END,
    category = 'Pet Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Pet%20Camera%20Standard%20Pet%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Pet Camera');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smart Pet Feeder Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 7999 ELSE price END,
    category = 'Pet Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20Pet%20Feeder%20Standard%20Smart%20Pet%20Feeder%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Pet Feeder');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Pet Tracker Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2999 ELSE price END,
    category = 'Pet Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Pet%20Tracker%20Standard%20Pet%20Tracker%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Pet Tracker');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Mac Studio Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 199999 ELSE price END,
    category = 'Luxury Electronics',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Mac%20Studio%20Standard%20Mac%20Studio%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Mac Studio');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'iMac Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 139999 ELSE price END,
    category = 'Luxury Electronics',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20iMac%20Standard%20iMac%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('iMac');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'UltraWide Monitor Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 59999 ELSE price END,
    category = 'Luxury Electronics',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20UltraWide%20Monitor%20Standard%20UltraWide%20Monitor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('UltraWide Monitor');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Foldable Phone Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 129999 ELSE price END,
    category = 'Luxury Electronics',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Foldable%20Phone%20Standard%20Foldable%20Phone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Foldable Phone');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Luxury Smart Watch Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 69999 ELSE price END,
    category = 'Luxury Electronics',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Luxury%20Smart%20Watch%20Standard%20Luxury%20Smart%20Watch%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Luxury Smart Watch');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Podcast Mic Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 7999 ELSE price END,
    category = 'Content Creator Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Podcast%20Mic%20Standard%20Podcast%20Mic%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Podcast Mic');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Stream Deck Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 14999 ELSE price END,
    category = 'Content Creator Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Stream%20Deck%20Standard%20Stream%20Deck%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Stream Deck');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Capture Card Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 12999 ELSE price END,
    category = 'Content Creator Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Capture%20Card%20Standard%20Capture%20Card%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Capture Card');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Green Screen Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2999 ELSE price END,
    category = 'Content Creator Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Green%20Screen%20Standard%20Green%20Screen%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Green Screen');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'RGB Lights Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Content Creator Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20RGB%20Lights%20Standard%20RGB%20Lights%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('RGB Lights');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Biometric Lock Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 8999 ELSE price END,
    category = 'Cyber Security Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Biometric%20Lock%20Standard%20Biometric%20Lock%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Biometric Lock');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Fingerprint Scanner Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3499 ELSE price END,
    category = 'Cyber Security Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Fingerprint%20Scanner%20Standard%20Fingerprint%20Scanner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Fingerprint Scanner');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Smart CCTV Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 6999 ELSE price END,
    category = 'Cyber Security Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Smart%20CCTV%20Standard%20Smart%20CCTV%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart CCTV');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Face Recognition Camera Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 14999 ELSE price END,
    category = 'Cyber Security Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Face%20Recognition%20Camera%20Standard%20Face%20Recognition%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Face Recognition Camera');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'AI Speaker Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 5999 ELSE price END,
    category = 'AI Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20AI%20Speaker%20Standard%20AI%20Speaker%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('AI Speaker');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'AI Robot Vacuum Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 24999 ELSE price END,
    category = 'AI Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20AI%20Robot%20Vacuum%20Standard%20AI%20Robot%20Vacuum%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('AI Robot Vacuum');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'AI Security Camera Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 9999 ELSE price END,
    category = 'AI Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20AI%20Security%20Camera%20Standard%20AI%20Security%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('AI Security Camera');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'AI Translation Device Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 12999 ELSE price END,
    category = 'AI Devices',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20AI%20Translation%20Device%20Standard%20AI%20Translation%20Device%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('AI Translation Device');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'AI Meeting Recorder Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 9999 ELSE price END,
    category = 'AI Devices',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20AI%20Meeting%20Recorder%20Standard%20AI%20Meeting%20Recorder%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('AI Meeting Recorder');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'AI Vision Sensor Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 18999 ELSE price END,
    category = 'AI Devices',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20AI%20Vision%20Sensor%20Standard%20AI%20Vision%20Sensor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('AI Vision Sensor');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'AI Voice Assistant Hub Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 7999 ELSE price END,
    category = 'AI Devices',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20AI%20Voice%20Assistant%20Hub%20Standard%20AI%20Voice%20Assistant%20Hub%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('AI Voice Assistant Hub');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Storage Bin Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 499 ELSE price END,
    category = 'Warehouse Related Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Storage%20Bin%20Standard%20Storage%20Bin%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Storage Bin');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Pallet Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Warehouse Related Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Pallet%20Standard%20Pallet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Pallet');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Industrial Rack Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 19999 ELSE price END,
    category = 'Warehouse Related Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Industrial%20Rack%20Standard%20Industrial%20Rack%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Industrial Rack');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Hand Trolley Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 6999 ELSE price END,
    category = 'Warehouse Related Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Hand%20Trolley%20Standard%20Hand%20Trolley%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Hand Trolley');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Forklift Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 699999 ELSE price END,
    category = 'Warehouse Related Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Forklift%20Standard%20Forklift%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Forklift');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Packaging Tape Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 199 ELSE price END,
    category = 'Warehouse Related Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Packaging%20Tape%20Standard%20Packaging%20Tape%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Packaging Tape');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'QR Scanner Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3999 ELSE price END,
    category = 'Warehouse Related Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20QR%20Scanner%20Standard%20QR%20Scanner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('QR Scanner');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'ECG Machine Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 49999 ELSE price END,
    category = 'Medical Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20ECG%20Machine%20Standard%20ECG%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('ECG Machine');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Digital Thermometer Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 799 ELSE price END,
    category = 'Medical Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Digital%20Thermometer%20Standard%20Digital%20Thermometer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Digital Thermometer');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Medical Monitor Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 34999 ELSE price END,
    category = 'Medical Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Medical%20Monitor%20Standard%20Medical%20Monitor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Medical Monitor');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Hospital Bed Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 39999 ELSE price END,
    category = 'Medical Products',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Hospital%20Bed%20Standard%20Hospital%20Bed%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Hospital Bed');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'First Aid Kit Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 999 ELSE price END,
    category = 'Medical',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20First%20Aid%20Kit%20Standard%20First%20Aid%20Kit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('First Aid Kit');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Nebulizer Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Medical',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Nebulizer%20Standard%20Nebulizer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Nebulizer');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Infrared Thermometer Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Medical',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Infrared%20Thermometer%20Standard%20Infrared%20Thermometer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Infrared Thermometer');

UPDATE products
SET brand = 'WMS Catalog',
    model = 'Pulse Monitor Standard',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2999 ELSE price END,
    category = 'Medical',
    quality = COALESCE(NULLIF(quality, ''), 'Premium verified stock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Catalog%20Pulse%20Monitor%20Standard%20Pulse%20Monitor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Pulse Monitor');

UPDATE products
SET brand = 'Maisto',
    model = 'Rock Crawler 4x4',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 18 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Toys & Kids',
    quality = COALESCE(NULLIF(quality, ''), 'Premium ABS body, rechargeable battery'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Maisto%20Rock%20Crawler%204x4%20Remote%20Control%20Car%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Remote Control Car');

UPDATE products
SET brand = 'Syma',
    model = 'X5C Explorer',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4999 ELSE price END,
    category = 'Toys & Kids',
    quality = COALESCE(NULLIF(quality, ''), 'HD camera toy drone, beginner safe guards'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Syma%20X5C%20Explorer%20Drone%20Toy%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Drone Toy');

UPDATE products
SET brand = 'Makeblock',
    model = 'mBot STEM Robot',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 8 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 8999 ELSE price END,
    category = 'Toys & Kids',
    quality = COALESCE(NULLIF(quality, ''), 'STEM learning kit, programmable sensors'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Makeblock%20mBot%20STEM%20Robot%20Robot%20Toy%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Robot Toy');

UPDATE products
SET brand = 'Fisher-Price',
    model = 'Think & Learn Code-a-Pillar',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 20 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2999 ELSE price END,
    category = 'Toys & Kids',
    quality = COALESCE(NULLIF(quality, ''), 'Child-safe plastic, early coding activity'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Fisher-Price%20Think%20%26%20Learn%20Code-a-Pillar%20Educational%20Toy%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Educational Toy');

UPDATE products
SET brand = 'LEGO',
    model = 'Classic Medium Creative Brick Box 10696',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 16 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3499 ELSE price END,
    category = 'Toys & Kids',
    quality = COALESCE(NULLIF(quality, ''), 'Original interlocking bricks, durable ABS'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=LEGO%20Classic%20Medium%20Creative%20Brick%20Box%2010696%20Building%20Blocks%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Building Blocks');

UPDATE products
SET brand = 'Samsung',
    model = 'Galaxy Tab A9 Kids Edition',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 7 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 13999 ELSE price END,
    category = 'Toys & Kids',
    quality = COALESCE(NULLIF(quality, ''), 'Kid mode, protective case, HD display'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Samsung%20Galaxy%20Tab%20A9%20Kids%20Edition%20Smart%20Learning%20Tablet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Learning Tablet');

UPDATE products
SET brand = 'Noise',
    model = 'Scout Kids Smartwatch',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 14 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Toys & Kids',
    quality = COALESCE(NULLIF(quality, ''), 'GPS-ready design, splash resistant body'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Noise%20Scout%20Kids%20Smartwatch%20Kids%20Smart%20Watch%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Kids Smart Watch');

UPDATE products
SET brand = 'Bata',
    model = 'Power Lace-Up Walking Shoes',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 35 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Fashion',
    quality = COALESCE(NULLIF(quality, ''), 'Comfort outsole, everyday synthetic upper'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Bata%20Power%20Lace-Up%20Walking%20Shoes%20Shoes%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Shoes');

UPDATE products
SET brand = 'Nike',
    model = 'Court Vision Low',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 22 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 5495 ELSE price END,
    category = 'Fashion',
    quality = COALESCE(NULLIF(quality, ''), 'Leather-look upper, cushioned daily wear'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Nike%20Court%20Vision%20Low%20Sneakers%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Sneakers');

UPDATE products
SET brand = 'Adidas',
    model = 'Duramo SL',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 26 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4999 ELSE price END,
    category = 'Fashion',
    quality = COALESCE(NULLIF(quality, ''), 'Lightweight running sole, breathable mesh'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Adidas%20Duramo%20SL%20Sports%20Shoes%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Sports Shoes');

UPDATE products
SET brand = 'Crocs',
    model = 'Classic Sandal 2.0',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 28 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2995 ELSE price END,
    category = 'Fashion',
    quality = COALESCE(NULLIF(quality, ''), 'Croslite cushioning, water friendly'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Crocs%20Classic%20Sandal%202.0%20Sandals%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Sandals');

UPDATE products
SET brand = 'U.S. Polo Assn.',
    model = 'Cotton Crew Neck Tee',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 60 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 999 ELSE price END,
    category = 'Fashion',
    quality = COALESCE(NULLIF(quality, ''), 'Bio-washed cotton, regular fit'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=U.S.%20Polo%20Assn.%20Cotton%20Crew%20Neck%20Tee%20T-Shirts%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('T-Shirts');

UPDATE products
SET brand = 'Puma',
    model = 'Essentials Fleece Hoodie',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 24 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2999 ELSE price END,
    category = 'Fashion',
    quality = COALESCE(NULLIF(quality, ''), 'Warm fleece, ribbed cuffs'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Puma%20Essentials%20Fleece%20Hoodie%20Hoodies%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Hoodies');

UPDATE products
SET brand = 'Decathlon',
    model = 'Quechua NH100 Padded Jacket',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 18 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3499 ELSE price END,
    category = 'Fashion',
    quality = COALESCE(NULLIF(quality, ''), 'Lightweight insulation, outdoor ready'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Decathlon%20Quechua%20NH100%20Padded%20Jacket%20Jackets%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Jackets');

UPDATE products
SET brand = 'Levi''s',
    model = '511 Slim Fit',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 30 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3999 ELSE price END,
    category = 'Fashion',
    quality = COALESCE(NULLIF(quality, ''), 'Stretch denim, durable stitching'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Levi''s%20511%20Slim%20Fit%20Jeans%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Jeans');

UPDATE products
SET brand = 'New Era',
    model = '9FORTY Adjustable Cap',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 40 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Fashion',
    quality = COALESCE(NULLIF(quality, ''), 'Structured cotton twill, adjustable strap'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=New%20Era%209FORTY%20Adjustable%20Cap%20Caps%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Caps');

UPDATE products
SET brand = 'Wildcraft',
    model = 'Hypadura Laptop Backpack',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 34 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2299 ELSE price END,
    category = 'Fashion',
    quality = COALESCE(NULLIF(quality, ''), 'Water resistant fabric, padded laptop sleeve'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Wildcraft%20Hypadura%20Laptop%20Backpack%20Bags%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Bags');

UPDATE products
SET brand = 'Skybags',
    model = 'Brat 22L Backpack',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 45 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1299 ELSE price END,
    category = 'Bags & Travel',
    quality = COALESCE(NULLIF(quality, ''), 'Daily carry polyester, padded straps'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Skybags%20Brat%2022L%20Backpack%20Backpack%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Backpack');

UPDATE products
SET brand = 'HP',
    model = 'Renew Business 15.6 Bag',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 25 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Bags & Travel',
    quality = COALESCE(NULLIF(quality, ''), 'Recycled fabric, padded laptop compartment'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=HP%20Renew%20Business%2015.6%20Bag%20Laptop%20Bag%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Laptop Bag');

UPDATE products
SET brand = 'American Tourister',
    model = 'Ivy Spinner 68 cm',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 15 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 6499 ELSE price END,
    category = 'Bags & Travel',
    quality = COALESCE(NULLIF(quality, ''), 'Hard shell, 360 degree spinner wheels'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=American%20Tourister%20Ivy%20Spinner%2068%20cm%20Trolley%20Bag%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Trolley Bag');

UPDATE products
SET brand = 'Safari',
    model = 'Seek 55L Duffel',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 32 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1899 ELSE price END,
    category = 'Bags & Travel',
    quality = COALESCE(NULLIF(quality, ''), 'High capacity travel fabric, side handles'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Safari%20Seek%2055L%20Duffel%20Duffel%20Bag%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Duffel Bag');

UPDATE products
SET brand = 'Aristocrat',
    model = 'Urban Trek 45L',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 20 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Bags & Travel',
    quality = COALESCE(NULLIF(quality, ''), 'Cabin-friendly design, multi-pocket storage'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Aristocrat%20Urban%20Trek%2045L%20Travel%20Backpack%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Travel Backpack');

UPDATE products
SET brand = 'DailyObjects',
    model = 'Slim Travel Organizer',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 38 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 999 ELSE price END,
    category = 'Bags & Travel',
    quality = COALESCE(NULLIF(quality, ''), 'Vegan leather, card and passport slots'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=DailyObjects%20Slim%20Travel%20Organizer%20Passport%20Holder%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Passport Holder');

UPDATE products
SET brand = 'Philips',
    model = 'Hue Go Portable Lamp',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 12 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 7499 ELSE price END,
    category = 'Home Decor',
    quality = COALESCE(NULLIF(quality, ''), 'Smart color lighting, dimmable LED'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Philips%20Hue%20Go%20Portable%20Lamp%20LED%20Lamp%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('LED Lamp');

UPDATE products
SET brand = 'Seiko',
    model = 'QXA761 Wall Clock',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 22 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Home Decor',
    quality = COALESCE(NULLIF(quality, ''), 'Quiet sweep movement, premium dial'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Seiko%20QXA761%20Wall%20Clock%20Wall%20Clock%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Wall Clock');

UPDATE products
SET brand = 'Art Street',
    model = 'Canvas Wall Art Set',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 18 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Home Decor',
    quality = COALESCE(NULLIF(quality, ''), 'Fade-resistant canvas print'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Art%20Street%20Canvas%20Wall%20Art%20Set%20Wall%20Painting%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Wall Painting');

UPDATE products
SET brand = 'Hindware',
    model = 'Illusion LED Smart Mirror',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 6 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 12999 ELSE price END,
    category = 'Home Decor',
    quality = COALESCE(NULLIF(quality, ''), 'Touch LED, anti-fog bathroom mirror'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Hindware%20Illusion%20LED%20Smart%20Mirror%20Smart%20Mirror%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Mirror');

UPDATE products
SET brand = 'Story@Home',
    model = 'Blackout Eyelet Curtains',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 30 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Home Decor',
    quality = COALESCE(NULLIF(quality, ''), 'Room darkening fabric, machine washable'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Story%40Home%20Blackout%20Eyelet%20Curtains%20Curtains%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Curtains');

UPDATE products
SET brand = 'Status Contract',
    model = 'Modern Area Rug 5x7',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 14 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3999 ELSE price END,
    category = 'Home Decor',
    quality = COALESCE(NULLIF(quality, ''), 'Soft pile, anti-skid backing'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Status%20Contract%20Modern%20Area%20Rug%205x7%20Carpets%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Carpets');

UPDATE products
SET brand = 'Home Centre',
    model = 'Elastic Stretch Sofa Cover',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 20 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Home Decor',
    quality = COALESCE(NULLIF(quality, ''), 'Washable stretch fabric, anti-slip fit'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Home%20Centre%20Elastic%20Stretch%20Sofa%20Cover%20Sofa%20Cover%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Sofa Cover');

UPDATE products
SET brand = 'Crompton',
    model = 'Mini Master Plus 1HP',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 12 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 5999 ELSE price END,
    category = 'Garden Products',
    quality = COALESCE(NULLIF(quality, ''), 'Copper winding, high flow garden use'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Crompton%20Mini%20Master%20Plus%201HP%20Water%20Pump%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Water Pump');

UPDATE products
SET brand = 'Philips',
    model = 'Outdoor Solar Spike Light',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 30 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Garden Products',
    quality = COALESCE(NULLIF(quality, ''), 'Solar charging, weather resistant'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Philips%20Outdoor%20Solar%20Spike%20Light%20Garden%20Lights%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Garden Lights');

UPDATE products
SET brand = 'Ugaoo',
    model = 'Self Watering Planter Set',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 50 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 999 ELSE price END,
    category = 'Garden Products',
    quality = COALESCE(NULLIF(quality, ''), 'UV-stable plastic, self watering tray'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Ugaoo%20Self%20Watering%20Planter%20Set%20Plant%20Pots%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Plant Pots');

UPDATE products
SET brand = 'Bosch',
    model = 'EasyGrassCut 23',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 9 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4999 ELSE price END,
    category = 'Garden Products',
    quality = COALESCE(NULLIF(quality, ''), 'Electric trimmer, ergonomic handle'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Bosch%20EasyGrassCut%2023%20Grass%20Cutter%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Grass Cutter');

UPDATE products
SET brand = 'Generic',
    model = 'Solar Garden Fountain 3W',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 16 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Garden Products',
    quality = COALESCE(NULLIF(quality, ''), 'Solar pump, decorative water flow'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Generic%20Solar%20Garden%20Fountain%203W%20Mini%20Fountain%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Mini Fountain');

UPDATE products
SET brand = 'Hero',
    model = 'Sprint Milano 26T',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 9999 ELSE price END,
    category = 'Sports & Outdoor',
    quality = COALESCE(NULLIF(quality, ''), 'Steel frame, city ride geometry'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Hero%20Sprint%20Milano%2026T%20Bicycle%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Bicycle');

UPDATE products
SET brand = 'Lifelong',
    model = 'Home Gym Combo Bench',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 7 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 14999 ELSE price END,
    category = 'Sports & Outdoor',
    quality = COALESCE(NULLIF(quality, ''), 'Multi-workout steel frame set'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Lifelong%20Home%20Gym%20Combo%20Bench%20Gym%20Equipment%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Gym Equipment');

UPDATE products
SET brand = 'SG',
    model = 'Scorer Classic English Willow',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 20 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4999 ELSE price END,
    category = 'Sports & Outdoor',
    quality = COALESCE(NULLIF(quality, ''), 'Willow blade, cane handle grip'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=SG%20Scorer%20Classic%20English%20Willow%20Cricket%20Bat%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Cricket Bat');

UPDATE products
SET brand = 'Nivia',
    model = 'Storm Football Size 5',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 40 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 899 ELSE price END,
    category = 'Sports & Outdoor',
    quality = COALESCE(NULLIF(quality, ''), 'Machine stitched, training grade'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Nivia%20Storm%20Football%20Size%205%20Football%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Football');

UPDATE products
SET brand = 'Yonex',
    model = 'GR 303 Combo Kit',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 25 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Sports & Outdoor',
    quality = COALESCE(NULLIF(quality, ''), 'Aluminium racquets, nylon shuttle set'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Yonex%20GR%20303%20Combo%20Kit%20Badminton%20Kit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Badminton Kit');

UPDATE products
SET brand = 'Amazon Basics',
    model = 'Rubber Encased Pair 10kg',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 18 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3499 ELSE price END,
    category = 'Sports & Outdoor',
    quality = COALESCE(NULLIF(quality, ''), 'Hex rubber design, knurled grip'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Amazon%20Basics%20Rubber%20Encased%20Pair%2010kg%20Dumbbells%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Dumbbells');

UPDATE products
SET brand = 'Fitkit',
    model = 'FT200M Motorized Treadmill',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 5 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 39999 ELSE price END,
    category = 'Sports & Outdoor',
    quality = COALESCE(NULLIF(quality, ''), 'Motorized belt, shock absorption'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Fitkit%20FT200M%20Motorized%20Treadmill%20Treadmill%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Treadmill');

UPDATE products
SET brand = 'Boldfit',
    model = '6mm Anti-Skid Yoga Mat',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 55 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 799 ELSE price END,
    category = 'Sports & Outdoor',
    quality = COALESCE(NULLIF(quality, ''), 'NBR foam, anti-skid texture'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Boldfit%206mm%20Anti-Skid%20Yoga%20Mat%20Yoga%20Mat%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Yoga Mat');

UPDATE products
SET brand = 'Red Bull',
    model = 'Energy Drink 250ml Pack',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 120 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 125 ELSE price END,
    category = 'Food & Beverage',
    quality = COALESCE(NULLIF(quality, ''), 'Sealed beverage stock, FSSAI packed'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Red%20Bull%20Energy%20Drink%20250ml%20Pack%20Energy%20Drink%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Energy Drink');

UPDATE products
SET brand = 'Blue Tokai',
    model = 'Attikan Estate Medium Roast 250g',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 60 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 499 ELSE price END,
    category = 'Food & Beverage',
    quality = COALESCE(NULLIF(quality, ''), 'Fresh roast arabica beans'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Blue%20Tokai%20Attikan%20Estate%20Medium%20Roast%20250g%20Coffee%20Beans%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Coffee Beans');

UPDATE products
SET brand = 'Optimum Nutrition',
    model = 'Gold Standard Whey 2lb',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 20 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3299 ELSE price END,
    category = 'Food & Beverage',
    quality = COALESCE(NULLIF(quality, ''), 'Imported whey blend, sealed jar'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Optimum%20Nutrition%20Gold%20Standard%20Whey%202lb%20Protein%20Powder%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Protein Powder');

UPDATE products
SET brand = 'Haldiram''s',
    model = 'Namkeen Combo Pack',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 100 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 299 ELSE price END,
    category = 'Food & Beverage',
    quality = COALESCE(NULLIF(quality, ''), 'Factory sealed, long shelf life'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Haldiram''s%20Namkeen%20Combo%20Pack%20Snacks%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Snacks');

UPDATE products
SET brand = 'Tata Sampann',
    model = 'California Almonds 500g',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 70 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 599 ELSE price END,
    category = 'Food & Beverage',
    quality = COALESCE(NULLIF(quality, ''), 'Premium grade nuts, resealable pouch'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Tata%20Sampann%20California%20Almonds%20500g%20Dry%20Fruits%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Dry Fruits');

UPDATE products
SET brand = 'MTR',
    model = 'Ready To Eat Meal Pack',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 90 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 199 ELSE price END,
    category = 'Food & Beverage',
    quality = COALESCE(NULLIF(quality, ''), 'Retort packed, ready-to-eat'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=MTR%20Ready%20To%20Eat%20Meal%20Pack%20Packaged%20Foods%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Packaged Foods');

UPDATE products
SET brand = 'Himalaya',
    model = 'Purifying Neem Face Wash 150ml',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 80 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 199 ELSE price END,
    category = 'Beauty Products',
    quality = COALESCE(NULLIF(quality, ''), 'Dermatologically tested daily care'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Himalaya%20Purifying%20Neem%20Face%20Wash%20150ml%20Face%20Wash%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Face Wash');

UPDATE products
SET brand = 'Cetaphil',
    model = 'Moisturising Lotion 250ml',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 45 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 899 ELSE price END,
    category = 'Beauty Products',
    quality = COALESCE(NULLIF(quality, ''), 'Sensitive skin formula'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Cetaphil%20Moisturising%20Lotion%20250ml%20Moisturizer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Moisturizer');

UPDATE products
SET brand = 'La Shield',
    model = 'SPF 40 Gel 60g',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 50 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 699 ELSE price END,
    category = 'Beauty Products',
    quality = COALESCE(NULLIF(quality, ''), 'Broad spectrum UV protection'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=La%20Shield%20SPF%2040%20Gel%2060g%20Sunscreen%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Sunscreen');

UPDATE products
SET brand = 'Skinn by Titan',
    model = 'Raw Eau De Parfum 100ml',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 24 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2495 ELSE price END,
    category = 'Beauty Products',
    quality = COALESCE(NULLIF(quality, ''), 'Long lasting EDP fragrance'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Skinn%20by%20Titan%20Raw%20Eau%20De%20Parfum%20100ml%20Perfume%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Perfume');

UPDATE products
SET brand = 'Lakme',
    model = '9 to 5 Makeup Starter Kit',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 18 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Beauty Products',
    quality = COALESCE(NULLIF(quality, ''), 'Daily use cosmetic combo'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Lakme%209%20to%205%20Makeup%20Starter%20Kit%20Makeup%20Kit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Makeup Kit');

UPDATE products
SET brand = 'Colorbar',
    model = 'Vegan Nail Lacquer',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 65 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 299 ELSE price END,
    category = 'Beauty Products',
    quality = COALESCE(NULLIF(quality, ''), 'Gloss finish, quick dry formula'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Colorbar%20Vegan%20Nail%20Lacquer%20Nail%20Polish%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Nail Polish');

UPDATE products
SET brand = 'Ceasefire',
    model = 'ABC Powder 2kg',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 20 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1899 ELSE price END,
    category = 'Safety Products',
    quality = COALESCE(NULLIF(quality, ''), 'ISI marked, multipurpose safety use'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Ceasefire%20ABC%20Powder%202kg%20Fire%20Extinguisher%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Fire Extinguisher');

UPDATE products
SET brand = 'Allen Cooper',
    model = 'AC-1156 Steel Toe',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 30 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1799 ELSE price END,
    category = 'Safety Products',
    quality = COALESCE(NULLIF(quality, ''), 'Steel toe, oil resistant sole'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Allen%20Cooper%20AC-1156%20Steel%20Toe%20Safety%20Shoes%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Safety Shoes');

UPDATE products
SET brand = 'Studds',
    model = 'Thunder D4 Full Face',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 28 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Safety Products',
    quality = COALESCE(NULLIF(quality, ''), 'ISI certified shell, clear visor'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Studds%20Thunder%20D4%20Full%20Face%20Helmet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Helmet');

UPDATE products
SET brand = '3M',
    model = 'Comfort Grip Safety Gloves',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 70 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 399 ELSE price END,
    category = 'Safety Products',
    quality = COALESCE(NULLIF(quality, ''), 'Grip coating, industrial hand safety'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=3M%20Comfort%20Grip%20Safety%20Gloves%20Gloves%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Gloves');

UPDATE products
SET brand = 'Karam',
    model = 'Reflective Safety Vest',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 80 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 499 ELSE price END,
    category = 'Safety Products',
    quality = COALESCE(NULLIF(quality, ''), 'High visibility reflective strips'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Karam%20Reflective%20Safety%20Vest%20Safety%20Jacket%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Safety Jacket');

UPDATE products
SET brand = 'Bosch',
    model = 'GSB 501 Impact Drill',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 15 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2999 ELSE price END,
    category = 'Tools & Hardware',
    quality = COALESCE(NULLIF(quality, ''), '500W motor, concrete and wood drilling'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Bosch%20GSB%20501%20Impact%20Drill%20Drill%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Drill Machine');

UPDATE products
SET brand = 'Stanley',
    model = 'STHT62511 9-Piece Set',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 40 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 699 ELSE price END,
    category = 'Tools & Hardware',
    quality = COALESCE(NULLIF(quality, ''), 'Magnetic tips, chrome vanadium steel'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Stanley%20STHT62511%209-Piece%20Set%20Screwdriver%20Set%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Screwdriver Set');

UPDATE products
SET brand = 'Taparia',
    model = 'Claw Hammer 450g',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 35 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 499 ELSE price END,
    category = 'Tools & Hardware',
    quality = COALESCE(NULLIF(quality, ''), 'Forged steel head, wooden handle'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Taparia%20Claw%20Hammer%20450g%20Hammer%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Hammer');

UPDATE products
SET brand = 'Black+Decker',
    model = 'A7073 76-Piece Kit',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 22 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Tools & Hardware',
    quality = COALESCE(NULLIF(quality, ''), 'Home repair multi-tool case'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Black%2BDecker%20A7073%2076-Piece%20Kit%20Tool%20Kit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Tool Kit');

UPDATE products
SET brand = 'Stanley',
    model = 'Tylon 5m Tape',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 60 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 349 ELSE price END,
    category = 'Tools & Hardware',
    quality = COALESCE(NULLIF(quality, ''), 'Locking blade, metric markings'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Stanley%20Tylon%205m%20Tape%20Measuring%20Tape%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Measuring Tape');

UPDATE products
SET brand = 'Exide',
    model = 'Inva Tubular IT500',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 12 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 15999 ELSE price END,
    category = 'Battery & Power',
    quality = COALESCE(NULLIF(quality, ''), 'Tall tubular battery, long backup'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Exide%20Inva%20Tubular%20IT500%20Inverter%20Battery%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Inverter Battery');

UPDATE products
SET brand = 'EcoFlow',
    model = 'RIVER 2 Portable Power Station',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 8 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 24999 ELSE price END,
    category = 'Battery & Power',
    quality = COALESCE(NULLIF(quality, ''), 'LFP battery, fast charging output'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=EcoFlow%20RIVER%202%20Portable%20Power%20Station%20Power%20Station%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Power Station');

UPDATE products
SET brand = 'Luminous',
    model = 'Solar C10 Tubular 150Ah',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 17999 ELSE price END,
    category = 'Battery & Power',
    quality = COALESCE(NULLIF(quality, ''), 'Solar compatible deep-cycle battery'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Luminous%20Solar%20C10%20Tubular%20150Ah%20Solar%20Battery%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Solar Battery');

UPDATE products
SET brand = 'APC',
    model = 'BX1100C-IN 1100VA',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 18 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 6499 ELSE price END,
    category = 'Battery & Power',
    quality = COALESCE(NULLIF(quality, ''), 'Automatic voltage regulation backup'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=APC%20BX1100C-IN%201100VA%20UPS%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('UPS');

UPDATE products
SET brand = 'Wipro',
    model = 'Coral Rechargeable LED Light',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 35 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1299 ELSE price END,
    category = 'Battery & Power',
    quality = COALESCE(NULLIF(quality, ''), 'Rechargeable LED, power cut backup'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Wipro%20Coral%20Rechargeable%20LED%20Light%20Emergency%20Light%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Emergency Light');

UPDATE products
SET brand = 'O''Reilly',
    model = 'Learning Python 5th Edition',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 24 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Books & Education',
    quality = COALESCE(NULLIF(quality, ''), 'Original paperback, reference grade'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=O''Reilly%20Learning%20Python%205th%20Edition%20Programming%20Books%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Programming Books');

UPDATE products
SET brand = 'Pearson',
    model = 'Artificial Intelligence A Modern Approach',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 18 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Books & Education',
    quality = COALESCE(NULLIF(quality, ''), 'Academic AI textbook'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Pearson%20Artificial%20Intelligence%20A%20Modern%20Approach%20AI%20Books%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('AI Books');

UPDATE products
SET brand = 'O''Reilly',
    model = 'Python for Data Analysis',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 20 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1799 ELSE price END,
    category = 'Books & Education',
    quality = COALESCE(NULLIF(quality, ''), 'Practical data science reference'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=O''Reilly%20Python%20for%20Data%20Analysis%20Data%20Science%20Books%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Data Science Books');

UPDATE products
SET brand = 'Arihant',
    model = 'General Knowledge 2026',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 50 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 399 ELSE price END,
    category = 'Books & Education',
    quality = COALESCE(NULLIF(quality, ''), 'Latest exam prep edition'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Arihant%20General%20Knowledge%202026%20Competitive%20Exam%20Books%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Competitive Exam Books');

UPDATE products
SET brand = 'McGraw Hill',
    model = 'Spoken English for India',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 45 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 299 ELSE price END,
    category = 'Books & Education',
    quality = COALESCE(NULLIF(quality, ''), 'Beginner friendly language practice'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=McGraw%20Hill%20Spoken%20English%20for%20India%20English%20Speaking%20Books%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('English Speaking Books');

UPDATE products
SET brand = 'Autofact',
    model = 'Waterproof Bike Cover XL',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 42 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 699 ELSE price END,
    category = 'Bike Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Dustproof and rain resistant fabric'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Autofact%20Waterproof%20Bike%20Cover%20XL%20Bike%20Cover%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Bike Cover');

UPDATE products
SET brand = 'NiteRider',
    model = 'Swift 300 Front Light',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 20 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Bike Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'USB rechargeable, bright LED beam'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=NiteRider%20Swift%20300%20Front%20Light%20Bike%20Light%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Bike Light');

UPDATE products
SET brand = 'Rynox',
    model = 'Air GT Gloves',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 24 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2450 ELSE price END,
    category = 'Bike Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Knuckle protection, breathable mesh'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Rynox%20Air%20GT%20Gloves%20Riding%20Gloves%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Riding Gloves');

UPDATE products
SET brand = 'BOBO',
    model = 'BM10H Bike Phone Holder',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 35 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 899 ELSE price END,
    category = 'Bike Accessories',
    quality = COALESCE(NULLIF(quality, ''), '360 degree mount, secure grip'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=BOBO%20BM10H%20Bike%20Phone%20Holder%20Mobile%20Holder%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Mobile Holder');

UPDATE products
SET brand = 'Godrej',
    model = 'Shutter Lock Heavy Duty',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 38 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 599 ELSE price END,
    category = 'Bike Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Hardened steel security lock'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Godrej%20Shutter%20Lock%20Heavy%20Duty%20Bike%20Lock%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Bike Lock');

UPDATE products
SET brand = 'Autofurnish',
    model = 'Silver Matty Car Body Cover',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 25 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Car Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Water resistant, mirror pocket fit'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Autofurnish%20Silver%20Matty%20Car%20Body%20Cover%20Car%20Cover%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Car Cover');

UPDATE products
SET brand = 'Elegant',
    model = 'Leatherette Seat Cover Set',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 12 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 5499 ELSE price END,
    category = 'Car Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Premium leatherette, custom fit'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Elegant%20Leatherette%20Seat%20Cover%20Set%20Seat%20Cover%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Seat Cover');

UPDATE products
SET brand = 'Godrej Aer',
    model = 'Twist Car Freshener',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 80 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 299 ELSE price END,
    category = 'Car Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Long lasting fragrance diffuser'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Godrej%20Aer%20Twist%20Car%20Freshener%20Car%20Perfume%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Car Perfume');

UPDATE products
SET brand = 'Bergmann',
    model = 'Typhoon Digital Inflator',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 18 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 2499 ELSE price END,
    category = 'Car Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Digital pressure gauge, 12V plug'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Bergmann%20Typhoon%20Digital%20Inflator%20Air%20Compressor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Air Compressor');

UPDATE products
SET brand = 'NOCO',
    model = 'Boost Plus GB40',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 8 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 9999 ELSE price END,
    category = 'Car Accessories',
    quality = COALESCE(NULLIF(quality, ''), 'Lithium jump starter, safety clamps'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=NOCO%20Boost%20Plus%20GB40%20Jump%20Starter%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Jump Starter');

UPDATE products
SET brand = 'Amazon Pay',
    model = 'Digital Gift Card',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 100 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1000 ELSE price END,
    category = 'E-Commerce Products',
    quality = COALESCE(NULLIF(quality, ''), 'Instant digital delivery, redeemable balance'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Amazon%20Pay%20Digital%20Gift%20Card%20Gift%20Cards%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Gift Cards');

UPDATE products
SET brand = 'WMS Deals',
    model = 'Shopping Coupon Pack',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 200 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 199 ELSE price END,
    category = 'E-Commerce Products',
    quality = COALESCE(NULLIF(quality, ''), 'Digital coupon code bundle'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=WMS%20Deals%20Shopping%20Coupon%20Pack%20Coupons%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Coupons');

UPDATE products
SET brand = 'Microsoft',
    model = 'Microsoft 365 Personal 1 Year',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 40 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 4899 ELSE price END,
    category = 'E-Commerce Products',
    quality = COALESCE(NULLIF(quality, ''), 'Licensed subscription, digital activation'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Microsoft%20Microsoft%20365%20Personal%201%20Year%20Digital%20Subscription%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Digital Subscription');

UPDATE products
SET brand = 'Quick Heal',
    model = 'Total Security 1 User 1 Year',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 45 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1299 ELSE price END,
    category = 'E-Commerce Products',
    quality = COALESCE(NULLIF(quality, ''), 'Original activation key'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Quick%20Heal%20Total%20Security%201%20User%201%20Year%20Software%20License%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Software License');

UPDATE products
SET brand = 'Raspberry Pi',
    model = 'Raspberry Pi 5 8GB',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 12 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 8999 ELSE price END,
    category = 'Advanced Tech',
    quality = COALESCE(NULLIF(quality, ''), 'Official SBC board, 8GB RAM'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Raspberry%20Pi%20Raspberry%20Pi%205%208GB%20Raspberry%20Pi%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Raspberry Pi');

UPDATE products
SET brand = 'Arduino',
    model = 'Starter Kit K000007',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 14 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 7499 ELSE price END,
    category = 'Advanced Tech',
    quality = COALESCE(NULLIF(quality, ''), 'Original board kit, project components'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Arduino%20Starter%20Kit%20K000007%20Arduino%20Kit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Arduino Kit');

UPDATE products
SET brand = 'Bosch',
    model = 'BME680 Environmental Sensor',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 30 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Advanced Tech',
    quality = COALESCE(NULLIF(quality, ''), 'Gas, humidity, pressure and temperature sensing'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Bosch%20BME680%20Environmental%20Sensor%20IoT%20Sensor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('IoT Sensor');

UPDATE products
SET brand = 'Hikvision',
    model = 'AcuSense 4MP IP Camera',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 16 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 8999 ELSE price END,
    category = 'Advanced Tech',
    quality = COALESCE(NULLIF(quality, ''), 'AI human detection, night vision'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Hikvision%20AcuSense%204MP%20IP%20Camera%20AI%20Camera%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('AI Camera');

UPDATE products
SET brand = 'Makeblock',
    model = 'Ultimate 2.0 Robot Kit',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 6 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 29999 ELSE price END,
    category = 'Advanced Tech',
    quality = COALESCE(NULLIF(quality, ''), 'Aluminium frame, programmable robotics'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Makeblock%20Ultimate%202.0%20Robot%20Kit%20Robotics%20Kit%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Robotics Kit');

UPDATE products
SET brand = 'Bonfiglioli',
    model = 'C Series Geared Motor',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 5 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 34999 ELSE price END,
    category = 'Industrial Equipment',
    quality = COALESCE(NULLIF(quality, ''), 'Industrial duty geared motor'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Bonfiglioli%20C%20Series%20Geared%20Motor%20Conveyor%20Motor%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Conveyor Motor');

UPDATE products
SET brand = 'MiR',
    model = 'MiR100 Autonomous Mobile Robot',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 2 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 899999 ELSE price END,
    category = 'Industrial Equipment',
    quality = COALESCE(NULLIF(quality, ''), 'Autonomous warehouse transport robot'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=MiR%20MiR100%20Autonomous%20Mobile%20Robot%20Warehouse%20Robot%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Warehouse Robot');

UPDATE products
SET brand = 'Zebra',
    model = 'Z-Select RFID Label Roll',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 100 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Industrial Equipment',
    quality = COALESCE(NULLIF(quality, ''), 'UHF RFID labels for inventory tracking'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Zebra%20Z-Select%20RFID%20Label%20Roll%20RFID%20Tag%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('RFID Tag');

UPDATE products
SET brand = 'Zebra',
    model = 'DS2278 Wireless Scanner',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 12 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 15999 ELSE price END,
    category = 'Industrial Equipment',
    quality = COALESCE(NULLIF(quality, ''), '2D barcode scanning, Bluetooth cradle'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Zebra%20DS2278%20Wireless%20Scanner%20Smart%20Scanner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Scanner');

UPDATE products
SET brand = 'Brother',
    model = 'PT-D210 Label Maker',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 18 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3999 ELSE price END,
    category = 'Industrial Equipment',
    quality = COALESCE(NULLIF(quality, ''), 'Thermal label printing, office grade'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Brother%20PT-D210%20Label%20Maker%20Label%20Machine%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Label Machine');

UPDATE products
SET brand = 'Sobo',
    model = 'Glass Aquarium 2ft',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 10 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 3499 ELSE price END,
    category = 'Aquarium & Pets',
    quality = COALESCE(NULLIF(quality, ''), 'Clear glass tank, home aquarium setup'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Sobo%20Glass%20Aquarium%202ft%20Aquarium%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Aquarium');

UPDATE products
SET brand = 'Hygger',
    model = 'Clip-On LED Aquarium Light',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 18 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Aquarium & Pets',
    quality = COALESCE(NULLIF(quality, ''), 'Full spectrum LED, adjustable brightness'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Hygger%20Clip-On%20LED%20Aquarium%20Light%20Fish%20Tank%20Light%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Fish Tank Light');

UPDATE products
SET brand = 'Pedigree',
    model = 'Adult Chicken & Vegetables 3kg',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 60 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 799 ELSE price END,
    category = 'Aquarium & Pets',
    quality = COALESCE(NULLIF(quality, ''), 'Sealed nutrition pack'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Pedigree%20Adult%20Chicken%20%26%20Vegetables%203kg%20Pet%20Food%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Pet Food');

UPDATE products
SET brand = 'Heads Up For Tails',
    model = 'Donut Plush Pet Bed',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 20 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1999 ELSE price END,
    category = 'Aquarium & Pets',
    quality = COALESCE(NULLIF(quality, ''), 'Soft washable plush bed'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Heads%20Up%20For%20Tails%20Donut%20Plush%20Pet%20Bed%20Pet%20Bed%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Pet Bed');

UPDATE products
SET brand = 'Trixie',
    model = 'Classic Nylon Leash',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 45 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 499 ELSE price END,
    category = 'Aquarium & Pets',
    quality = COALESCE(NULLIF(quality, ''), 'Durable nylon, strong metal hook'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Trixie%20Classic%20Nylon%20Leash%20Dog%20Leash%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Dog Leash');

UPDATE products
SET brand = 'Scotch-Brite',
    model = '2-in-1 Spin Mop',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 35 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 1499 ELSE price END,
    category = 'Cleaning Products',
    quality = COALESCE(NULLIF(quality, ''), 'Microfiber mop, bucket wringer'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Scotch-Brite%202-in-1%20Spin%20Mop%20Mop%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Mop');

UPDATE products
SET brand = 'Lizol',
    model = 'Disinfectant Surface Cleaner 2L',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 90 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 399 ELSE price END,
    category = 'Cleaning Products',
    quality = COALESCE(NULLIF(quality, ''), 'Disinfectant liquid, sealed bottle'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Lizol%20Disinfectant%20Surface%20Cleaner%202L%20Floor%20Cleaner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Floor Cleaner');

UPDATE products
SET brand = 'Colin',
    model = 'Glass Cleaner Spray 500ml',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 100 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 149 ELSE price END,
    category = 'Cleaning Products',
    quality = COALESCE(NULLIF(quality, ''), 'Streak-free glass cleaning'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Colin%20Glass%20Cleaner%20Spray%20500ml%20Glass%20Cleaner%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Glass Cleaner');

UPDATE products
SET brand = 'iRobot',
    model = 'Roomba i2',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 8 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 24999 ELSE price END,
    category = 'Cleaning Products',
    quality = COALESCE(NULLIF(quality, ''), 'Smart navigation, automatic cleaning'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=iRobot%20Roomba%20i2%20Vacuum%20Robot%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Vacuum Robot');

UPDATE products
SET brand = 'IKEA',
    model = 'IDASEN Sit-Stand Desk',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 5 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 49999 ELSE price END,
    category = 'Smart Furniture',
    quality = COALESCE(NULLIF(quality, ''), 'Electric height adjustment, sturdy frame'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=IKEA%20IDASEN%20Sit-Stand%20Desk%20Smart%20Desk%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Desk');

UPDATE products
SET brand = 'Sleepyhead',
    model = 'RX5 Motorized Recliner',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 6 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 39999 ELSE price END,
    category = 'Smart Furniture',
    quality = COALESCE(NULLIF(quality, ''), 'Motorized recline, cushioned leatherette'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Sleepyhead%20RX5%20Motorized%20Recliner%20Electric%20Chair%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Electric Chair');

UPDATE products
SET brand = 'Duroflex',
    model = 'Elevate Adjustable Bed',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 4 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 79999 ELSE price END,
    category = 'Smart Furniture',
    quality = COALESCE(NULLIF(quality, ''), 'Motorized head and foot adjustment'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Duroflex%20Elevate%20Adjustable%20Bed%20Adjustable%20Bed%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Adjustable Bed');

UPDATE products
SET brand = 'Godrej Interio',
    model = 'Smart Lock Storage Cabinet',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 8 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 24999 ELSE price END,
    category = 'Smart Furniture',
    quality = COALESCE(NULLIF(quality, ''), 'Digital lock, steel storage body'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Godrej%20Interio%20Smart%20Lock%20Storage%20Cabinet%20Smart%20Cabinet%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Cabinet');

UPDATE products
SET brand = 'Apple',
    model = 'Mac Pro M2 Ultra',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 2 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 729900 ELSE price END,
    category = 'Ultra Premium Products',
    quality = COALESCE(NULLIF(quality, ''), 'Workstation grade Apple silicon desktop'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Apple%20Mac%20Pro%20M2%20Ultra%20Mac%20Pro%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Mac Pro');

UPDATE products
SET brand = 'Dell',
    model = 'Alienware m18 R2',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 3 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 349990 ELSE price END,
    category = 'Ultra Premium Products',
    quality = COALESCE(NULLIF(quality, ''), 'High-end gaming laptop, RTX graphics'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Dell%20Alienware%20m18%20R2%20Alienware%20Laptop%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Alienware Laptop');

UPDATE products
SET brand = 'Tesla',
    model = 'Wall Connector Gen 3',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 5 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 49999 ELSE price END,
    category = 'Ultra Premium Products',
    quality = COALESCE(NULLIF(quality, ''), 'EV charging accessory, Wi-Fi enabled'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Tesla%20Wall%20Connector%20Gen%203%20Tesla%20Accessories%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Tesla Accessories');

UPDATE products
SET brand = 'Apple',
    model = 'Vision Pro 256GB',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 2 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 349900 ELSE price END,
    category = 'Ultra Premium Products',
    quality = COALESCE(NULLIF(quality, ''), 'Spatial computing headset, micro-OLED display'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Apple%20Vision%20Pro%20256GB%20Apple%20Vision%20Pro%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Apple Vision Pro');

UPDATE products
SET brand = 'DJI',
    model = 'Mini 4 Pro Fly More Combo',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 4 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 109999 ELSE price END,
    category = 'Ultra Premium Products',
    quality = COALESCE(NULLIF(quality, ''), '4K camera drone, obstacle sensing'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=DJI%20Mini%204%20Pro%20Fly%20More%20Combo%20DJI%20Drone%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('DJI Drone');

UPDATE products
SET brand = 'Amazon',
    model = 'Echo Show 8 3rd Gen',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 12 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 13999 ELSE price END,
    category = 'Future Ready Products',
    quality = COALESCE(NULLIF(quality, ''), 'Voice assistant smart display'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Amazon%20Echo%20Show%208%203rd%20Gen%20AI%20Assistant%20Device%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('AI Assistant Device');

UPDATE products
SET brand = 'Ray-Ban Meta',
    model = 'Wayfarer Smart Glasses',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 7 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 32999 ELSE price END,
    category = 'Future Ready Products',
    quality = COALESCE(NULLIF(quality, ''), 'Camera, speakers and AI assistant support'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Ray-Ban%20Meta%20Wayfarer%20Smart%20Glasses%20Smart%20Glasses%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Smart Glasses');

UPDATE products
SET brand = 'Looking Glass',
    model = 'Portrait 3D Display',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 4 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 64999 ELSE price END,
    category = 'Future Ready Products',
    quality = COALESCE(NULLIF(quality, ''), 'Glasses-free 3D holographic display'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Looking%20Glass%20Portrait%203D%20Display%20Hologram%20Projector%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Hologram Projector');

UPDATE products
SET brand = 'Samsung',
    model = 'Flip Pro WM65B',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 3 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 159999 ELSE price END,
    category = 'Future Ready Products',
    quality = COALESCE(NULLIF(quality, ''), 'Interactive 4K collaboration display'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Samsung%20Flip%20Pro%20WM65B%20Digital%20Whiteboard%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Digital Whiteboard');

UPDATE products
SET brand = 'Temi',
    model = 'Personal Robot V3',
    colors = COALESCE(NULLIF(colors, ''), 'Black, Silver'),
    quantity = CASE WHEN quantity IS NULL OR quantity <= 0 THEN 2 ELSE quantity END,
    price = CASE WHEN price IS NULL OR price <= 0 THEN 299999 ELSE price END,
    category = 'Future Ready Products',
    quality = COALESCE(NULLIF(quality, ''), 'Autonomous assistant robot with display'),
    photo = COALESCE(NULLIF(photo, ''), 'https://tse1.mm.bing.net/th?q=Temi%20Personal%20Robot%20V3%20Robot%20Assistant%20official%20product%20photo&w=900&h=900&c=7&rs=1&p=0&o=5&pid=1.7')
WHERE LOWER(name) = LOWER('Robot Assistant');
