use holamundo;

CREATE TABLE productos(
id int not null auto_increment,
nombre varchar(50) not null,
marca varchar(50) not null,
creado_por int not null,
primary key (id),
foreign key(creado_por) references user(id)
);

