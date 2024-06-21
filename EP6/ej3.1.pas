{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).}

program ejercicio2;
type
    lista = ^nodo;
    persona = record
        dni: integer;
        nombre: string;
        apellido: string;
    end;
    nodo = record
        dato: persona;
        sig: lista;
    end;

procedure leerPersona(var p: persona); { Creo que deberia de ser var el parametro }
begin
    write('DNI: '); readln(p.dni);
    if (p.dni <> 0)then begin
        write('Nombre: '); readln(p.nombre);
        write('Apellido: '); readln(p.apellido);
    end;
end;

{Agrega un nodo a la lista}
procedure agregarAtras(var l:lista;p:persona); { Deberia de ser var el parametro de lista }
var
    nue, act: lista;
begin
    { Falta crear un nodo aca, new(aux)}
    new(nue);
    nue^.dato:=p;
    nue^.sig:=nil;

    if (l=nil) then
        l:=nue
    else begin
        act:= l;
        while (act^.sig <> nil) do
            act:= act^.sig;
        act^.sig:= nue;
    end;
end;

{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
    p:persona; { deberia de pasar una variable del registro persona }
begin
    leerPersona(p); { y pasar por parametro el registro p:persona}
    while (p.dni <> 0) do begin
        agregarAtras(l,p);
        leerPersona(p)
        { falto un leerPersona para pasar al siguiente nodo}
    end;
end;

procedure imprimirInformacion(l:lista); { no debe ser variable el parametro}
begin
    while (l <> nil) do begin
        writeln('DNI: ', l^.dato.dni, ' Nombre: ',
        l^.dato.nombre, ' Apellido: ', l^.dato.apellido); { l^.dato.apellido y lo mismo con nombre}
        l:= l^.sig;
    end;
end;

{Programa principal}
var
    l:lista;
begin
    { no se inicializo la lista con nil }
    l:=nil;
    generarLista(l);
    imprimirInformacion(l);
end.