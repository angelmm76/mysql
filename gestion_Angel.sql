-- Test SQL 14/12/17
-- Crear base de datos
CREATE DATABASE IF NOT EXISTS GESTION;
USE GESTION;
-- Crear tablas
CREATE TABLE clientes(
	idcliente NUMERIC(4) NOT NULL PRIMARY KEY,
	nombrecliente VARCHAR(20),
	ciudad VARCHAR(20),
	pais VARCHAR(15),
	telefonocontacto VARCHAR(9) UNIQUE
	);
DESC clientes;

CREATE TABLE productos(
	idproducto NUMERIC(4) NOT NULL PRIMARY KEY,
	precio FLOAT(6,2)
	);
DESC productos;
	
CREATE TABLE pedidos(
	pedidoid NUMERIC(5) NOT NULL PRIMARY KEY,
	unidades NUMERIC(4),
	fecha_pedido DATE,
	idcliente NUMERIC(4),
	idproducto NUMERIC(4),
	CONSTRAINT FK_CLIENTE
		FOREIGN KEY (idcliente) 
		REFERENCES clientes (idcliente)
		ON UPDATE CASCADE
		ON DELETE SET NULL,
	CONSTRAINT FK_PRODUCTO
		FOREIGN KEY (idproducto) 
		REFERENCES productos (idproducto)
		ON UPDATE CASCADE
		ON DELETE SET NULL
	);
DESC pedidos;
SHOW CREATE TABLE pedidos;

--Insertar filas
DELETE FROM clientes;
INSERT INTO clientes VALUES (1673,'Pedro Mendez','Madrid','España','916365844');
INSERT INTO clientes VALUES (1287,'Gloria Carrasco','Guadalajara','España','685256785');
INSERT INTO clientes VALUES (1578,'Sergio Barcenas','Madrid','España','915899186');
INSERT INTO clientes VALUES (1393,'Sonia Lopez','Madrid','España','917589008');
INSERT INTO clientes VALUES (1189,'Maria Hernandez','Coruña','España','981245788');
INSERT INTO clientes VALUES (1789,'Ernesto Peres','Madrid','España','917400036');
INSERT INTO clientes VALUES (1467,'Mario Miralles','Cadiz','España','956014889');
SELECT * FROM clientes;

DELETE FROM productos;
INSERT INTO productos VALUES (1001,46);
INSERT INTO productos VALUES (1002,50);
INSERT INTO productos VALUES (1003,34);
INSERT INTO productos VALUES (1004,16);
INSERT INTO productos VALUES (1005,45);
INSERT INTO productos VALUES (1006,60);
INSERT INTO productos VALUES (1007,35);
SELECT * FROM productos;

DELETE FROM pedidos;
INSERT INTO pedidos VALUES (30001,35,'2017/04/22',1673,1001);
INSERT INTO pedidos VALUES (30002,156,'2015/02/09',1287,1007);
INSERT INTO pedidos VALUES (30003,67,'2015/10/15',1578,1002);
INSERT INTO pedidos VALUES (30004,87,'2015/10/10',1287,1003);
INSERT INTO pedidos VALUES (30005,45,'2015/05/16',1189,1007);
INSERT INTO pedidos VALUES (30006,54,'2016/06/17',1287,1005);
INSERT INTO pedidos VALUES (30007,67,'2016/08/17',1287,1003);
INSERT INTO pedidos VALUES (30008,5,'2016/01/16',1393,1004);
INSERT INTO pedidos VALUES (30009,89,'2017/06/15',1467,1005);
SELECT * FROM pedidos;

--Insertar columna en pedidos
ALTER TABLE pedidos ADD COLUMN precioproducto FLOAT(6,2);
SELECT * FROM pedidos;
--Añadir precio de productos
UPDATE pedidos SET precioproducto=46 WHERE idproducto=1001;
UPDATE pedidos SET precioproducto=50 WHERE idproducto=1002;
UPDATE pedidos SET precioproducto=34 WHERE idproducto=1003;
UPDATE pedidos SET precioproducto=16 WHERE idproducto=1004;
UPDATE pedidos SET precioproducto=45 WHERE idproducto=1005;
UPDATE pedidos SET precioproducto=60 WHERE idproducto=1006;
UPDATE pedidos SET precioproducto=35 WHERE idproducto=1007;
SELECT * FROM pedidos;

--Consulta con precio total
SELECT idcliente,idproducto,unidades,precioproducto,fecha_pedido,unidades*precioproducto"Precio Total del Pedido" FROM pedidos;

--Consulta clientes con teléfonos que empiezan por 91 y acaban por 6
SELECT idcliente,telefonocontacto FROM clientes WHERE telefonocontacto LIKE "91%6";
