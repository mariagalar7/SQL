/*EJERCICIO 3  Nivel de dificultad: Difícil*/
/* 1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico). */
CREATE TABLE Productos(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255),
  precio INT
);

/* 2. Inserta al menos cinco registros en la tabla "Productos".*/
INSERT INTO Productos(nombre, precio)
VALUES
  ('Camisetas', 15),
  ('Americanas', 34),
  ('Cazadoras', 57),
  ('Zapatos', 80),
  ('Pantalones', 38);

/* 3. Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE Productos
SET precio = 30
WHERE nombre = 'Americanas';

/* 4. Elimina un producto de la tabla "Productos". */
DELETE FROM Productos 
WHERE nombre = 'Camisetas'

/* 5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos")*/
CREATE TABLE compras (
  id SERIAL PRIMARY KEY,
  usuario_id INT REFERENCES usuarios(id),
  producto_id INT REFERENCES productos(id),
  cantidad INT
);

INSERT INTO compras (cantidad)
VALUES 
(1),
(2);

SELECT usuarios.nombre AS usuario, Productos.nombre AS producto
FROM compras
INNER JOIN usuarios ON compras.usuario_id = usuarios.id
INNER JOIN Productos ON compras.producto_id = productos.id;
