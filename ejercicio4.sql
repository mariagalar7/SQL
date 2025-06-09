/* EJERCICIO 4 Nivel de dificultad Experto*/
/* 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos"). */
CREATE TABLE pedidos (
  id SERIAL PRIMARY KEY,
  id_usuario INT REFERENCES usuarios(id),
  id_producto INT REFERENCES productos(id)
);

/* 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos. */
INSERT INTO pedidos (id_usuario, id_producto) 
VALUES
(1, 2),
(2, 1),
(1, 3);

/* 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE). */
SELECT 
  usuarios.nombre AS usuario,
  COALESCE(productos.nombre, 'Sin producto') AS producto
FROM usuarios
LEFT JOIN pedidos ON usuarios.id = pedidos.id_usuario
LEFT JOIN productos ON pedidos.id_producto = productos.id;

/* 4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).*/
SELECT 
  usuarios.nombre AS usuario,
  productos.nombre AS producto
FROM usuarios
LEFT JOIN pedidos ON usuarios.id = pedidos.id_usuario
LEFT JOIN productos ON pedidos.id_producto = productos.id;

/* 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/
ALTER TABLE pedidos 
ADD COLUMN 
cantidad INT;

UPDATE pedidos SET cantidad = 1 WHERE id = 1;
UPDATE pedidos SET cantidad = 2 WHERE id = 2;
UPDATE pedidos SET cantidad = 3 WHERE id = 3;
