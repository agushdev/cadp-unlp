{b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes
en espera, asigna un número al cliente y retorna la lista de espera actualizada.}

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

{b. Implementar el módulo RecibirCliente, que recibe como 
parámetro el DNI del cliente y la lista de clientes
en espera, asigna un número al cliente y retorna la lista de espera actualizada.}

procedure recibirCliente(var pI,pU:lista; dni:integer);
var
    c:clientes;
    ultNum:integer;
begin
    if (pU = nil) then
        ultNum:=0
    else
        ultNum:= pU^.elem.numero;
    c.dni := dni;
    c.numero := ultNum+1;
    agregarAtras(pI,pU,c);
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
    
    recibirCliente(pI, pU, 1234);
    recibirCliente(pI, pU, 2341);
    recibirCliente(pI, pU, 4523);

    writeln('Lista de espera:');
    imprimirLista(pI);
end.