---------------------------------------------------------------------------------
---------------------------------------TEscuela----------------------------------
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
----Listar Escuela
if OBJECT_ID('spListarEscuela') is not null
	drop proc spListarEscuela
go

create proc spListarEscuela
as
begin
	select * from TEscuela
end
go
---Listamos a las escuelas
exec spListarEscuela

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
----Agregar Escuela

if OBJECT_ID('spAgregarEscuela') is not null
	drop proc spAgregarEscuela
go

create proc spAgregarEscuela
@CodEscuela char(3), @Escuela varchar(50), @Facultad varchar(50)
as
begin
	---CodEscuela no puede ser duplicado
	if not exists(select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
		--Escuela no puede ser duplicado
		if not exists (select Escuela from TEscuela where Escuela=@Escuela)
			begin
				insert into TEscuela values(@CodEscuela,@Escuela,@Facultad)
				select CodError = 0, Mensaje = 'Se insertó correctamente Escuela'
			end
		else select CodError = 1, Mensaje = 'Error: Escuela duplicada'
	else select CodError = 1, Mensaje = 'Error: CodEscuela duplicada'
end
---Agregamos a una escuela
exec spAgregarEscuela 'E06','Medicina','Ciencias de la salud'
exec spAgregarEscuela 'E07','Psicología','Ciencias de la salud'

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
----Eliminar Escuela
if OBJECT_ID('spEliminarEscuela') is not null
	drop proc spEliminarEscuela
go

create proc spEliminarEscuela
@CodEscuela char(3)
as
begin
	--CodEscuela debe estar registrado
	if not exists(select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
		select CodError = 1, Mensaje = '<---- ERROR: CodEscuela no encontrada ---->'
	else 
		begin
			--Procede a la eliminación de la escuela
			DELETE FROM TEscuela  WHERE CodEscuela = @CodEscuela
			select CodError = 0, Mensaje = '<---- Se eliminó correctamente ---->'
		end
end
go
---Eliminamos algunas escuelas
exec spEliminarEscuela 'E06'
exec spEliminarEscuela 'E07'

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
----Actualizar Escuela
if OBJECT_ID('spActualizarEscuela') is not null
	drop proc spActualizarEscuela
go

create proc spActualizarEscuela
@CodEscuela char(3), @Escuela varchar(50), @Facultad varchar(50)
as
begin
	--CodEscuela debe estar registrado
	if not exists(select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
		select CodError = 1, Mensaje = '<---- ERROR: CodEscuela no encontrada ---->'
	else 
		begin
			--Procede a la actualización de la escuela
			UPDATE TEscuela SET Escuela = @Escuela, Facultad = @Facultad WHERE CodEscuela = @CodEscuela
			select CodError = 0, Mensaje = '<---- Se actualizó correctamente ---->'
		end
end
go
---Actualizamos a una escuela
--('E04','Ambiental','Ingeniería')
exec spActualizarEscuela 'E04','Metalúrgica','Ingenieria'

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
----Buscar Escuela
if OBJECT_ID('spBuscarEscuela') is not null
	drop proc spBuscarEscuela
go

create proc spBuscarEscuela
@CodEscuela char(3)
as
begin
	--CodEscuela debe estar registrado
	if not exists(select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
		select CodError = 1, Mensaje = '<---- ERROR: CodEscuela no encontrada ---->'
	else 
		begin
			--Procede a buscar a la escuela
			select * from TEscuela where CodEscuela=@CodEscuela
		end
end
go
---Buscamos algunas escuelas
exec spBuscarEscuela 'E01'
exec spBuscarEscuela 'E07'