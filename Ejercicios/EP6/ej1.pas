program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
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

{
a. Indicar qué hace el programa. Crea una lista de numeros enteros
b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0. 48,13,21,10,nil
c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista.
}