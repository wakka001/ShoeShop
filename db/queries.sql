use shoeshop;

-- Этап 4
SELECT u.id, u.full_name, r.name AS role
FROM users u
JOIN roles r ON r.id = u.role_id
WHERE u.login = ? AND u.password = ?;

-- Этап 5
SELECT p.id, p.article, p.name, p.unit, p.price, p.discount, p.stock_qty,
 p.description, p.photo,
 c.name AS category, b.name AS brand, s.name AS sotrudnik
FROM products p
JOIN category c ON c.id = p.category_id
JOIN brand b ON b.id = p.manufacturer_id
JOIN sotrudniki s ON s.id = p.supplier_id;

-- Этап 6
SELECT p.id, p.article, p.name, p.unit, p.price, p.discount, p.stock_qty,
 p.description, p.photo,
 c.name AS category, b.name AS brand, s.name AS sotrudnik
FROM products p
JOIN category c ON c.id = p.category_id
JOIN brand b ON b.id = p.manufacturer_id
JOIN sotrudniki s ON s.id = p.supplier_id
WHERE p.name LIKE CONCAT('%', ?, '%') AND p.supplier_id = ?
ORDER BY p.stock_qty DESC;

SELECT p.id, p.article, p.name, p.unit, p.price, p.discount, p.stock_qty,
 p.description, p.photo,
 c.name AS category, b.name AS brand, s.name AS sotrudnik
FROM products p
JOIN category c ON c.id = p.category_id
WHERE p.name LIKE CONCAT('%', ?, '%') AND p.supplier_id = ?
ORDER BY p.stock_qty DESC;

SELECT p.id, p.article, p.name, p.unit, p.price, p.discount, p.stock_qty,
 p.description, p.photo,
 c.name AS category, b.name AS brand, s.name AS sotrudnik
FROM products p
JOIN brand b ON b.id = p.manufacturer_id
WHERE p.name LIKE CONCAT('%', ?, '%') AND p.supplier_id = ?
ORDER BY p.stock_qty DESC;

SELECT p.id, p.article, p.name, p.unit, p.price, p.discount, p.stock_qty,
 p.description, p.photo,
 c.name AS category, b.name AS brand, s.name AS sotrudnik
FROM products p
JOIN sotrudniki s ON s.id = p.supplier_id
WHERE p.name LIKE CONCAT('%', ?, '%') AND p.supplier_id = ?
ORDER BY p.stock_qty DESC;

-- Этап 7
SELECT id, name FROM categories;
SELECT id, name FROM manufacturers;
SELECT id, name FROM suppliers;

INSERT INTO products
 (article, name, unit, price, discount, stock_qty, description, photo, category_id,
manufacturer_id, supplier_id)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

SELECT * FROM products WHERE id = ?;

UPDATE products
SET article=?, name=?, unit=?, price=?, discount=?, stock_qty=?, description=?, photo=?,
 category_id=?, manufacturer_id=?, supplier_id=?
WHERE id = ?;

-- Этап 8
SELECT COUNT(*) AS used_in_orders FROM productorders WHERE product_id = 1;
DELETE FROM products WHERE id = 1;