{La cátedra de CADP necesita un programa para generar el listado de alumnos ingresantes que rendirán el parcial. 
Para ello, la cátedra DISPONE de un listado con todos alumnos que ingresaron este año a la facultad. 
De cada alumno se conoce su DNI, nombre y apellido, nota obtenida en curso de ingreso (entre 4 y 10),
turno (entre 1 y 4) y si estuvo presente o ausente en cada una de las 12 clases de práctica.

a) Realizar un módulo que reciba la información de los alumnos y retorne una nueva estructura de datos que contenga 
sólo aquellos alumnos que podrán rendir el parcial. Para poder rendir el parcial, los alumnos deben contar con al menos 8 asistencias en las 12 clases de práctica.

b) Realizar un módulo que reciba la estructura de datos generada en el inciso anterior, e IMPRIMA en pantalla:

1) Apellido y nombre y el DNI de los alumnos que hayan obtenido nota 8 o superior en el ingreso

2) Turno con mayor cantidad de alumnos en condiciones de rendir el examen.

3) Cantidad de alumnos que no posean ningún dígito cero en su DNI.

NOTA: Implementar el programa principal.}

program alumnos;

const
    clases=12;
    turnos=4;
type
    rangoNota= 4..10;
    rangoTurno= 1..turnos;
    rangoClases= 1..clases;

    vectorClases= array[rangoClases] of boolean;

    alumno= record
        dni: integer;
        nombreApellido: string[40];
        notaIngreso: rangoNota;
        turno: rangoTurno;
        asistencias: vectorClases;
    end;
    lista= ^nodo;
    nodo= record
        elem: alumno;
        sig: lista;
    end;

    vectorTurno= array[rangoTurno] of integer;

procedure cargarLista(var l:lista); // Se dispone

procedure inicializarVector(var vT:vectorTurno);
var i:integer;
begin
    for i:=1 to turnos do vT[i]:=0;
end;

procedure agregarAdelante(var l:lista; a:alumno);
var nue:lista;
begin
    new(nue);
    nue^.elem:= a;
    nue^.sig:= l;
    l:= nue;
end;

function cumple(vC:vectorClases): boolean;
var i,cant: integer;
begin
    cant:= 0;
    for i:=1 to clases do begin
        if(vC[i]) then cant:= cant + 1;
    end;
    cumple:= (cant >= 8);
end;

procedure procesarAlumnos(l:lista; var l2:lista);
var
    a: alumno;
begin
    l2:=nil;
    while(l<>nil)do begin
        a:= l^.elem;
        if(cumple(a.asistencias)) then agregarAdelante(l2,a);
        l:= l^.sig;
    end;
end;

function cumpleSinCeros(num:integer): integer;
var
    dig,cant:integer;
begin
    cant:=0;
    while (num<>0)do begin
        dig:=num mod 10;
        if (dig = 0)then cant:= cant + 1;
        num:= num div 10;
    end;
    cumpleSinCeros:= cant;
end;

function max(vT:vectorTurno): rangoTurno;
var
    i,maxTurno: rangoTurno;
    maxAlumno: integer;
begin
    maxAlumno:=-1;
    for i:=1 to turnos do begin
        if(vT[i] > maxAlumno)then begin
            maxAlumno:= vT[i];
            maxTurno:= i;
        end;
    end;
    max:= maxTurno;
end;

procedure incisoB(l2:lista);
var
    vT: vectorTurno;
    cantAlumnos: integer;
begin
    inicializarVector(vT);
    cantAlumnos:= 0;
    while (l2<>nil) do begin
        if (l^.elem.notaIngreso >=8) then writeln(l^.elem.nombreApellido,l^.elem.dni);
        vT[l^.elem.turno]:= vT[l^.elem.turno] + 1;
        if (cumpleSinCeros(l^.elem.dni) = 0) then cantAlumnos:= cantAlumnos + 1;
        l:= l^.sig;
    end;
    writeln(max(vT));
    writeln(cantAlumnos);
end;

var
    l,l2:lista;
begin
    l:=nil;
    cargarLista(l); // Se dispone
    procesarAlumnos(l,l2);
    incisoB(l2);
end.