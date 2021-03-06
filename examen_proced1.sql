-- Examen procedimiento 3/1/18

-- Crear BD
CREATE DATABASE IF NOT EXISTS AGENDA;
USE AGENDA;

DELIMITER //

CREATE PROCEDURE tabla(IN param CHAR(2))
BEGIN

	IF STRCMP(param,'CR')=0 THEN
		CREATE TABLE IF NOT EXISTS diario (
			idDiario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			dia DATE,
			hora TIME,
			evento VARCHAR(40));
	ELSEIF STRCMP(param,'DE')=0 THEN
		DROP TABLE IF EXISTS diario;
	END IF;
END 

//

DELIMITER ;


CALL tabla('CR');
SHOW TABLES;
CALL tabla('DE');
SHOW TABLES;
CALL tabla('CR');
SHOW TABLES;
CALL tabla('CR');
SHOW TABLES;
CALL tabla('DE');
SHOW TABLES;
CALL tabla('DE');
SHOW TABLES; 
