{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
b) Apellido y nombre de los dos alumnos de mayor edad.}

program a;
const 
    dimF=3;
    anioActual=2024;
type
    str20=string[20];
    ingresantes=record
        nroInscripcion:integer;
        dni:integer;
        apellido:str20;
        nombre:str20;
        anioNacimiento:integer;
    end;
    vector=array[1..dimF] of ingresantes;

procedure leerVector(var v:vector);
var 
    i:integer;
begin
    for i:=1 to dimF do begin
        write('Ingrese numero de inscripcion: '); readln(v[i].nroInscripcion);
        write('Ingrese numero de dni: '); readln(v[i].dni);
        write('Ingrese apellido: '); readln(v[i].apellido);
        write('Ingrese nombre: '); readln(v[i].nombre);
        write('Ingrese anioNacimiento: '); readln(v[i].anioNacimiento);
    end;
end;

function detectarDniDigPares(dni:integer):boolean; //a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.}
var
    digito:integer;
begin
    detectarDniDigPares:=true;
    while (dni>0) do begin
        digito:= dni mod 10; // obtener el ultimo digito
        if (digito mod 2) <> 0 then begin
            detectarDniDigPares:=false;
            break;
        end;
        dni := dni div 10; // eliminar ultimo digito
    end;    
end;

function calcularPorcentajeDniPares(const v:vector):real;
var
    i,contPares:integer;
begin
    contPares:=0;

    for i:=1 to dimF do begin
        if detectarDniDigPares(v[i].dni) then begin
            contPares:= contPares+1;
        end;
    end;
    calcularPorcentajeDniPares:= (contPares / dimF) * 100;
end;

procedure nombreApellidoMayorEdad(var v:vector; var mayor1,mayor2:ingresantes); // b) Apellido y nombre de los dos alumnos de mayor edad.
var 
    i,edad,edad1,edad2:integer;
begin
    if (v[i].anioNacimiento < v[2].anioNacimiento) then begin
        mayor1:= v[1];
        mayor2:= v[2];
    end
    else begin
        mayor1:=v[2];
        mayor2:=v[1];
    end;

    for i := 3 to dimF do
    begin
        edad := anioActual - v[i].anioNacimiento; // Calcular la edad
        edad1 := anioActual - mayor1.anioNacimiento;
        edad2 := anioActual - mayor2.anioNacimiento;

        if edad > edad1 then
        begin
            mayor2 := mayor1; // Mover el más viejo a la segunda posición
            mayor1 := v[i];   // Actualizar el más viejo
        end
        else if edad > edad2 then
        begin
            mayor2 := v[i]; // Actualizar el segundo más viejo
        end;
    end;
end;

var
    vec:vector;
    porcentaje:real;
    mayor1, mayor2: ingresantes;
begin
    leerVector(vec);
    porcentaje:= calcularPorcentajeDniPares(vec);
    writeln('Porcentaje de alumnos con dni con solo dig pares: ', porcentaje:0:2,'%');
    nombreApellidoMayorEdad(vec,mayor1,mayor2);

    writeln('El alumno mas viejo es ', mayor1.apellido, ' ', mayor1.nombre);
    writeln('El segundo alumno mas viejo es ', mayor2.apellido, ' ', mayor2.nombre);
end.