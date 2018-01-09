-- Examen triggers

-- Tabla de logs
CREATE TABLE logEnvios (
	idLogEnvios INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	P CHAR(5) NOT NULL,
	C CHAR(5) NOT NULL,
	T CHAR(5) NOT NULL,
	usuario VARCHAR(50) NULL,
	fecha_ins DATETIME);

-- Tabla de envios totales
CREATE TABLE EnviosTotales (
	P CHAR(5) NOT NULL PRIMARY KEY,
	PNOMBRE VARCHAR(20),
	TOTAL INT);
	
DELETE FROM EnviosTotales;
INSERT INTO EnviosTotales (`P`,`PNOMBRE`,`TOTAL`) VALUES ('P1','CARLOS',0);
INSERT INTO EnviosTotales (`P`,`PNOMBRE`,`TOTAL`) VALUES ('P2','JUAN',0);
INSERT INTO EnviosTotales (`P`,`PNOMBRE`,`TOTAL`) VALUES ('P3','JOSE',0);
INSERT INTO EnviosTotales (`P`,`PNOMBRE`,`TOTAL`) VALUES ('P4','INMA',0);
INSERT INTO EnviosTotales (`P`,`PNOMBRE`,`TOTAL`) VALUES ('P5','EVA',0);

	
-- Trigger 
CREATE DEFINER=`root`@`localhost` TRIGGER `examen`.`envios_AFTER_INSERT` 
	AFTER INSERT ON `envios` FOR EACH ROW
BEGIN
	INSERT INTO logEnvios (P,C,T,usuario,fecha_ins)
		VALUES (NEW.P, NEW.C,NEW.T,CURRENT_USER(),NOW());
	UPDATE enviosTotales SET Total = Total + NEW.Cantidad WHERE P=NEW.P;
END


INSERT INTO envios (P,C,T,cantidad) VALUES ('P1','C1','T1',200);
INSERT INTO envios (P,C,T,cantidad) VALUES ('P1','C1','T4',700);
INSERT INTO envios (P,C,T,cantidad) VALUES ('P2','C3','T4',500);
INSERT INTO envios (P,C,T,cantidad) VALUES ('P3','C2','T2',700);
INSERT INTO envios (P,C,T,cantidad) VALUES ('P4','C1','T2',400);
INSERT INTO envios (P,C,T,cantidad) VALUES ('P5','C4','T2',50);
INSERT INTO envios (P,C,T,cantidad) VALUES ('P2','C2','T2',90);
INSERT INTO envios (P,C,T,cantidad) VALUES ('P1','C5','T2',10);
INSERT INTO envios (P,C,T,cantidad) VALUES ('P3','C5','T2',70);

SELECT * FROM enviostotales;
SELECT * FROM logenvios;
SELECT * FROM envios;
