{
10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un
número (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado por su
número, en cuyo caso sale de la lista de espera. Se pide:
}

{a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.}

program a;

type
    clientes=record
        dni:integer;
        numero:integer;
    end;

    lista=^nodo;
    nodo=record
        elem:clientes;
        sig:lista;
    end;

procedure agregarAtras (var pI,pU:lista; c:clientes);
var
    aux:lista;
begin
    new(aux);
    aux^.elem:= c;
    aux^.sig:= nil;

    if(pI = nil) then begin
        pI:=aux;
        pU:=aux;
    end else begin
        pU^.sig:= aux;
        pU:= aux;
    end;
end;

procedure leerCliente(var c:clientes; num:integer);
begin
    writeln('Ingrese DNI del cliente (0 para terminar): ');
    readln(c.dni);
    if c.dni <> 0 then
        c.numero := num;
end;

procedure cargarLista(var pI,pU:lista);
var
    c:clientes;
    num:integer;
begin
    num:=1;
    leerCliente(c,num);
    while (c.dni <> 0) do begin
        agregarAtras(pI,pU,c);
        num:= num+1;
        leerCliente(c,num);
    end;
end;

procedure imprimirLista (var l:lista);
begin
    while (l<>nil) do begin
        writeln('El dni es: ',l^.elem.dni);
        writeln('El num es: ',l^.elem.numero);
        l:= l^.sig;
    end;
end;

var
    pI,pU:lista;
begin
    pI:=nil;
    pU:=nil;
    cargarLista(pI,pU);
    writeln('Lista de espera:');
    imprimirLista(pI);
end.