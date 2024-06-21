{
    4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
}
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

procedure buscarMax(l:lista; var max:integer);
begin
    while(l<>nil)do begin
        if (l^.num > max) then
            max:= l^.num;
        l:= l^.sig;
    end;
end;

var
    pri : lista;
    valor, incremento : integer;
    max:integer;
begin
    max:=-9999;
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

    buscarMax(pri,max);
    writeLn('El numero maximo de la lista es: ', max);

end.