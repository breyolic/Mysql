CREATE DATABASE empresa1;
USE empresa1;
CREATE TABLE empleados (
	emp_id int primary key auto_increment not null,
	emp_nom varchar(100),
	emp_ape varchar(100),
	emp_dni char(8)
);
CREATE TABLE registro_entrada (
	reg_entrada_id int primary key auto_increment not null,
	reg_entrada_emp_id int not null,
	reg_entrada_fecha date,
	reg_entrada_hora date
);
CREATE TABLE registro_salida (
	reg_salida_id int primary key auto_increment not null,
	reg_salida_emp_id int not null,
	reg_salida_fecha date,
	reg_salida_hora date
);
INSERT INTO empleados (emp_nom,emp_ape,emp_dni)
VALUES ('Juan','Perez','12345678'),
		('Armando','Paredes','98765432'),
		('Maria','La Del Barrio','66666666');

SELECT emp_nom, emp_dni FROM empleados
ORDER BY emp_id desc;

SELECT concat(emp_nom,' ',emp_ape) AS Nombres from empleados;

SELECT * FROM empleados
WHERE emp_id = '3';