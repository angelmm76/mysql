-- Practica UF 2 SQL 12/12/17
	 
--Mostrar version SQL, usuario y base de datos
SELECT VERSION() AS "Version", USER() AS "Usuario", DATABASE() AS "Base de datos";
status;

--Empleados con oficio VENDEDOR
SELECT * FROM empleados WHERE oficio="VENDEDOR";
SELECT emp_no,apellido,oficio,fecha_alt,comision,salario FROM empleados WHERE oficio="VENDEDOR";

--Limitar filas mostradas
SELECT * FROM empleados LIMIT 5;  -- 5 primeros, (5 a partir del 0)
SELECT * FROM empleados LIMIT 4,3;  -- 3 a partir del 4º (no incluido)

--Empleados con oficio VENDEDOR y salario > 1500
SELECT * FROM empleados WHERE oficio="VENDEDOR" AND salario>1500;

--Apellido, salario y oficio de empleados con oficio EMPLEADO o salario>1300
SELECT apellido,oficio,salario FROM empleados WHERE oficio="EMPLEADO" OR salario>1300;

--Apellido, salario y oficio de empleados que no tengan oficio VENDEDOR
SELECT apellido,oficio,salario FROM empleados WHERE NOT oficio="VENDEDOR";
SELECT apellido,oficio,salario FROM empleados WHERE oficio!="VENDEDOR";
SELECT apellido,oficio,salario FROM empleados WHERE oficio<>"VENDEDOR";

--Apellido, salario y oficio de empleados que no tengan oficio EMPLEADO y con salario>1300
SELECT apellido,oficio,salario FROM empleados WHERE NOT(oficio="EMPLEADO" AND salario)>1300;

--Empleados con comisión nula
SELECT * FROM empleados WHERE comision=NULL;  -- No selecciona!!!
SELECT * FROM empleados WHERE comision IS NULL;

--Mostrar salario total (14 pagas) con alias
SELECT apellido,salario,salario*14 AS "Salario total" FROM empleados;
SELECT apellido,salario,salario*14"Salario total" FROM empleados;

--Sumar campos evitando los null
SELECT apellido,salario,comision,salario+comision FROM empleados;  --Error! Suma null si un sumando es null
SELECT apellido,salario,comision,salario+IFNULL(comision,0)"Total" FROM empleados;  --Suma los null como 0

--Apellido, fecha, salario, salario>2000, salario + 1000,dept_no distinto de 20
SELECT apellido,fecha_alt,salario,salario>2000,salario+1000,dept_no!=20 FROM empleados;

--Departamentos diferentes en tabla empleados
SELECT DISTINCT dept_no FROM empleados;

--Diferentes oficios en cada departamento en tabla empleados
SELECT DISTINCT dept_no,oficio FROM empleados;

--Empleados cuyo nombre empiece por M y tenga un salario entre 1000 y 1650
SELECT * FROM empleados WHERE apellido LIKE "M%" AND salario BETWEEN 1000 AND 1650;

--Emplados cuyo apellido incluya una A en el segundo carácter
SELECT emp_no"Nº Empleado",apellido FROM empleados WHERE apellido LIKE "_A%";

--Empleados en los departamentos 10 y 30
SELECT emp_no,apellido,dept_no FROM empleados WHERE dept_no IN(10,30);

--Salarios max, min, media, desv estándar y count
SELECT MAX(salario)"Salario máximo",MIN(salario),AVG(salario),STD(salario),
	COUNT(salario),ATAN(salario) FROM empleados;

--Redondear salarios
SELECT emp_no,apellido,ROUND(salario,0)"Salario sin céntimos" FROM empleados;

--Empleados cuya comisión sea múltiplo de 100
SELECT emp_no,apellido,comision FROM empleados WHERE (MOD(comision,100)=0 AND comision!=0);

--Mostrar tres primeros caracteres de apellido seguido de un punto
SELECT emp_no,apellido,CONCAT(SUBSTR(apellido,1,3), ".") FROM empleados;
SELECT emp_no,apellido,CONCAT(LEFT(apellido,3), ".") FROM empleados;
SELECT emp_no,apellido,LOWER(CONCAT(LEFT(apellido,3), ".")) FROM empleados;

--Nombres de deptos con más de 6 caracteres y reemplazando las A por *
SELECT dnombre,REPLACE(dnombre,"A","*") FROM departamento WHERE LENGTH(dnombre)>6;

--Mostrar la fecha que será dentro de una semana
SELECT CURDATE() AS "Hoy",ADDDATE(CURDATE(), INTERVAL 1 WEEK) AS "Dentro de una semana";
SELECT CURDATE() AS "Hoy",ADDDATE(CURDATE(), 7) AS "Dentro de una semana";

--Empleados que entraron en la empresa un lunes
SELECT emp_no,apellido,fecha_alt,DAYOFWEEK(fecha_alt) FROM empleados;
SELECT emp_no,apellido,fecha_alt,DAYOFWEEK(fecha_alt) FROM empleados WHERE DAYOFWEEK(fecha_alt)=2;

--Mostrar el nº de trienios de cada empleados
SELECT emp_no,apellido, fecha_alt,FLOOR(DATEDIFF(CURDATE(),fecha_alt)/(365.24*3))"Trienios" FROM empleados;

--Empleados que llevan más de 26 años en la empresa
SELECT emp_no,apellido, fecha_alt FROM empleados WHERE DATE_SUB(CURDATE(), INTERVAL 26 YEAR)>fecha_alt;

