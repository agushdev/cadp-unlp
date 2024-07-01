{Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de
inscripción 1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Nombre de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.}

program a;
var
  numeroInscripcion: Integer;
  apellido, nombre: String[50];
  min1, min2: Integer;
  max1, max2: Integer;
  apellidoMin1, apellidoMin2: String[50];
  nombreMax1, nombreMax2: String[50];
  cantAlumnos, cantPares: Integer;

procedure inicializarValores;
begin
    cantAlumnos:=0;
    cantPares:=0;

    min1:= MaxINT;
    min2:= MaxINT;
    max1:= -1;
    max2:= -1;
end;

procedure leerInfo(var numeroInscripcion:integer; var apellido:string; var nombre:string);
begin
    write('Ingrese numero de inscripcion: '); readln(numeroInscripcion);
    write('Ingrese apellido: '); readln(apellido);
    write('Ingrese nombre: '); readln(nombre);
end;

procedure actualizarMinimo (numeroInscripcion:integer; apellido:string; var min1:integer; var min2:integer; var apellidoMin1:string; var apellidoMin2:string);
begin
    if (numeroInscripcion<min1) then
    begin
        min2:=min1;
        apellidoMin2:=apellidoMin1;
        min1:=numeroInscripcion;
        apellidoMin1:=apellido;
    end
    else if(numeroInscripcion<min2) then
    begin
        min2:=numeroInscripcion;
        apellidoMin2:=apellido;
    end;
end;

procedure actualizarMaximo(numeroInscripcion:integer; nombre:string; var max1:integer; var max2:integer; var nombreMax1:string; var nombreMax2:string);
begin
    if (numeroInscripcion>max1) then
    begin
        max2:=max1;
        nombreMax2:=nombreMax1;
        max1:=numeroInscripcion;
        nombreMax1:=nombre;
    end
    else if(numeroInscripcion>max2) then
    begin
        max2:=numeroInscripcion;
        nombreMax2:=nombre;
    end;
end;

function calcularPorcentajePares(cantAlumnos, cantPares: integer): real;
begin
  if cantAlumnos = 0 then
    calcularPorcentajePares := 0
  else
    calcularPorcentajePares := (cantPares / cantAlumnos) * 100;
end;

procedure MostrarResultados(min1, min2: Integer; apellidoMin1, apellidoMin2: String;
                            max1, max2: Integer; nombreMax1, nombreMax2: String;
                            porcentajePares: Real);
begin
  writeln('Apellidos de los dos alumnos con el numero de inscripcion mas chico: ', apellidoMin1, ', ', apellidoMin2);
  writeln('Nombres de los dos alumnos con el numero de inscripcion mas grande: ', nombreMax1, ', ', nombreMax2);
  writeln('Porcentaje de alumnos con numero de inscripcion par: ', porcentajePares:0:2, '%');
end;

begin
    inicializarValores;
repeat
    leerInfo(numeroInscripcion,apellido,nombre);
    
    cantAlumnos:=cantAlumnos+1;

    if(numeroInscripcion mod 2 = 0) then
        cantPares:=cantPares+1;
    
    actualizarMinimo(numeroInscripcion,apellido,min1,min2,apellidoMin1,apellidoMin2);
    actualizarMaximo(numeroInscripcion,nombre,max1,max2,nombreMax1,nombreMax2);

until (numeroInscripcion=1200);

cantAlumnos:=cantAlumnos-1;

MostrarResultados(min1, min2, apellidoMin1, apellidoMin2, max1, max2, nombreMax1, nombreMax2,calcularPorcentajePares(cantAlumnos, cantPares));
end.