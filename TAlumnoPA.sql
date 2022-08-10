---------------------------------------------------------------------------------
---------------------------------------TAlumno----------------------------------
------Actividad: Implementar Agregar, Eliminar, Actualizar, Buscar y Listar
------Presentado para el día miercoles 10 de agosto a traves de aula virtual
------Kelma Mendoza 
------9/8/2022
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

use BDUniversidad
go
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
----Listar Alumno
if OBJECT_ID('spListarAlumno') is not null
	drop proc spListarAlumno
go

create proc spListarAlumno
as
begin
	select * from TAlumno
end
go
---Listamos a los alumnos
exec spListarAlumno

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
----Agregar Alumno
if OBJECT_ID('spAgregarAlumno') is not null
	drop proc spAgregarAlumno
go

create proc spAgregarAlumno
@CodAlumno char(5),@Apellidos varchar(50),@Nombres varchar(50),
@LugarNac varchar(50),@FechaNac datetime,@CodEscuela char(3)
as
begin
	--CodAlumno debe estar registrado
	if not exists(select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		begin
			--Procede a la inserción de datos del alumno
			insert into TAlumno values(@CodAlumno,@Apellidos,@Nombres,@LugarNac,@FechaNac,@CodEscuela)
			select CodError = 0, Mensaje = '<---- Se agregó correctamente al alumno ---->'
		end
	else select CodError = 1, Mensaje = '<---- ERROR: CodAlumno duplicado ---->'
end
go
---Agregamos a un alumno
exec spAgregarAlumno 'A0006','Ruiz García','Paola','Cusco','4/5/2000','E01'

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
----Eliminar Alumno
if OBJECT_ID('spEliminarAlumno') is not null
	drop proc spEliminarAlumno
go

create proc spEliminarAlumno
@CodAlumno char(5)
as
begin
	--CodAlumno debe estar registrado
	if not exists(select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		select CodError = 1, Mensaje = '<---- ERROR: CodAlumno no encontrado ---->'
	else 
		begin
			--Procede a la eliminación del alumno
			DELETE FROM TAlumno  WHERE CodAlumno = @CodAlumno
			select CodError = 0, Mensaje = '<---- Se eliminó correctamente ---->'
		end
end
go
---Eliminamos algunos alumnos
exec spEliminarAlumno 'A00'
exec spEliminarAlumno 'A0006'

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
----Actualizar Alumno
if OBJECT_ID('spActualizarAlumno') is not null
	drop proc spActualizarAlumno
go

create proc spActualizarAlumno
@CodAlumno char(5),@Apellidos varchar(50),@Nombres varchar(50),@LugarNac varchar(50),
@FechaNac datetime,@CodEscuela char(3)
as
begin
	--CodAlumno debe estar registrado
	if not exists(select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		select CodError = 1, Mensaje = '<---- ERROR: CodAlumno no encontrado ---->'
	else 
		begin
			--Procede a la actualización del alumno
			UPDATE TAlumno SET Apellidos=@Apellidos,Nombres=@Nombres,LugarNac=@LugarNac,
			FechaNac=@FechaNac,CodEscuela=@CodEscuela WHERE CodAlumno = @CodAlumno
			select CodError = 0, Mensaje = '<---- Se actualizó correctamente ---->'
		end
end
go
---Atualizamos a un alumno
--('A0003','Quispe Quispe','Juan','Cusco','8/14/2004','E03')
exec spActualizarAlumno 'A0003','Quispe Quispe','Juan','Cusco','8/14/2004','E01'

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
----Buscar Alumno
if OBJECT_ID('spBuscarAlumno') is not null
	drop proc spBuscarAlumno
go

create proc spBuscarAlumno
@CodAlumno char(5)
as
begin
	--CodAlumno debe estar registrado
	if not exists(select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		select CodError = 1, Mensaje = '<---- ERROR: CodAlumno no encontrado ---->'
	else 
		begin
			--Procede a buscar al alumno
			select * from TAlumno where CodAlumno=@CodAlumno
		end
end
go
---Buscamos a algunos alumnos
exec spBuscarAlumno 'A0001'
exec spBuscarAlumno 'A0005'
