use Calendar;

create table Usuarios(
	correoElectronico varchar(40) not null,
	nombreUsuario varchar(20) not null primary key,
	contrasena varchar(20),
	nombre varchar(15),
	apellidos varchar(35),
	fechaNacimiento date
) ; 

create table Asignaturas(
	nombreAsignatura varchar(30) not null primary key,
	nombreUsuario varchar(20) references Usuarios(nombreUsuario),
	nombreAula varchar(20),
	nombreProfesor varchar(50), 
	color integer,
	hora date, 
	nombreAnnoEscolar varchar(20) references AnnoEscolar(nombreAnnoEscolar)
) ; 

create table Profesores(
	nombreUsuario varchar(20),
	nombreProfesor varchar(50),
	despacho varchar(15),
	correoElectronico varchar(40), 
	horarioTutorias varchar(100) 
) ;

create table Tareas( 
	nombreTarea varchar(20) not null primary key, 
	nombreUsuario varchar(20) references Usuarios(nombreUsuario),
	nombreAsignatura varchar(30) references Asignaturas(nombreAsignatura),
	fechaMaxima date, 
	importancia varchar(8) check(importancia in( 'Baja', 'Normal', 'Alta', 'Urgente'))
) ; 

create table AnnoEscolar( 
	nombreAnnoEscolar varchar(20) not null primary key,	 
	nombreUsuario varchar(20) references Usuarios(nombreUsuario),
	inicio date, 
	fin date
) ; 

create table Ajustes( 
	nombreUsuario varchar(20) references Usuarios(nombreUsuario),
	fondo integer,
	idioma varchar(12) check(idioma in( 'Spanish', 'English')),
	modo varchar(30) check(modo in('Estudios Obligatorios', 'Estudios Superiores')) 
) ; 