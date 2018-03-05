SELECT @@hostname;

CREATE DATABASE peliculas;

USE peliculas;

CREATE TABLE actores (
	act_id int unsigned primary key not null auto_increment,
	act_firstname varchar(255),
	act_lastname varchar(255)
);

CREATE TABLE movies(
	movie_id int unsigned primary key not null auto_increment,
	movie_title varchar(255) not null,
	movie_release_year int unsigned not null,
	movie_rating varchar(10) not null
);

ALTER TABLE movies 
CHANGE COLUMN movie_rating movie_restriction varchar(15) NOT NULL;

INSERT INTO actores(act_firstname,act_lastname)
VALUES
	('Giovannni','Ciccia'),
	('Melania','Urbina'),
	('Ben','Stiller'),
	('Owen','Wilson'),
	('Adam','Sandler'),
	('Chistine','Taylor'),
	('Will','Farrell'),
	('Milla','Jovovich'),
	('Lenny','Kravits');

INSERT INTO actores(act_firstname,act_lastname)
VALUES
	('Robert','Downy Jr.'),
	('Cris','Evans'),
	('Scarlett','Johanson'),
	('Mark','Rufalo'),
	('Tom','Holland');

INSERT INTO movies (movie_title, movie_release_year, movie_restriction)
VALUES
	('Django','2018','PG-18');

UPDATE movies 
SET 
	movie_release_year = 2018
WHERE
	movie_id = 1;

INSERT INTO movies (movie_title, movie_release_year, movie_restriction)
VALUES
	('Zoolander',2001,'PG-13'),
	('Jack & Jill',2012,'PG-13'),
	('National Treasure',2004,'PG'),
	('Guerra de papas 2', 2018, 'PG'),
	('Resident Evil 5', 2016,'PG-14'),
	('Juegos del Hambre',2013 , 'PG'),
	('Civil War',2016,'PG');

SELECT CONCAT(act_firstname, ' ', act_lastname) AS nomb_completo 
FROM actores;

SELECT SUBSTRING(act_firstname,1,1) AS Iniciales
FROM actores;

SELECT SUBSTRING(act_lastname,1,3) AS Iniciales
FROM actores;

SELECT CONCAT(SUBSTRING(act_firstname,1,2),' ', SUBSTRING(act_lastname,1,2)) AS Iniciales
FROM actores;

SELECT 1+2 AS Operacion 
FROM actores;

SELECT 'active' as status, act_firstname
FROM actores;

SELECT * 
FROM actores
LIMIT 10;

SELECT * 
FROM actores
ORDER BY act_id DESC
LIMIT 10;

SELECT * 
FROM actores
WHERE act_id > 4 AND act_id <10
ORDER BY act_id DESC
LIMIT 10;

SELECT *
FROM movies
WHERE movie_restriction = 'PG';

SELECT *
FROM movies
GROUP BY 4;

SELECT movie_restriction, COUNT(*) as num_movies
FROM movies
GROUP BY movie_restriction;

SELECT movie_release_year, COUNT(*) as num_movies
FROM movies
GROUP BY movie_release_year
ORDER BY movie_release_year DESC;

SELECT *
FROM movies
WHERE movie_title LIKE 'Guerra%'

SELECT *
FROM movies
ORDER BY movie_release_year ASC
LIMIT 1;

SELECT * FROM movies 
WHERE movie_restriction = 'PG' AND movie_title LIKE 'gu%';

SELECT * FROM movies 
WHERE movie_restriction = 'PG' AND movie_title NOT LIKE 'gu%';

SELECT * FROM movies
WHERE movie_release_year >2004;

SELECT * FROM movies
WHERE movie_release_year >2004
ORDER BY movie_release_year ASC;

SELECT * FROM movies
WHERE movie_release_year >=2013 AND movie_release_year <=2016;

SELECT * FROM movies
WHERE movie_release_year BETWEEN 2013 AND 2016;

SELECT * FROM movies
WHERE movie_release_year IN (2013, 2016);/*IN= valores iguales a*/

SELECT * FROM movies
WHERE movie_release_year != 2016;

SELECT * FROM movies
WHERE movie_release_year <> 2016;

SELECT * FROM movies
WHERE movie_restriction = 'PG-14' OR movie_restriction = 'PG-13';

/*Peliculas del 2016 y que empiezen con r*/
SELECT * FROM movies
WHERE movie_release_year = 2016 AND movie_title LIKE 'r%';

SELECT movie_title, movie_restriction, 
CASE 
	WHEN movie_restriction = 'PG' THEN 'Apto para todos'
	WHEN movie_restriction = 'PG-18' THEN 'Para mayores de 18 años'
	WHEN movie_restriction = 'PG-13' THEN 'Para mayores de 13 años'
	WHEN movie_restriction = 'PG-14' THEN 'Para mayores de 14 años'
	ELSE 'Sin clasificación'
END AS Apto
FROM movies;

/*

---------------------------------------------------------------
*/

CREATE TABLE game_resultados (
	res_id int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
	res_jug_nom varchar(100),
	res_jug_ape varchar(100),
	res_juego_num int UNSIGNED NOT NULL,
	res_juego_score int UNSIGNED NOT NULL
);

INSERT INTO game_resultados (res_jug_nom,res_jug_ape,res_juego_num,res_juego_score)
VALUES
	('Breyson','Olivera',1,15.2),
	('Breyson','Olivera',2,17.2),
	('Breyson','Olivera',3,13.7),
	('Breyson','Olivera',4,11.9),
	('Carlos','Quispe',1,13.2),
	('Carlos','Quispe',2,11.2),
	('Carlos','Quispe',3,8.7),
	('Carlos','Quispe',4,13.9),
	('Son','Goku',1,14.2),
	('Son','Goku',2,9.2),
	('Son','Goku',3,14.7),
	('Son','Goku',4,12.9);

SELECT res_jug_nom, SUM(res_juego_score)
FROM game_resultados
GROUP BY res_jug_nom;

SELECT res_jug_nom, AVG(res_juego_score)
FROM game_resultados
GROUP BY res_jug_nom;

SELECT res_jug_nom, SUM(res_juego_score) as Total, AVG(res_juego_score) AS Promedio
FROM game_resultados
GROUP BY res_jug_nom;

