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

procedure agregarFinal(var lInicio,lFinal:lista; valor:integer);
var
    lNue:lista;
begin
    new(lNue);
    lNue^.num:=valor; 
    lNue^.sig:=nil;
    if (lInicio=nil) then
        lInicio:= lNue
    else
        lFinal^.sig:= lNue;
    lFinal:= lNue;
end;

procedure cargarNum(var valor:integer);
begin
        write('Ingrese un numero: ');
        readln(valor);
end;

procedure cargarLista(var lI,lF:lista);
var valor:integer;
begin
    cargarNum(valor);
    while(valor<>0)do begin
        agregarFinal(lI,lF,valor);
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
    pri,ult : lista;
    incremento : integer;
begin
    pri := nil;
    ult := nil;

    cargarLista(pri,ult);

    writeln('Lista ingresada: ');
    imprimirlista(pri); { imprimir lista }
end.