/*
-----------------------------------------------------------------------------------------------
*/

CREATE DATABASE juegos;

USE juegos;

CREATE TABLE resultados (
	res_id int unsigned not null primary key auto_increment,
	res_nom varchar(100) not null,
	res_ape varchar(100) not null,
	res_game1 int unsigned not null,
	res_game2 int unsigned not null,
	res_game3 int unsigned not null,
	res_game4 int unsigned not null
);

INSERT INTO resultados (res_nom,res_ape,res_game1,res_game2,res_game3,res_game4)
VALUES
	('Alex','Perez',15,16,12,14),
	('Juan','Torres',12,16,10,9),
	('Jon','Salcedo',16,16,13,14),
	('Luna','Miranda',17,14,11,13),
	('Yani','Jackson',11,8,14,12);


SELECT CONCAT(res_nom,' ', res_ape) AS Nombre
from resultados;

SELECT (res_game1+res_game2+res_game4+res_game3)/4 as Promedio
from resultados;

SELECT CONCAT(SUBSTRING(res_nom,1,1),' ', SUBSTRING(res_ape,1,1)) AS Iniciales
FROM resultados;

SELECT	CONCAT(res_nom,' ', res_ape) AS Nombre,
		(res_game1+res_game2+res_game4+res_game3)/4 AS Promedio,
		CONCAT(SUBSTRING(res_nom,-1,1),' ', SUBSTRING(res_ape,-1,1)) AS Iniciales
FROM resultados
ORDER BY Promedio DESC;