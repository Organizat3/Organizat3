CREATE TABLE IF NOT EXISTS Usuario (
	UsuarioID int(11) NOT NULL AUTO_INCREMENT,
	Correo varchar(40) COLLATE utf8_spanish_ci NOT NULL,
	Contrasena varchar(255) COLLATE utf8_spanish_ci NOT NULL,
	Nombre varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
	Apellidos varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
	FechaNacimiento date DEFAULT NULL,
	Idioma varchar(10) DEFAULT NULL,
	Modo char DEFAULT NULL,
	PRIMARY KEY (UsuarioID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS Asignaturas (
	AsignaturasID int(11) NOT NULL AUTO_INCREMENT,
	UsuarioID int(11) NOT NULL DEFAULT '0',
	Nombre varchar(20) COLLATE utf8_spanish_ci NOT NULL,
	Curso varchar(4) NOT NULL,	
	PRIMARY KEY (AsignaturasID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS Examenes (
	ExamenesID int(11) NOT NULL AUTO_INCREMENT, 
	AsignaturasID int(11) NOT NULL,
	UsuarioID int(11) NOT NULL,
	Fecha date NOT NULL,
	Hora time NOT NULL,
	Aula varchar(10) NOT NULL,
	PRIMARY KEY (ExamenesID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS Tareas (
	TareasID int(11) NOT NULL AUTO_INCREMENT,
	AsignaturasID int(11) NOT NULL,
	UsuarioID int(11) NOT NULL,
	PRIMARY KEY(TareasID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS Clase (
	ClaseID int(11) NOT NULL AUTO_INCREMENT, 
	AsignaturasID int(11) NOT NULL,
	UsuarioID int(11) NOT NULL, 
	Hora time NOT NULL, 
	Aula varchar(10) NOT NULL,
	PRIMARY KEY(ClaseID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;


ALTER TABLE Asignaturas
	ADD CONSTRAINT Asignaturas_ibfk_1 FOREIGN KEY (UsuarioID) REFERENCES Usuario (UsuarioID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Clase
	ADD CONSTRAINT Clase_ibfk_1 FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Clase
	ADD CONSTRAINT Clase_ibfk_2 FOREIGN KEY (AsignaturasID) REFERENCES Asignaturas(AsignaturasID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Tareas
	ADD CONSTRAINT Tareas_ibfk_1 FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Tareas
	ADD CONSTRAINT Tareas_ibfk_2 FOREIGN KEY (AsignaturasID) REFERENCES Asignaturas(AsignaturasID) ON DELETE CASCADE ON UPDATE CASCADE;
	
ALTER TABLE Examenes
	ADD CONSTRAINT Examenes_ibfk_1 FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Examenes
	ADD CONSTRAINT Examenes_ibfk_2 FOREIGN KEY (AsignaturasID) REFERENCES Asignaturas(AsignaturasID) ON DELETE CASCADE ON UPDATE CASCADE;
