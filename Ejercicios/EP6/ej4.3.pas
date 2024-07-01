{
    Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la
lista que son múltiplos de A.
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

procedure multiplo(l:lista; valor:integer; var contMultiplo:integer);
begin
    while(l<>nil) do begin
        if((l^.num mod valor) = 0) then
            contMultiplo:= contMultiplo+1;
        l:=l^.sig 
    end;
end;

var
    pri : lista;
    valor, incremento, contMultiplo,a: integer;
begin
    contMultiplo:=0;
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

    write('Ingrese valor a para buscar multiplos'); read(a);
    writeln('Encontrar multiplos de ',a);
    multiplo(pri,a,contMultiplo);
    writeln(contMultiplo);
end.