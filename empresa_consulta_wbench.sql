USE EMPRESA;

SELECT VERSION() AS 'Version', USER() AS 'Usuario',
 DATABASE() AS 'Base de datos';

/*Empleados con oficio VENDEDOR*/
SELECT * FROM empleados WHERE oficio="VENDEDOR";
SELECT emp_no,apellido,oficio,fecha_alt,comision,salario FROM empleados WHERE oficio="VENDEDOR";

/*Limitar filas mostradas*/
SELECT * FROM empleados LIMIT 5;  -- 5 primeros, (5 a partir del 0)
SELECT * FROM empleados LIMIT 4,3;  -- 3 a partir del 4º (no incluido)

/*Empleados con oficio VENDEDOR y salario > 1500*/
SELECT * FROM empleados WHERE oficio="VENDEDOR" AND salario>1500;

/*Apellido, salario y oficio de empleados con ofic EMPLEADO o salario>1300*/
SELECT apellido,oficio,salario FROM empleados WHERE oficio="EMPLEADO" OR salario>1300;

/*Apellido, salario y oficio de empleados que no tengan oficio VENDEDOR*/
SELECT apellido,oficio,salario FROM empleados WHERE NOT oficio="VENDEDOR";
SELECT apellido,oficio,salario FROM empleados WHERE oficio!="VENDEDOR";
SELECT apellido,oficio,salario FROM empleados WHERE oficio<>"VENDEDOR";

/*Apellido, salario y oficio de empleados que no tengan oficio EMPLEADO y con salario>1300*/
SELECT apellido,oficio,salario FROM empleados WHERE NOT(oficio="EMPLEADO" AND salario)>1300;

/*Empleados con comisión nuLL*/
SELECT * FROM empleados WHERE comision=NULL;  -- No selecciona!!!
SELECT * FROM empleados WHERE comision IS NULL;

/*Mostrar salario total (14 pagas) con alias*/
SELECT apellido,salario,salario*14 AS 'Salario total' FROM empleados;
SELECT apellido,salario,salario*14'Salario total' FROM empleados;

/*Sumar campos evitando los null*/
SELECT apellido,salario,comision,salario+comision FROM empleados;
SELECT apellido,salario,comision,salario+IFNULL(comision,0)'Total' FROM empleados; 
