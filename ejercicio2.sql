/*EJERCICIO 2: 
Nivel de dificultad: Fácil*/
/* 1. Crea una base de datos llamada "MiBaseDeDatos".*/
CREATE DATABASE MiBaseDeDatos; 

/* 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).*/
CREATE TABLE Usuarios(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255),
  edad INT,
);

/* 3. Inserta dos registros en la tabla "Usuarios".*/
INSERT INTO Usuarios(nombre, edad)
VALUES
  ('Maria', 26),
  ('Ana', 28);

/* 4. Actualiza la edad de un usuario en la tabla "Usuarios". */
UPDATE Usuarios,
SET edad = 30
WHERE nombre = 'Ana';

/* 5. Elimina un usuario de la tabla "Usuarios". */
DELETE FROM Usuarios, 
WHERE nombre = 'Maria'

/*Nivel de dificultad: Moderado*/
/* 1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).*/
CREATE TABLE Ciudades(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255),
  pais VARCHAR(255)
);

/* 2. Inserta al menos tres registros en la tabla "Ciudades".*/
INSERT INTO Usuarios(nombre, país)
VALUES
  ('Madrid', 'España'),
  ('Copenhague', 'Dinamarca'),
  ('París', 'Francia');

/* 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".*/
ALTER TABLE Usuarios
ADD COLUMN ciudad_id INT,
ADD CONSTRAINT fk_ciudad
FOREIGN KEY (ciudad_id) REFERENCES Ciudades(id);

/* 4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN) */
SELECT 
Usuarios.nombre AS usuario,
Ciudades.nombre AS ciudad,
Ciudades.país
FROM Usuarios
LEFT JOIN Ciudades ON Usuarios.ciudad_id = Ciudades.id;

/*5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN) */
SELECT 
Usuarios.nombre AS usuario,
Ciudades.nombre AS ciudad,
Ciudades.país
FROM Usuarios
INNER JOIN Ciudades ON Usuarios.ciudad_id = Coudades.id;
