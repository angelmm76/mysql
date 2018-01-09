-- Triggers

-- Ver triggers
SHOW TRIGGERS;

USE empresa;

DELIMITER //
-- Trigger que pone el salario a 0 si es negativo
-- Copiar/pegar desde aquí...
CREATE TRIGGER before_empleado_update
BEFORE INSERT ON empleados FOR EACH ROW
BEGIN
	IF NEW.salario < 0 THEN
		SET NEW.salario = 0;
	END IF;
	IF NEW.comision IS NULL THEN
		SET NEW.comision  = 0.1;
	END IF;

END//
-- ...hasta aquí
DELIMITER ;

INSERT INTO Empleados (emp_no,apellido,oficio,dir,salario)
 VALUES (9999,'Garcigrande','VENDEDOR',7902,-1500);
SELECT * FROM empleados;

DELETE FROM empleados WHERE emp_no=9999;
SELECT * FROM empleados;

SET @suma=0;
SELECT @suma;

DELIMITER //
-- Trigger que al insertar empleados va cumulando el salario en una variable @suma
-- Copiar/pegar desde aquí...
CREATE TRIGGER before_empleado_insert
BEFORE INSERT ON empleados FOR EACH ROW
SET @suma = @suma + NEW.salario;
-- ...hasta aquí
DELIMITER ;
 
DELETE FROM empleados WHERE emp_no>9000;
SELECT * FROM empleados;

INSERT INTO Empleados (emp_no,apellido,oficio,dir,salario)
			VALUES (9333,'Garci','VENDEDOR',7902,1000);
INSERT INTO Empleados (emp_no,apellido,oficio,dir,salario)
			VALUES (9222,'Garra','VENDEDOR',7902,500);
INSERT INTO Empleados (emp_no,apellido,oficio,dir,salario)
			VALUES (9111,'Gato','VENDEDOR',7902,800);
SELECT * FROM empleados;
SELECT @suma;


-- Tabla de logs
CREATE TABLE empleado_log (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	emp_no DECIMAL(4,0) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	salario_old FLOAT(6,2),
	salario_NEW FLOAT(6,2),
	fecha_act DATETIME,
	user VARCHAR(50) NULL);
	
DELIMITER //
-- Trigger que pone el salario a 0 si es negativo
-- Copiar/pegar desde aquí...
CREATE TRIGGER after_empleado_update
AFTER UPDATE ON empleados FOR EACH ROW
BEGIN
	INSERT INTO empleado_log (emp_no,apellido,salario_old,salario_new,fecha_act,user)
	VALUES (OLD.emp_no, OLD.apellido, OLD.salario,NEW.salario,NOW(),CURRENT_USER());
	INSERT INTO empleado_log2 (descripcion) VALUES
    (CONCAT('El usuario ',CURRENT_USER(),' cambió el salario ',
    OLD.salario,' por el salario ',NEW.salario,', y el apellido ',
    OLD.apellido,' por el apellido ',NEW.apellido,' del empleado nº ',
    OLD.emp_no,' el día ',NOW()));

END//
-- ...hasta aquí
DELIMITER ;

UPDATE empleados SET salario=1500 WHERE emp_no=7369;
UPDATE empleados SET salario=2720 WHERE emp_no=7788;
UPDATE empleados SET salario=2580 WHERE emp_no=7566;
UPDATE empleados SET salario=1780 WHERE emp_no=7901;
UPDATE empleados SET salario=1950 WHERE emp_no=7499;
UPDATE empleados SET salario=2340 WHERE emp_no=7369;
UPDATE empleados SET salario=1030 WHERE emp_no=7934;
UPDATE empleados SET salario=720 WHERE emp_no=7654;
UPDATE empleados SET salario=1530 WHERE emp_no=7521;
UPDATE empleados SET salario=1450 WHERE emp_no=7900;
SELECT * FROM empleados;

SELECT * FROM empleado_log;

CREATE TABLE empleado_log2 (
	idlog INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	descripcion VARCHAR(200));
	
UPDATE empleados SET salario=1220,apellido='MAÑOZ' WHERE emp_no=7934;
UPDATE empleados SET salario=1360,apellido='MOÑOZ' WHERE emp_no=7934;
UPDATE empleados SET salario=1500,apellido='MIÑOZ' WHERE emp_no=7934;
UPDATE empleados SET salario=1770,apellido='MEÑOZ' WHERE emp_no=7934;
UPDATE empleados SET salario=1080,apellido='MUÑOZ' WHERE emp_no=7934;
	

-- Ejercicio doc MySQL
CREATE TABLE test1(a1 INT);
CREATE TABLE test2(a2 INT);
CREATE TABLE test3(a3 INT NOT NULL AUTO_INCREMENT PRIMARY KEY);
CREATE TABLE test4(
  a4 INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  b4 INT DEFAULT 0
);

INSERT INTO test3(a3) VALUES 
	(NULL),(NULL),(NULL),(NULL),(NULL), (NULL),(NULL),(NULL),(NULL),(NULL);
INSERT INTO test4(a4) VALUES 
  (0), (0), (0), (0), (0), (0), (0), (0), (0), (0);

-- Trigger en tabla test1. Antes de insertar un valor:
-- Insertar en tabla 2 el mismo valor
-- Borrar en tabla 3 ese nº de registro
-- Update b4=b4+1 en tabla 4 para ese nº de registro

CREATE TRIGGER `empresa`.`test1_BEFORE_INSERT`
	BEFORE INSERT ON `test1` FOR EACH ROW
BEGIN
	INSERT INTO test2(a2) VALUES (NEW.a1);
    DELETE FROM test3 WHERE a3=NEW.a1;
    UPDATE test4 SET b4=b4+1 WHERE a4=NEW.a1;
END

INSERT INTO test1(a1) VALUES (4);
