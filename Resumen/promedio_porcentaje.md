# **APRENDIENDO A CALCULAR PROMEDIOS Y PORCENTAJES EN:**
# *Pascal*
<img src='./data/pascal.png' width='350' height='225'>

## Promedio: Lo utilizamos para calcular un promedio.
### Por ejemplo, si necesitamos calcular el promedio de notas de Carlos, Pedro y Felipe.
### Carlos se saco un 5, Pedro un 9 y Felipe un 7.
````pascal
var
    carlos,pedro,felipe,alumnos,total:integer;
    promedio:real;
begin
    alumnos:=3; // La cantidad de alumnos Carlos, Pedro y Felipe
    carlos:= 5; // Nota de carlos
    pedro:= 9; // Nota de Pedro
    felipe:= 7; // Nota de Felipe
    total:= carlos + pedro + felipe; // Total de Nota
    promedio:= total/alumnos; // Promedio de Alumno
end;
````

## Porcentaje: Lo utilizamos para calcular un porcentaje.
### Siguiendo el anterior ejemplo, calcular el porcentaje de la nota de Pedro, si la nota maxima es 15:
````pascal
const
    notaMax=15;
var
    pedro:integer;
    porcentaje:real;
begin
    pedro:= 9; // Nota de Pedro
    porcentaje:= (pedro / 100)*notaMax; // Porcentaje de la nota de Pedro.
end;
````