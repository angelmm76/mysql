-- Examen procedimiento 3/1/18

-- Insertar datos
DELETE FROM diario;
INSERT INTO diario (dia,hora,evento) VALUES ('2016/04/26','11:55','hola');
INSERT INTO diario (dia,hora,evento) VALUES ('2016/06/20','11:55','hola');
INSERT INTO diario (dia,hora,evento) VALUES ('2016/07/15','11:55','hola');
INSERT INTO diario (dia,hora,evento) VALUES ('2016/07/28','11:55','hola');
INSERT INTO diario (dia,hora,evento) VALUES ('2016/08/01','11:55','hola');
INSERT INTO diario (dia,hora,evento) VALUES ('2016/09/07','11:55','hola');
INSERT INTO diario (dia,hora,evento) VALUES ('2016/09/16','11:55','hola');
INSERT INTO diario (dia,hora,evento) VALUES ('2016/09/29','11:55','hola');
INSERT INTO diario (dia,hora,evento) VALUES ('2016/10/11','11:55','hola');
INSERT INTO diario (dia,hora,evento) VALUES ('2016/12/24','11:55','hola');
SELECT * FROM diario;


CREATE PROCEDURE eliminar(IN desde DATE, IN hasta DATE)
BEGIN
	
	IF desde IS NULL THEN
		DELETE FROM diario WHERE DATEDIFF(dia, hasta) < 0;
	ELSEIF hasta IS NULL THEN
		DELETE FROM diario WHERE DATEDIFF(dia, desde) > 0;
	ELSE
		DELETE FROM diario WHERE dia BETWEEN desde AND hasta;
	END IF;
    
    SELECT * FROM diario;
END


CALL eliminar('2016/07/01','2016/07/30');
CALL eliminar('2016/08/01','2016/08/30');
CALL eliminar(NULL,'2016/05/20');
CALL eliminar('2016/11/15',NULL);
SELECT * FROM diario;
