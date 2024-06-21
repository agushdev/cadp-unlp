{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en
caso contrario.}

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

function estaOrdenada(l:lista):boolean;
var
    aux:lista;
    orden:boolean;
    mayor:integer;
begin
    orden:=true;
    mayor:=-1;
    aux:=l;
    while(aux<>nil) and (orden=true)do begin
        if(aux^.num > mayor)then begin
            mayor:= aux^.num;
            writeln('bien');
        end
        else begin
           orden:=false;
           writeln('no esta ordenada') 
        end;
        aux:= aux^.sig;
    end;
    estaOrdenada:=orden;
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

    estaOrdenada(pri);
end.