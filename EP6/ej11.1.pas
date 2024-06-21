{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el
promedio obtenido durante toda su carrera.
Implementar un programa que:}
{a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.}

program a;

type
    egresado=record
        nroAlumno:integer;
        apellido:string[20];
        promedio:real;
    end;

    lista=^nodo;

    nodo=record
        elem:egresado;
        sig:lista;
    end;

    vector=array[1..10] of egresado;

procedure cargarNodo(var l:lista; e:egresado);
var
    aux:lista;
begin
    new(aux);
    aux^.elem:= e;
    aux^.sig:= l;
    l:=aux;
end;

procedure leerEgresado(var e:egresado);
begin
    write('Ingrese num de alumno: '); readln(e.nroAlumno);
    if (e.nroAlumno <> 0) then begin
        write('Ingrese apellido de alumno: '); readln(e.apellido);
        write('Ingrese promedio de alumno: '); readln(e.promedio);
    end;
end;

procedure cargarLista(var l:lista);
var
    e:egresado;
begin
    leerEgresado(e);
    while (e.nroAlumno <> 0) do begin
        cargarNodo(l,e);
        leerEgresado(e);
    end;    
end;

var
    l:lista;
begin
    l:=nil;
    cargarLista(l);
end.