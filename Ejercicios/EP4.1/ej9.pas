{Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).
8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
b) Apellido y nombre de los dos alumnos de mayor edad.}

program a;
const
    cantAlum=3;
type
    str20=string[20];
    alumno=record
        nroInscripcion:integer;
        dni:integer;
        apellido:str20;
        nombre:str20;
        anioNacimiento:integer;
    end;
    vector=array[1..cantAlum] of alumno;

procedure cargarVector(var v:vector; var dimL:integer);
var i:integer;
begin
    dimL:=0;
    writeln('Ingrese los datos de los registros. Ingrese -1 en el DNI para finalizar.');
    for i := 1 to cantAlum do
    begin
        write('Ingrese numero de dni: '); 
        readln(v[i].dni);

        if v[i].dni = -1 then
            Break;  // Salir del bucle si se ingresa -1 en el DNI
        
        write('Ingrese numero de inscripcion: '); 
        readln(v[i].nroInscripcion);
        write('Ingrese apellido: '); 
        readln(v[i].apellido);
        write('Ingrese nombre: '); 
        readln(v[i].nombre);
        write('Ingrese anio de nacimiento: '); 
        readln(v[i].anioNacimiento);

        dimL := dimL + 1;
    end;
end;

procedure imprimirVector(var v:vector; var dimL:integer);
var i:integer;
begin
    writeln('Listado de alumnos:');
    writeln('------------------');
    for i:=1 to dimL do begin
        writeln('Alumno ', i, ':');
        writeln('Numero de inscripcion: ', v[i].nroInscripcion);
        writeln('Numero de dni: ', v[i].dni);
        writeln('Apellido: ', v[i].apellido);
        writeln('Nombre: ', v[i].nombre);
        writeln('Anio de nacimiento: ', v[i].anioNacimiento);
        writeln();
    end;
end;

procedure nombreApellidoMayores(var v:vector; dimL:integer; var nombre1,apellido1,nombre2,apellido2: str20);
var i,max1,max2:integer;
begin
    // caso que la dimLogica sea menor a 2
    if dimL<2 then begin
        writeln('No hay suficientes alumnos para encontrar los dos mas grandes.');
        exit;
    end;

    //inicializar indices y anios de nacimiento de los ams grandes
    if v[1].anioNacimiento < v[2].anioNacimiento then begin
        max1:=1;
        max2:=2;
    end
    else begin
        max1:=2;
        max2:=1;
    end;

    //recorrer vector para encontrar los dos alumnos mas grandes
    for i:=3 to dimL do begin
        if v[i].anioNacimiento < v[max1].anioNacimiento then begin
            max2:=max1;
            max1:=i;
        end
        else if v[i].anioNacimiento < v[max2].anioNacimiento then begin
            max2:=i;
        end;
    end;
    nombre1:= v[max1].nombre;
    apellido1 := v[max1].apellido;
    nombre2 := v[max2].nombre;
    apellido2 := v[max2].apellido;
end;

procedure imprimirMasGrandes(const nombre1, apellido1, nombre2, apellido2: str20);
begin
    writeln('Los dos alumnos mas grandes son:');
    writeln('1. ', nombre1, ' ', apellido1);
    writeln('2. ', nombre2, ' ', apellido2);
end;

var
    dimL:integer;
    vec:vector;
    nombre1,nombre2,apellido1,apellido2: str20;
begin
    nombre1:='';
    nombre2:='';
    apellido1:='';
    apellido2:='';
    dimL:=0;
    cargarVector(vec,dimL);
    imprimirVector(vec,dimL);
    nombreApellidoMayores(vec ,dimL ,nombre1 ,apellido1 ,nombre2 ,apellido2);
    imprimirMasGrandes(nombre1,apellido1,nombre2,apellido2);
end.
