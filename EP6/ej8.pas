{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista
queden ordenados de manera ascendente (insertar ordenado).}

program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure armarNodo(var L: lista; v: integer);
var
    nue, act, ant : lista;
begin
    new(nue);
    nue^.num := v;
    ant:= l;
    act:= l;

    while (act<>nil) and (act^.num < v) do begin
        ant:= act;
        act:= act^.sig;
    end;
    
    if(ant = act) then
        l:= nue
    else
        ant^.sig:= nue;
    nue^.sig:= act;
end;

procedure imprimirlista(l:lista);
begin
    while(l <> nil) do begin
        writeln(l^.num);
        l:= l^.sig;
    end;
end;

procedure incrementarLista(var l:lista; valor:integer);
var
    nue: lista;
begin
    nue:=l;
    while (nue<>nil) do begin
        nue^.num := nue^.num + valor;
        nue:= nue^.sig;
    end;
end;

var
    pri : lista;
    valor, incremento : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    writeln('Lista ingresada: ');
    imprimirlista(pri); { imprimir lista }

    writeln('Ingrese valor para incrementar cada elem de la lista');
    read(incremento);
    incrementarLista(pri, incremento);
    writeln('Lista incrementada: ');
    imprimirLista(pri);
end.