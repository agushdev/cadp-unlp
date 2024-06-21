{2. Dado el siguiente código que lee información de personas hasta que se ingresa la persona con dni 0 y luego
imprime dicha información en el orden inverso al que fue leída, identificar los 9 errores.}

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

procedure leerPersona(p: persona); { Creo que deberia de ser var el parametro }
begin
    read(p.dni);
    if (p.dni <> 0)then begin
        read(p.nombre);
        read(p.apellido);
    end;
end;

{Agrega un nodo a la lista}
procedure agregarAdelante(l:lista;p:persona); { Deberia de ser var el parametro de lista }
var
    aux: lista;
begin
    { Falta crear un nodo aca, new(aux)}
    aux^.dato:= p;
    aux^.sig:= l;
    l:= aux;
end;

{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
    p:nodo; { deberia de pasar una variable del registro persona }
begin
    leerPersona(p); { y pasar por parametro el registro p:persona}
    while (p.dni <> 0) do begin
        agregarAdelante(l,p);
        { falto un leerPersona para pasar al siguiente nodo}
    end;
end;

procedure imprimirInformacion(var l:lista); { no debe ser variable el parametro}
begin
    while (l <> nil) do begin
        writeln('DNI: ', l^.dato.dni, 'Nombre:',
        l^.nombre, 'Apellido:', l^.apellido); { l^.dato.apellido y lo mismo con nombre}
        l:= l^.sig;
    end;
end;

{Programa principal}
var
    l:lista;
begin
    { no se inicializo la lista con nil }
    generarLista(l);
    imprimirInformacion(l);
end.

{ Aclare los 9 errores. }