--Mostrar fecha alta con formato dia, nº dia de mes de año
SELECT emp_no,apellido,fecha_alt,DATE_FORMAT(fecha_alt, "%W, %d de %M de %Y")"Fecha alta" FROM empleados;

--Mostrar fecha alta con formato DD/MM/YYYY
SELECT emp_no,apellido,fecha_alt,DATE_FORMAT(fecha_alt, "%d/%m/%Y")"Fecha alta" FROM empleados;

--Mostrar para cada empleado el valor que sea mayor entre su salario y el doble de la comisión
SELECT emp_no,apellido,salario,comision,GREATEST(salario,2*IFNULL(comision,0)) FROM empleados;

--Mostrar empleados en los que la suma de salario y comisión es menor de 2000
SELECT emp_no,apellido,salario,comision,salario+IFNULL(comision,0)"Total" FROM Total<2000;  --Error! Alias no permitido
SELECT emp_no,apellido,salario,comision,salario+IFNULL(comision,0)"Total" FROM empleados WHERE salario+IFNULL(comision,0)<2000;
 
--Empleados ordenados por apellido
SELECT emp_no,apellido FROM empleados ORDER BY apellido;

--Orden alfabético de empleados por departamento
SELECT dept_no,apellido FROM empleados ORDER BY dept_no,apellido;

--Empleados clasificados por oficios y en orden descendente de salarios
SELECT apellido,oficio,salario FROM empleados ORDER BY oficio,salario DESC;

--Apellidos y salario total (14*sal + com) ordenado de mayor a menor por este total
SELECT apellido,14*salario+IFNULL(comision,0)"Total" FROM empleados ORDER BY Total DESC;
SELECT apellido,14*salario+IFNULL(comision,0)"Total" FROM empleados ORDER BY 2 DESC;

--Cinco empleados con menos salario
SELECT apellido,salario FROM empleados ORDER BY salario LIMIT 5;

--Producto cartesiano de apellidos y nombre de departamentos
SELECT emp_no,apellido,dnombre,loc FROM empleados,departamento;

--Producto cartesiano de apellidos y nombre de departamentos filtrando por departamento
SELECT emp_no,apellido,empleados.dept_no,dnombre FROM empleados,departamento
	WHERE empleados.dept_no=departamento.dept_no;
	
--Números y nombres de departamentos a los que pertenecen los empleados (INNER JOIN)
SELECT DISTINCT d.dept_no,d.dnombre FROM empleados e,departamento d WHERE e.dept_no=d.dept_no;
SELECT d.dept_no,d.dnombre FROM empleados e,departamento d WHERE e.dept_no=d.dept_no;
SELECT d.dept_no,d.dnombre FROM empleados e NATURAL JOIN departamento d;  -- En desuso
SELECT d.dept_no,d.dnombre FROM empleados e INNER JOIN departamento d ON e.dept_no=d.dept_no;

--Mostrar empleados con nombre de sus jefes de la misma tabla (alias imprescindibles)
SELECT e.emp_no,e.apellido"Empleado",e.dir,d.apellido"Director" FROM empleados e, empleados d 
	WHERE e.dir=d.emp_no;
SELECT e.emp_no,e.apellido"Empleado",e.dir,d.apellido"Director" FROM empleados e INNER JOIN empleados d 
	ON e.dir=d.emp_no;

--Mostrar jefes de los empleados cuyo oficio sea vendedor
SELECT e.apellido"Empleado",e.oficio,e.dir,d.apellido"Director" FROM empleados e, empleados d 
	WHERE e.dir=d.emp_no AND e.oficio="VENDEDOR";
SELECT e.apellido"Empleado",e.oficio,e.dir,d.apellido"Director" FROM empleados e INNER JOIN empleados d 
	ON e.dir=d.emp_no WHERE e.oficio="VENDEDOR";

--Departamentos y sus empleados, incluso si no los tuviera (LEFT/RIGHT JOIN)
SELECT d.dept_no,d.dnombre,e.apellido FROM departamento d LEFT JOIN empleados e ON d.dept_no=e.dept_no;
SELECT d.dept_no,d.dnombre,e.apellido FROM empleados e RIGHT JOIN departamento d ON e.dept_no=d.dept_no;

--Empleados que cobran el sueldo máximo (subconsultas)
SELECT emp_no,apellido,salario FROM empleados WHERE salario=(SELECT MAX(salario) FROM empleados);

--Vista con analistas (view)
CREATE VIEW analistas AS SELECT * FROM empleados WHERE oficio="ANALISTA";

--Oficios distintos de los empleados
SELECT oficio FROM empleados GROUP BY oficio;

--Nº de empleados y sueldo medio para cada oficio (agrupación de empleados)
SELECT oficio,COUNT(emp_no)"Nº empleados",AVG(salario)"Salario medio" FROM empleados GROUP BY oficio;

--Nº de empleados, nombre de departamento y sueldo medio por departamento
SELECT e.dept_no,d.dnombre,COUNT(e.emp_no)"Nº empleados",AVG(e.salario)"Salario medio" 
	FROM empleados e INNER JOIN departamento d ON e.dept_no=d.dept_no GROUP BY e.dept_no;
	
--Nº de empleados para oficios con más de 3 empleados (HAVING)
SELECT oficio,COUNT(emp_no)"Nº empleados" FROM empleados GROUP BY oficio HAVING COUNT(emp_no)>3;

--Empleados de contabilidad (con ANY sin JOIN)
SELECT emp_no,apellido,dept_no FROM empleados 
	WHERE dept_no = ANY (SELECT dept_no FROM departamento WHERE dnombre="CONTABILIDAD");
