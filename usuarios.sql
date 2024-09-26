USE holamundo;
CREATE TABLE usuarios(
	id int not null auto_increment,
    nombre varchar(30) not null,
    edad int not null,
    email varchar(100) not null,
    primary key (id)
);

INSERT INTO usuarios (nombre, edad, email) VALUES('Gonzalo', 30, 'Gonzalo@mail.com');
INSERT INTO usuarios (nombre, edad, email) VALUES('Oscar', 50, 'Oscar@mail.com');
INSERT INTO usuarios (nombre, edad, email) VALUES('Ruben', 40, 'Ruben@mail.com');
INSERT INTO usuarios (nombre, edad, email) VALUES('Leila', 27, 'Leila@mail.com');