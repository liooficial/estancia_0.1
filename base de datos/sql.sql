CREATE DATABASE LABORATORIOS_DE_COMPUTO;


USE LABORATORIOS_DE_COMPUTO;

CREATE TABLE Salones(
Id varchar(10) PRIMARY KEY,
Estado varchar(15)
);

CREATE TABLE Materias(
Nombre varchar(80) PRIMARY KEY,
Color varchar(10)
);

CREATE TABLE Usuarios(
Id varchar(15) PRIMARY KEY,
TipoUsuario varchar(15),
Nombre varchar(50),
Contraseña varchar(20),
Estado varchar(15)
);

CREATE TABLE Administradores(
Id varchar(15) PRIMARY KEY,
Nombre varchar(50),
Contraseña varchar(20),
Estado varchar(15)
);

CREATE TABLE Software(
Id int PRIMARY KEY,
Nombre varchar(50),
VersionX varchar(10)
);

CREATE TABLE Horarios(
Id varchar(20) PRIMARY KEY,
Salon varchar(10),
Profesor varchar(15),
Materia varchar(80),
HoraInicio varchar(10),
HoraFin varchar(10),
Periodo varchar(30),
Año int,
Estado varchar(15),
FOREIGN KEY  (Salones) REFERENCES Salones(Nombre),
FOREIGN KEY  (Profesor) REFERENCES Usuarios(Id),
FOREIGN KEY  (Materia) REFERENCES Materias(Nombre)
);

CREATE TABLE Rondines(
Id int  PRIMARY KEY AUTO_INCREMENT,
Fecha datetime ,
Administrador varchar(15),
Salon varchar(10),
Comentario varchar(350),
FOREIGN KEY  (Administrador) REFERENCES Administradores(Id),
FOREIGN KEY  (Salon) REFERENCES Salones(Id)
);

CREATE TABLE Mensajes(
Id int PRIMARY KEY AUTO_INCREMENT,
Administrador varchar(15),
Asunto varchar(50),
Cuerpo varchar(200),
TipoDeUsuarioAlQueSeDirige varchar(15),
Estado varchar(15),
FOREIGN KEY  (Administrador) REFERENCES Administradores(Id)
);

CREATE TABLE Equipos(
Id varchar(8) PRIMARY KEY,
Salon varchar(10),
Estado varchar(15),
Teclado varchar(40),
Mouse varchar(40),
Monitor varchar(40),
Procesador varchar(40),
Almacenamiento varchar(40),
FOREIGN KEY  (Salones) REFERENCES Salones(Nombre)
);


/* Bajo este modelo el administrador no puede reportar observaciones, para hacerlo debemos incluir al admin dentro de la tabla de usuarios y no como una entidad (table) distinta */
CREATE TABLE Observaciones(
Id int PRIMARY KEY AUTO_INCREMENT,
Fecha datetime ,
Usuario varchar(15),
Equipo varchar(8),
Comentario varchar(200),
Estado varchar(15),
FOREIGN KEY  (Usuario) REFERENCES Usuarios(Id),
FOREIGN KEY  (Equipo) REFERENCES Equipos(Id)
);

CREATE TABLE SoftwarePorEquipo(
Equipo varchar(8) FOREIGN KEY REFERENCES Equipos(Id),
Software int FOREIGN KEY REFERENCES Software(Id)

);