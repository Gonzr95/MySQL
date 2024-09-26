create database holamundo;
show databases;
use holamundo;
CREATE TABLE animales(
id int,
tipo varchar(30),
estado varchar(100),
PRIMARY KEY (id)
);
ALTER TABLE animales MODIFY COLUMN id int auto_increment;
INSERT INTO animales(tipo, estado) values ('chanchito', 'feliz');

-- comentario, forma de crear la misma tabla con autoincremental y mas detalle
CREATE TABLE animales(
id int NOT NULL auto_increment,
tipo varchar(30) DEFAULT NULL,
estado varchar(100) DEFAULT NULL,
PRIMARY KEY (id)
);

INSERT INTO animales (tipo, estado) VALUES ('pepe', 'contento');
INSERT INTO animales (tipo, estado) VALUES ('lolo', 'enojado');
INSERT INTO animales (tipo, estado) VALUES ('idris', 'enojado');

SELECT * FROM animales;
SELECT * FROM animales WHERE id = 1;
SELECT * FROM animales WHERE estado = 'enojado' AND tipo = 'idris';

UPDATE animales SET estado = 'feliz' WHERE id = 3;
UPDATE animales SET tipo = 'perro' WHERE id = 2;
UPDATE animales SET tipo = 'gato' WHERE id = 3;
UPDATE animales SET tipo = 'loro' WHERE id = 4;


