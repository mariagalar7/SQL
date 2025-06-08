/* ## Ejercicio 1 
1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto). */
CREATE TABLE Clientes(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255),
  email VARCHAR(255)
);

/* 2.  Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y email="juan@example.com".*/
INSERT INTO clientes(nombre, email)
VALUES ('Juan', 'juan@example.com');

/* 3.  Actualizar el email del cliente con id=1 a "juan@gmail.com".*/
UPDATE clientes
SET email = 'juan@gmail.com'
WHERE id = 1;

/* 4. Eliminar el cliente con id=1 de la tabla "Clientes"*/
DELETE FROM clientes
WHERE id = 1;

/* 5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero) */
CREATE TABLE Pedidos(
  id SERIAL PRIMARY KEY,
  cliente_id INT,
  producto VARCHAR(255),
  cantidad INT,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

/* 6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2 */
INSERT INTO pedidos (cliente_id, producto, cantidad)
VALUES (1, 'Camiseta', 2);

/* 7. Actualizar la cantidad del pedido con id=1 a 3 */
UPDATE pedidos
SET cantidad = 3
WHERE id = 1;

/* 8. Eliminar el pedido con id=1 de la tabla "Pedidos". */
DELETE FROM pedidos
WHERE id = 1;

/* 9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal). */
CREATE TABLE Productos(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255),
  precio DECIMAL(10,2)
);

/* 10. Insertar varios productos en la tabla "Productos" con diferentes valores */
INSERT INTO productos(nombre, precio)
VALUES
('Camiseta', 18.20),
('Pantalón', 24.50),
('Zapatos', 63.99),
('Complementos', 9.80)

/* 11. Consultar todos los clientes de la tabla "Clientes". */
SELECT * FROM Clientes;

/* 12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes. */
SELECT Pedidos.id, Clientes.nombre AS cliente, Pedidos.producto, Pedidos.cantidad
FROM Pedidos
JOIN Clientes ON Pedidos.cliente_id = Clientes.id;

/* 13.  Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50 */
SELECT * FROM Productos
WHERE precio > 50;

/* 14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5 */
SELECT * FROM Pedidos
WHERE cantidad >= 5;

/* 15.  Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A" */
SELECT * FROM Clientes
WHERE nombre LIKE 'A%';

/* 16.  Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente. */
SELECT Clientes.nombre, COUNT(Pedidos.id) AS total_pedidos
FROM Clientes
LEFT JOIN Pedidos ON Clientes.id = Pedidos.cliente_id
GROUP BY Clientes.nombre;

/* 17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto. */
SELECT Producto, SUM(Cantidad) AS total_pedidos
FROM Pedidos
GROUP BY producto;

/* 18.  Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha */
ALTER TABLE Pedidos
ADD COLUMN fecha DATE; 

/* 19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto". */
ALTER TABLE Pedidos
ADD CONSTRAINT fk_producto
FOREIGN KEY (producto_id) REFERENCES Productos(id);

/* 20.  Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa. */
SELECT Clientes.nombre AS cliente, Productos.nombre AS producto, Pedidos.cantidad AS cantidad
FROM Pedidos
JOIN Clientes on Pedidos.cliente_id = Clientes.id
JOIN Productos ON Pedidos.producto_id = Productos.id;

