USE academia;

DELIMITER //
-- Crear procedimiento
-- Copiar/pegar desde aquí...
CREATE PROCEDURE AlumnosCiudad(IN ciudad VARCHAR(45))
BEGIN
	SELECT * FROM alumnos WHERE Ciudad_Al=ciudad;
END//
-- ...hasta aquí

DELIMITER ;


DELIMITER //

CREATE PROCEDURE AlumnosEdad(IN edad INT)
BEGIN
	SELECT * FROM alumnos WHERE Edad_Al=edad;
END//

DELIMITER ;

-- Llamada de procedimiento
CALL AlumnosEdad(44);

-- Mostrar procedimientos
SHOW PROCEDURE STATUS;
-- Borrar procedimientos
DROP PROCEDURE AlumnosEdad;


DELIMITER //
-- Copiar/pegar desde aquí...
CREATE PROCEDURE viveMadrid(IN dni VARCHAR(9),IN nombre VARCHAR(45),IN ciudad VARCHAR(45))
BEGIN
	DECLARE vive CHAR(2);
	IF ciudad='Madrid' THEN
		SET vive='SI';
	ELSE
		SET vive='NO';
	END IF;
	
	INSERT INTO alumnos(DNI_Al,Nombre_Al,Ciudad_Al,viveMadrid) VALUES (dni,nombre,ciudad,vive);
	SELECT * FROM alumnos;
	
END//
-- ...hasta aquí

DELIMITER ;


DELIMITER //
-- Copiar/pegar desde aquí...
-- Registro por posicion
CREATE PROCEDURE alumnobyRow()
BEGIN
	DECLARE n INT DEFAULT 0;
	DECLARE i INT DEFAULT 0;
	SELECT COUNT(*) FROM alumnos INTO n;
	WHILE i<n DO
		SELECT Nombre_Al FROM alumnos LIMIT I,1;
		SET i=i+1;
	END WHILE;

END//
-- ...hasta aquí

DELIMITER ;


DELIMITER //
-- Procedimiento que admite parámetros de condición de búsqueda
CREATE PROCEDURE AlumnosNombre(IN cadena VARCHAR(50))
BEGIN
	SELECT * FROM alumnos WHERE Nombre_Al LIKE cadena;
END//

DELIMITER ;


DELIMITER //
-- Día de la semana con ELSE IF
CREATE PROCEDURE DiaSemanaElse(IN dia INT)
BEGIN
	DECLARE nombre VARCHAR(15);
	IF dia=1 THEN
		SET nombre='Lunes';
	ELSEIF dia=2 THEN
		SET nombre='Martes';
	ELSEIF dia=3 THEN
		SET nombre='Miercoles';
	ELSEIF dia=4 THEN
		SET nombre='Jueves';
	ELSEIF dia=5 THEN
		SET nombre='Viernes';
	ELSEIF dia=6 THEN
		SET nombre='Sabado';
	ELSEIF dia=7 THEN
		SET nombre='Domingo';
	ELSE
		SET nombre='¿???';
	END IF;
	
	SELECT CONCAT('El dia ',dia,' de la semana es ',nombre) AS 'Respuesta';
END//

DELIMITER ;


DELIMITER //
-- Día de la semana con WHEN
CREATE PROCEDURE DiaSemana(IN dia INT)
BEGIN
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
	
	SELECT CONCAT('El dia ',dia,' de la semana es ',nombre) AS 'Respuesta';
END//

DELIMITER ;


DELIMITER //
-- Copiar/pegar desde aquí...
-- Factorial
CREATE PROCEDURE factorial(IN num INT)
BEGIN
	DECLARE sig INT;
	DECLARE fact INT DEFAULT 1;
	SET sig = num;
	WHILE sig>1 DO
		SET fact=fact*sig;
		SET sig=sig-1;
	END WHILE;

	SELECT CONCAT('El factorial de ',num,' es ',fact) AS 'Resultado';
END//
-- ...hasta aquí

DELIMITER ;


DELIMITER //
-- Copiar/pegar desde aquí...
--Procedimiento con OUT
CREATE PROCEDURE ObtenerNombreApellidoSalida(IN dni VARCHAR(9), OUT NombreApellido VARCHAR(100))
BEGIN

	SELECT CONCAT(Nombre_Al,' ', Apellido1_Al) INTO NombreApellido FROM alumnos WHERE DNI_Al=dni;
END//
-- ...hasta aquí
DELIMITER ;

CALL ObtenerNombreApellidoSalida('1111111A', @nombre);
SELECT @nombre;


DELIMITER //
-- Copiar/pegar desde aquí...
-- Devuelve el nº de alumnos/filas
CREATE PROCEDURE NumeroAlumnos(OUT Numero INT)
BEGIN

	SELECT COUNT(*) INTO Numero FROM alumnos;
END//
-- ...hasta aquí
DELIMITER ;

CALL NumeroAlumnos(@num);
SELECT @num'Nº alumnos';


DELIMITER //
-- Copiar/pegar desde aquí...
-- Devuelve nº alumnos de una ciudad
CREATE PROCEDURE NumeroAlumnosCiudad(IN ciudad VARCHAR(45), OUT Numero INT)
BEGIN

	SELECT COUNT(*) INTO Numero FROM alumnos WHERE Ciudad_Al=ciudad;
