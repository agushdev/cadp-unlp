{e. Modifique el módulo Sublista del inciso anterior, 
suponiendo que la lista L se encuentra ordenada de
manera descendente.}

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

//b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina 
//dicho valor de la lista (si existe). Nota:
//la lista podría no estar ordenada.

procedure eliminarNum (var l:lista; v:integer);
var
    act,ant:lista;
begin
    act:=l;
    while (act<>nil) and (act^.num <> v) do begin
        ant:=act;
        act:= act^.sig;
    end;
    if(act<>nil) then
        if(act=l) then
            l:= l^.sig
        else
            ant^.sig:= act^.sig;
        dispose(act);
end;

//c. Sublista: recibe como parámetros la lista L y dos valores 
//enteros A y B, y retorna una nueva lista con todos
//los elementos de la lista L mayores que A y menores que B.

{d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L 
se encuentra ordenada de manera ascendente.}

{procedure subLista(l:lista; a,b:integer; var subL:lista);
var
    aux:lista;
begin
    subl:=nil;
    aux:=l;

    while (aux<>nil) do begin
        if(aux^.num > a) and (aux^.num < b ) then begin
            armarNodo(subL,aux^.num);
        end;
        aux:= aux^.sig;
    end;
end;}


var
    pri,subL : lista;
    valor, eliminarValor, a, b: integer;
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

    writeln('Ingrese valor para eliminar de la lista');
    read(eliminarValor);
    eliminarNum(pri, eliminarValor);
    writeln('Lista despues de eliminar el valor: ');
    imprimirLista(pri);

    write('Ingrese A (limite inferior): '); readLn(a);
    write('Ingrese B (limite superior): '); readLn(b);
    subLista(pri,a,b,subL);
    writeln('Sublista con elementos mayores que ', a, ' y menores que ', b, ':');
    imprimirLista(subL);
end.