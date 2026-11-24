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
-- Всё вместе
SELECT p.id, p.article, p.name, p.unit, p.price, p.discount, p.quantity,
p.description, p.photo,
c.name AS category, b.name AS brand, s.name AS sotrudnik
FROM products p
JOIN category c ON c.id = p.category_id
JOIN brand b ON m.id = p.manufacturer_id
JOIN sotrudniki s ON s.id = p.supplier_id
WHERE p.name LIKE '?' AND p.supplier_id = ?
ORDER BY p.quantity DESC;

-- Только поиск
SELECT * FROM products p 
WHERE p.name LIKE '?' AND p.supplier_id = ?
ORDER BY p.stock_qty DESC;

-- Только фильтр по поставщику
SELECT * FROM products p 
WHERE p.supplier_id = ?;

-- Только сортировка по остатку
-- по возрастанию и по убыванию
SELECT * FROM products p 
WHERE p.name LIKE '?' AND p.supplier_id = ?
ORDER BY p.stock_qty ASC;

SELECT * FROM products p 
WHERE p.name LIKE '?' AND p.supplier_id = ?
ORDER BY p.stock_qty DESC;


-- Этап 7
SELECT id, name FROM category;
SELECT id, name FROM brand;
SELECT id, name FROM sotrudniki;

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

-- Везде, где мы оставили знаки вопроса - работу проверили