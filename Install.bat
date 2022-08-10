echo Instalador de la base de datos Universidad
echo Autor: Mendoza Segovia, Kelma
echo 9 de agosto de 2022
sqlcmd -Slocalhost\SQLEXPRESS11 -E -i BDUniversidad.sql
sqlcmd -Slocalhost\SQLEXPRESS11 -E -i BDUniversidadPA.sql
sqlcmd -Slocalhost\SQLEXPRESS11 -E -i TEscuelaPA.sql
sqlcmd -Slocalhost\SQLEXPRESS11 -E -i TAlumnoPA.sql
echo Se ejecutó correctamente la base de datos
pause