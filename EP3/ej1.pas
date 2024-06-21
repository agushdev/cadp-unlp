{Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe
la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
procesarse. Nota: utilizar el módulo leer.
Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el
nombre del alumno con mejor promedio.}

program Registros;

type
    str20 = string[20];
    alumno = record
        codigo : integer;
        nombre : str20;
        promedio : real;
end;

procedure leer(var alu : alumno);
begin
    write('Ingrese el codigo del alumno: '); readln(alu.codigo);
    if (alu.codigo <> 0) then begin
        write('Ingrese el nombre del alumno: '); readln(alu.nombre);
        write('Ingrese el promedio del alumno: '); readln(alu.promedio);
    end;
end;

procedure actualizarMejor(var nombre:str20; var promedio:real; var mejorAlumno:str20; var mejorPromedio:real);
begin
    if (promedio>mejorPromedio)then begin
        mejorPromedio:=promedio;
        mejorAlumno:=nombre;
    end;
end;

{ declaración de variables del programa principal }
var
    a: alumno;
    mejorAlumno:str20;
    mejorPromedio:real;
    cantA: integer;
{ cuerpo del programa principal }
begin
    cantA:=0;
    mejorPromedio:=-1;
    leer(a);
    actualizarMejor(a.nombre,a.promedio,mejorAlumno,mejorPromedio);
    while a.codigo<>0 do begin
        cantA:=cantA+1;
        leer(a);
        actualizarMejor(a.nombre,a.promedio,mejorAlumno,mejorPromedio);
    end;
    writeln('La cantidad de alumnos es de: ',cantA);
    writeln('El alumno con mejor promedio es: ',mejorAlumno,' con: ',mejorPromedio:0:2);
end.