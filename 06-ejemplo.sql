CREATE TABLE personajes (
	mov_id int NOT NULL,
	act_id int NOT NULL,
	nom_personaje varchar(100) NOT NULL
);

INSERT INTO personajes (mov_id,act_id,nom_personaje)
VALUES
	(1,1,'Django'),
	(1,2,'Chica dinamita'),
	(2,3,'Derek Zoolander'),
	(2,4,'Hansel'),
	(3,5,'Jack'),
	(3,6,'Jill'),
	(8,11,'Capitan America'),
	(8,12,'Viuda Negra'),
	(8,13,'Hulk'),
	(8,14,'Spiderman');

SELECT m.movie_title, p.nom_personaje, 
CONCAT(a.act_firstname,' ',a.act_lastname) AS Nombre,
m.movie_release_year
FROM movies m, personajes p, actores a
WHERE m.movie_id = p.mov_id AND p.act_id = a.act_id;

--****************************************************************************************************
CREATE TABLE directores(
	dire_id int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
	dire_nom varchar(100) NOT NULL,
	dire_ape varchar(100) NOT NULL
);

INSERT INTO directores(dire_nom,dire_ape) VALUES
	('Giovani','Ciccia'),
	('Ben','Stiller'),
	('Dennis','Dugan'),
	('Jon','Turteltaub'),
	('Sean','Anders'),
	('Kenichi', 'Ueda'),
	('Gary','Ross'),
	('Joe','Russo');

ALTER TABLE movies ADD COLUMN dire_id int NOT NULL;

UPDATE movies set dire_id = 1 WHERE movie_id = 1;
UPDATE movies set dire_id = 2 WHERE movie_id = 2;
UPDATE movies set dire_id = 3 WHERE movie_id = 3;
UPDATE movies set dire_id = 4 WHERE movie_id = 4;
UPDATE movies set dire_id = 5 WHERE movie_id = 5;
UPDATE movies set dire_id = 6 WHERE movie_id = 6;
UPDATE movies set dire_id = 7 WHERE movie_id = 7;
UPDATE movies set dire_id = 8 WHERE movie_id = 8;
UPDATE movies set dire_id = 5 WHERE movie_id = 9;



INSERT INTO movies (movie_title,movie_release_year,movie_restriction) VALUES
('wachiman',2014,'PG-18'),
('Jumanji',2017,'PG');

UPDATE movies SET movie_release_year = 2018 where movie_title='Jumanji';

INSERT INTO directores (dire_nom, dire_ape) VALUES
('James','Cameron'),
('Guillermo','Del Toro');

SELECT m.movie_title AS Pelicula,CONCAT(d.dire_nom,' ',d.dire_ape) AS Director 
FROM MOVIES as m 
LEFT JOIN directores as d 
ON m.dire_id = d.dire_id;

SELECT m.movie_title AS Pelicula,CONCAT(d.dire_nom,' ',d.dire_ape) AS Director 
FROM MOVIES as m 
RIGHT JOIN directores as d 
ON m.dire_id = d.dire_id;

SELECT m.movie_title AS Pelicula,CONCAT(d.dire_nom,' ',d.dire_ape) AS Director 
FROM MOVIES as m 
INNER JOIN directores as d 
ON m.dire_id = d.dire_id;

SELECT m.movie_title AS Pelicula,CONCAT(d.dire_nom,' ',d.dire_ape) AS Director 
FROM MOVIES as m FULL JOIN directores as d 
ON m.dire_id = d.dire_id;

SELECT
	m.movie_title Titulo,
	m.movie_release_year Año,
	p.nom_personaje Personaje,
	CONCAT(d.dire_nom,' ',d.dire_ape) Director,
	CONCAT(a.act_firstname,' ',a.act_lastname) Actor
FROM movies m 
	INNER JOIN personajes p ON m.movie_id = p.mov_id
	INNER JOIN directores d ON m.dire_id = d.dire_id
	INNER JOIN actores a ON p.act_id = a.act_id;

SELECT
	m.movie_title Titulo,	
	CONCAT(d.dire_nom,' ',d.dire_ape) Director
FROM movies m 	
	INNER JOIN directores d ON m.dire_id = d.dire_id
WHERE d.dire_nom LIKE 'Se__'
ORDER BY movie_title;


SELECT
	m.movie_title as Pelicula,
	m.movie_release_year Año,
	CONCAT(a.act_firstname,' ',a.act_lastname) Actor
FROM movies m 
	LEFT JOIN personajes p ON m.movie_id = p.mov_id
	LEFT JOIN actores a ON p.act_id = a.act_id
WHERE m.movie_release_year = 2018;