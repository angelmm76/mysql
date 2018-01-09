CREATE DATABASE IF NOT EXISTS vistas;

USE vistas;

CREATE TABLE usuarios(
	id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nombre varchar(40) NOT NULL,
	rango varchar (50) NOT NULL
);

DELETE FROM usuarios;
INSERT INTO usuarios VALUES (null, 'Andrés', 'novato');
INSERT INTO usuarios VALUES (null, 'Luís', 'medio');
INSERT INTO usuarios VALUES (null, 'Juan', 'experto');

CREATE TABLE comentarios(
	id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	usuario_id int(11) NOT NULL,
	titulo varchar(40) NOT NULL,
	comentario varchar (50) NOT NULL,
	FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

DELETE FROM comentarios;
INSERT INTO comentarios VALUES (null, 1, 'Ole', 'Alucinante');
INSERT INTO comentarios VALUES (null, 2, 'Hola', 'Buenos días');
INSERT INTO comentarios VALUES (null, 3, '?', 'No lo entiendo');
INSERT INTO comentarios VALUES (null, 1, 'Top', 'Yo comento');
INSERT INTO comentarios VALUES (null, 3, 'De Juan', 'Yo soy Juan y comento');
INSERT INTO comentarios VALUES (null, 3, 'Atención', 'Menudo comentario');
INSERT INTO comentarios VALUES (null, 2, '123', '4567');
INSERT INTO comentarios VALUES (null, 3, 'Estupendo', 'ha estao bien');

DESC usuarios;
DESC comentarios;
SELECT * FROM usuarios;
SELECT * FROM comentarios;

--Vista usuarios_comentarios INNER JOIN usuario_id,nombre,rango,titulo,comentario
CREATE VIEW usuarios_comentarios AS SELECT u.id,u.nombre,u.rango,c.titulo,c.comentario
	FROM usuarios u INNER JOIN comentarios c ON u.id=c.usuario_id;
SHOW TABLES;
SELECT * FROM usuarios_comentarios;

--Mostrar comentarios del usuario id=2
CREATE VIEW comentarios_user2 AS SELECT id,usuario_id,titulo,comentario FROM comentarios 
	WHERE usuario_id=2;
SELECT * FROM comentarios_user2;

--Reemplazar/modificar vista
ALTER VIEW comentarios_user2 AS SELECT id,usuario_id,titulo,comentario FROM comentarios 
	WHERE usuario_id=1;
SELECT * FROM comentarios_user2;

--Borrar vistas
DROP VIEW usuarios_comentarios;
DROP VIEW comentarios_user2;
SHOW TABLES;
