USE academia;

-- Mostrar procedimientos
SHOW FUNCTION STATUS;
-- Borrar procedimientos
DROP FUNCTION holaMundo;


DELIMITER //
-- Funcion hola
CREATE FUNCTION holaMundo() RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
	-- Copiar/pegar desde aquí...
	RETURN 'Hola Mundo';
	-- ...hasta aquí
END //
DELIMITER ;

SELECT holaMundo();


DELIMITER //
-- Funcion saludo con parametro
CREATE FUNCTION saludo(nombre VARCHAR(45)) RETURNS VARCHAR(60) DETERMINISTIC
BEGIN
	-- Copiar/pegar desde aquí...
	RETURN CONCAT('Hola ', nombre);
	-- ...hasta aquí
END //
DELIMITER ;

SELECT saludo('Pepe')'Saludando a...';


DELIMITER //
-- Funcion identificar numero
CREATE FUNCTION quenumero(num INT) RETURNS VARCHAR(40) DETERMINISTIC
BEGIN
	-- Copiar/pegar desde aquí...
	DECLARE mensaje VARCHAR(40);
	IF num=1 THEN
		SET mensaje='Es el numero uno';
	ELSEIF num=2 THEN
		SET mensaje='Es el numero dos';
	ELSEIF num=3 THEN
		SET mensaje='Es el numero tres';
	ELSE
		SET mensaje='Es un numero desconocido';
	END IF;
	RETURN mensaje;
	-- ...hasta aquí
END //
DELIMITER ;

SELECT quenumero(3);


DELIMITER //
-- Funcion dia semana
CREATE FUNCTION DiaSemanaFunc(dia INT) RETURNS VARCHAR(40) DETERMINISTIC
BEGIN
	-- Copiar/pegar desde aquí...
	DECLARE nombre VARCHAR(15);
	CASE dia
		WHEN 1 THEN SET nombre='Lunes';
		WHEN 2 THEN SET nombre='Martes';
		WHEN 3 THEN SET nombre='Miercoles';
		WHEN 4 THEN SET nombre='Jueves';
		WHEN 5 THEN SET nombre='Viernes';
		WHEN 6 THEN SET nombre='Sabado';
		WHEN 7 THEN SET nombre='Domingo';
		ELSE SET nombre='¿???';
	END CASE;
	RETURN nombre;
	-- ...hasta aquí
END //
DELIMITER ;

SELECT DiaSemanaFunc(6);


DELIMITER //
-- Funcion que devuelve el factorial con WHILE
CREATE FUNCTION factorialFunc(num INT) RETURNS INT DETERMINISTIC
BEGIN
	-- Copiar/pegar desde aquí...
	DECLARE fact INT DEFAULT 1;
	WHILE num>1 DO
		SET fact=fact*num;
		SET num=num-1;
	END WHILE;
	RETURN fact;
	-- ...hasta aquí
END//

DELIMITER ;

SELECT factorialFunc(5);


DELIMITER //
-- Funcion que devuelve el factorial con REPEAT
CREATE FUNCTION factorialFuncRep(num INT) RETURNS INT DETERMINISTIC
BEGIN
	-- Copiar/pegar desde aquí...
	DECLARE fact INT DEFAULT 1;
	REPEAT
		SET fact=fact*num;
		SET num=num-1;
	UNTIL num <= 1
	END REPEAT;
	RETURN fact;
	-- ...hasta aquí
END//

DELIMITER ;

