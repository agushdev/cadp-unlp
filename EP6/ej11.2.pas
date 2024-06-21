{b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado
(de mayor a menor).}

// UNICO SIN HACER
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

procedure inicializarPromedio(var v:vector);
var
    i:integer;
begin
    for i := 1 to 10 do begin
        v[i].nroAlumno := 0;
        v[i].apellido := '';
        v[i].promedio := 0.0;
    end;
end;

procedure juntarMejores(var v:vector);
var
    i,j,max:integer;
    temp:egresado;
begin
    for i:=1 to 9 do begin
        max:= i;
        for j:=i+1 to 10 do begin
            if (v[j].promedio > v[max].promedio) then
                max:=j;
        end;
        temp:= v[i];
        v[i]:= v[max];
        v[max]:= temp;
    end;
end;

procedure imprimirEgresados(var v:vector);
var i:integer;
begin
    writeln('Lista de egresados ordenados por promedio (de mayor a menor):');
    for i := 1 to 10 do begin
        if (v[i].nroAlumno <> 0) then begin
            writeln('Numero de alumno: ', v[i].nroAlumno);
            writeln('Apellido: ', v[i].apellido);
            writeln('Promedio: ', v[i].promedio:0:2);
            writeln('---------------------');
        end;
    end;
end;

var
    lis:lista;
    vec:vector;
begin
    lis:=nil;
    cargarLista(lis);
    inicializarPromedio(vec);

    while (lis <> nil)do begin
        juntarMejores(vec);
        lis:= lis^.sig;
    end;

    imprimirEgresados(vec);
end.