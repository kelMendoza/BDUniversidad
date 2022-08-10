--Base de datos ejemplo
--Kelma Mendoza
-- 8/8/2022
use master
go

if DB_ID('BDUniversidad') is not null
	drop database BDUniversidad
go
create database BDUniversidad
go

use BDUniversidad
go

--Crear tablas
if OBJECT_ID('TEscuela') is not null
	drop table TEscuela
go
create table TEscuela
(
	CodEscuela char(3) primary key,
	Escuela varchar(50),
	Facultad varchar(50)
)
go

if OBJECT_ID('TAlumno') is not null
	drop table TAlumno
go
create table TAlumno
(
	CodAlumno char(5) primary key,
	Apellidos varchar(50),
	Nombres varchar(50),
	LugarNac varchar(50),
	FechaNac datetime,
	CodEscuela char(3),
	foreign key (CodEscuela) references TEscuela
)
go

--Inserción de datos
---------TEscuela
insert into TEscuela values('E01','Sistemas','Ingeniería')
insert into TEscuela values('E02','Civil','Ingeniería')
insert into TEscuela values('E03','Industrial','Ingeniería')
insert into TEscuela values('E04','Ambiental','Ingeniería')
insert into TEscuela values('E05','Arquitectura','Ingeniería')
go

select * from TEscuela

---------TAlumno
insert into TAlumno values('A0001','Mendoza Segovia','Kelma','Cusco','5/8/2002','E01')
insert into TAlumno values('A0002','Mendoza Segovia','Mireya','Cusco','6/17/2007','E01')
insert into TAlumno values('A0003','Quispe Quispe','Juan','Cusco','8/14/2004','E03')
insert into TAlumno values('A0004','Quecaño Soto','Julia','Cusco','1/15/1990','E03')
insert into TAlumno values('A0005','Gonzales Perez','Carlos','Cusco','4/4/1996','E05')
go

select * from TAlumno
go