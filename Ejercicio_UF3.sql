-- Test UF 3 28/12/17 Angel MM

DROP PROCEDURE IF EXISTS loteria;

DELIMITER //

CREATE PROCEDURE loteria(IN num CHAR(5), IN prem CHAR(5))
BEGIN
	DECLARE texto VARCHAR(30);
	IF STRCMP(num,prem)=0 THEN
		SET texto='Premio 5000 eur';
	ELSEIF STRCMP(SUBSTR(num,2,4),SUBSTR(prem,2,4))=0 THEN
		SET texto='Premio 500 eur';
	ELSEIF STRCMP(SUBSTR(num,3,3),SUBSTR(prem,3,3))=0 THEN
		SET texto='Premio 50 eur';
	ELSEIF STRCMP(SUBSTR(num,4,2),SUBSTR(prem,4,2))=0 THEN
		SET texto='Premio 5 eur';
	ELSEIF STRCMP(SUBSTR(num,5,1),SUBSTR(prem,5,1))=0 OR 
			STRCMP(SUBSTR(num,1,1),SUBSTR(prem,1,1))=0 THEN
		SET texto='Premio 1 eur';
	ELSE
		SET texto='No premiado';
	END IF;
	
	SELECT texto AS Atencion;
END//

DELIMITER ;

CALL loteria('00000','12345');
CALL loteria('00000','00000');
CALL loteria('00000','10000');
CALL loteria('00000','12000');
CALL loteria('00000','12300');
CALL loteria('00000','12340');
CALL loteria('00000','02345');
