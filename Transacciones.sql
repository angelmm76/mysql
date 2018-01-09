-- Transacciones
USE empresa;

START TRANSACTION;

INSERT INTO Empleados (emp_no,apellido,oficio,dir,salario)
 VALUES (9999,'Garcigrande','VENDEDOR',7902,1500);
SELECT * FROM empleados;
UPDATE empleados SET salario=444 WHERE emp_no=9999;
SELECT * FROM empleados;
 
-- ROLLBACK;
COMMIT;

SELECT * FROM empleados;
