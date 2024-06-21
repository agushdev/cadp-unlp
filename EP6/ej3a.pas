{
 3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).
}

program hola;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure agregarFinal(var l:lista; valor:integer);
var
    lNue,lActual:lista;
begin
    new(lNue);
    lNue^.num:=valor; 
    lNue^.sig:=nil;

    if (l = nil) then
        l := lNue
    else begin
        lActual := l;
        while(lActual^.sig<>nil) do
            lActual:= lActual^.sig;
        lActual^.sig:= lNue;
    end;
end;

procedure cargarNum(var valor:integer);
begin
        write('Ingrese un numero: ');
        readln(valor);
end;

procedure cargarLista(var l:lista);
var valor:integer;
begin
    l:= nil;
    cargarNum(valor);
    while(valor<>0)do begin
        agregarFinal(l,valor);
        cargarNum(valor);
    end;
end;

procedure imprimirlista(l:lista);
begin
    while(l <> nil) do begin
        writeln(l^.num);
        l:= l^.sig;
    end;
end;

var
    pri: lista;
begin
    pri := nil;
    cargarLista(pri);

    writeln('Lista ingresada: ');
    imprimirlista(pri); { imprimir lista }
end.