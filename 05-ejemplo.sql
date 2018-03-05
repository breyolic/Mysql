CREATE TABLE amigos (
	ami_id int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
	ami_name varchar(100) NOT NULL,
	ami_ape varchar(100) NOT NULL,
	ami_fn date NOT NULL
);

INSERT INTO amigos (ami_name, ami_ape, ami_fn)
VALUES
	('Diego','Perez','1989-03-05'),
	('Pilar','Juarez','1999-05-20'),
	('Carlos','Slim','1980-02-14');

INSERT INTO amigos (ami_name, ami_ape, ami_fn)
VALUES
	('Pepito','Smith','1984-06-28'),
	('Jacinta','De Wasaberto','1970-07-07');

INSERT INTO amigos (ami_name, ami_ape, ami_fn)
VALUES
	('Carlos','Vilchez','1975-12-07');


SELECT *, (2018 - year(ami_fn)) AS Edad FROM amigos;

/*timestampdiff*/

SELECT ami_name, ami_ape, curdate() AS Hoy, 
timestampdiff(year,ami_fn,curdate()) AS Edad 
FROM amigos;

/*Convertir un String a Fecha*/

SELECT str_to_date('05,03,2018','%d,%m,%Y') AS Hoy;

SELECT str_to_date('05/03/2018','%d/%m/%Y') AS Hoy;

SELECT str_to_date('05-03-2018','%d-%m-%Y') AS Hoy;

SELECT str_to_date('05m03m2018','%dm%mm%Y') AS Hoy;

SELECT str_to_date('05032018','%d%m%Y') AS Hoy;

SELECT *, CONCAT('2018',SUBSTRING(ami_fn,5)) AS Cumpleaños FROM amigos;

SELECT ami_name,ami_ape, CONCAT(year(now()),'-',month(ami_fn),'-',day(ami_fn)) 
AS 'Cumples años en' 
FROM amigos;
/*
date_add(a,interval 1,year)
Aumentar en un año una fecha
*/

SELECT ami_name,ami_ape,CONCAT(year(now()),'-',month(ami_fn),'-',day(ami_fn)) 
AS 'Cumples años en',
date_add(
	CONCAT(year(now()),'-',month(ami_fn),'-',day(ami_fn)), interval 1 year
	) 
AS 'Cumple siguiente año'
FROM amigos;

SELECT ami_name,ami_ape,CONCAT(year(now()),'-',month(ami_fn),'-',day(ami_fn)) 
AS 'Cumples años en',
month(str_to_date(SUBSTRING(CONCAT(year(now()),'-',month(ami_fn),'-',day(ami_fn)),1),'%Y-%m-%d'))
AS 'Mes de un CONCAT'
FROM amigos;

/*
	Mostrar un mensaje, como si fuera una notificacion, de acuerdo a la fecha de cumpleaños
*/

SELECT ami_name, ami_ape, CONCAT(year(now()),'-',month(ami_fn),'-',day(ami_fn)) 
AS 'Cumples años en',
CASE
	WHEN (month(ami_fn) < month(curdate()) OR (day(ami_fn) < day(curdate()) AND month(ami_fn) <= month(curdate()))) THEN 'Ya cumpliste años'
	WHEN month(ami_fn) = month(curdate()) AND day(ami_fn)= day(curdate()) THEN 'Feliz cumpleaños'
	ELSE 'El próximo año cumples años'
	END AS Situacion
FROM amigos;

/*
	Mostrar un mensaje según cuántos meses faltan para el próximo cumpleaños	
*/

SELECT ami_name, ami_ape, CONCAT(year(now()),'-',month(ami_fn),'-',day(ami_fn)) 
AS 'Cumples años en',
CASE
	WHEN (month(ami_fn) < month(curdate()) OR (day(ami_fn) < day(curdate()) AND month(ami_fn) <= month(curdate()))) THEN 'Ya cumpliste años'
	WHEN month(ami_fn) = month(curdate()) AND day(ami_fn)= day(curdate()) THEN 'Feliz cumpleaños'
	ELSE 'Dentro de poco será tu cumpleaños'
	END AS Situacion,
date_add(
	CONCAT(year(now()),'-',month(ami_fn),'-',day(ami_fn)), interval 1 year
	) 
AS 'Cumple siguiente año',
/*Aqui empieza la logica*/
CASE
	WHEN month(ami_fn) >= month(now()) THEN CONCAT('Cumple dentro de ',month(ami_fn)-month(now()),' meses')
	WHEN month(ami_fn) < month(now()) THEN CONCAT('Cumple dentro de ',month(ami_fn)+12-month(now()),' meses')
	END AS 'Mes para prox cumple'
FROM amigos;

