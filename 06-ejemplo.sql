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