END//
-- ...hasta aquí
DELIMITER ;

CALL NumeroAlumnosCiudad('Madrid',@num);
SELECT @num'Nº alumnos';

SET @ciudad='Alicante';
CALL NumeroAlumnosCiudad(@ciudad,@num);
SELECT @ciudad'Ciudad',@num'Nº alumnos';


DELIMITER //
-- Copiar/pegar desde aquí...
-- Devuelve nº alumnos y edad media para una ciudad
CREATE PROCEDURE NumeroAlumnosEdadCiudad(IN ciudad VARCHAR(45), OUT Numero INT, OUT EdadM FLOAT(4,2))
BEGIN

	SELECT COUNT(Nombre_Al) INTO Numero FROM alumnos WHERE Ciudad_Al=ciudad;
	SELECT AVG(Edad_Al) INTO EdadM FROM alumnos WHERE Ciudad_Al=ciudad;
END//
-- ...hasta aquí
DELIMITER ;

CALL NumeroAlumnosEdadCiudad('Madrid',@num,@edad);
SELECT @num'Nº alumnos',@edad'Edad Media';


DELIMITER //
-- Copiar/pegar desde aquí...
-- Devuelve nº alumnos para dos ciudades (procedim que devuelve más de un valor)
CREATE PROCEDURE NumeroAlumnosDosCiudades(IN ciudad1 VARCHAR(45), IN ciudad2 VARCHAR(45),
	OUT Numero1 INT, OUT Numero2 INT)
BEGIN

	SELECT COUNT(Nombre_Al) INTO Numero1 FROM alumnos WHERE Ciudad_Al=ciudad1;
	SELECT COUNT(Nombre_Al) INTO Numero2 FROM alumnos WHERE Ciudad_Al=ciudad2;
END//
-- ...hasta aquí
DELIMITER ;

CALL NumeroAlumnosDosCiudades('Madrid','Alicante',@num1,@num2);
SELECT @num1'Nº alumnos ciudad 1',@num2'Nº alumnos ciudad 2';


DELIMITER //
-- Copiar/pegar desde aquí...
-- Insertar registro
CREATE PROCEDURE nuevoEstudiante(IN nnombre VARCHAR(200),IN napellido VARCHAR(200),IN nemail VARCHAR(100))
BEGIN

	INSERT INTO estudiantes (nombre, apellido, email) VALUES(nnombre, napellido, nemail);
	SELECT * FROM estudiantes;
	
END//
-- ...hasta aquí

DELIMITER ;

CALL nuevoEstudiante('Lolo','Pez','ll@g.com');


DELIMITER //
-- Copiar/pegar desde aquí...
-- Borrar registro
CREATE PROCEDURE borrarEstudiante(IN bid INT)
BEGIN

	DELETE FROM estudiantes WHERE id=bid;
	SELECT * FROM estudiantes;
	
END//
-- ...hasta aquí

DELIMITER ;

CALL borrarEstudiante(9);


DELIMITER //
-- Copiar/pegar desde aquí...
-- Modificar nombre registro
CREATE PROCEDURE nombreEstudiante(IN nid INT, IN nnombre VARCHAR(200))
BEGIN

	UPDATE estudiantes SET nombre=nnombre WHERE id=nid;
	SELECT * FROM estudiantes;
	
END//
-- ...hasta aquí

DELIMITER ;

CALL nombreEstudiante(10,'Fulgencio');


DELIMITER //
-- Copiar/pegar desde aquí...
-- Multiplicar los primeros n impares
CREATE PROCEDURE multimpa(IN n INT)
BEGIN
	DECLARE sig INT;
	DECLARE res INT DEFAULT 1;
	SET sig = 2*n - 1;
	WHILE sig>1 DO
		SET res=res*sig;
		SET sig=sig-2;
	END WHILE;

	SELECT res AS 'Resultado';
END//
-- ...hasta aquí

DELIMITER ;


DELIMITER //
-- Copiar/pegar desde aquí...
-- Palíndromo
CREATE PROCEDURE espalindromo(IN palabra VARCHAR(50))
BEGIN
	DECLARE plen INT;
	DECLARE res CHAR(2);
    DECLARE izda CHAR(1);
    DECLARE dcha CHAR(1);
	REPEAT
		SET plen = LENGTH(palabra);  -- Longitud de la cadena
		SET izda = LEFT(palabra,1);  -- Primer caracter
		SET dcha = RIGHT(palabra,1);  -- Ultimo caracter
        -- SELECT plen,izda,dcha;
		IF STRCMP(izda,dcha)=0 THEN -- Si son iguales
			SET res='SI';
			SET palabra = SUBSTR(palabra,2,LENGTH(palabra)-2);
		ELSE
			SET res='NO';
			SET plen=1;
		END IF;
        -- SELECT palabra;
	UNTIL plen <= 1
	END REPEAT;

	SELECT res AS 'Es palíndromo?';
END//
-- ...hasta aquí

DELIMITER ;
